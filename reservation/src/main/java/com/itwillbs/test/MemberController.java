package com.itwillbs.test;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.test.handler.MyPasswordEncoder;
import com.itwillbs.test.service.AssignmentService;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.service.PayService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.PayVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private PayService payService;
	@Autowired
	private AssignmentService assignmentService;
	
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동 
	@GetMapping("member")
	public String member(HttpServletRequest request, HttpServletResponse response,
	        Model model, HttpSession session) {
		
		if(session.getAttribute("sId") == null || session.getAttribute("cId") != null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		
		return "member/memberForm";
	}
	
	// 비밀번호 입력 후 내정보 수정 페이지로 이동
	@PostMapping("memberInfo")
	public String memberInfo(HttpSession session, String id, String passwd, HttpServletRequest request, HttpServletResponse response,
        Model model) {
		
	MemberVO member = service.isCorrectMember(id);
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	if(member == null || !passwordEncoder.matches(passwd, member.getM_passwd())) {
		try {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w;
			w = response.getWriter();
			String msg = "비밀번호가 틀립니다!";
			w.write("<script>alert('"+msg+"');history.go(-1);</script>");
			w.flush();
			w.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "member/memberForm";
	}
		// 이메일 분리
		member.setM_email1(member.getM_email().split("@")[0]);
		member.setM_email2(member.getM_email().split("@")[1]);
		
		
		model.addAttribute("member", member);
		return "member/memberInfo";
	}
	
	// 회원 정보 수정 시
	@PostMapping("memberUpdate")
	public String memberUpdate(Model model, MemberVO member) {
		//암호화
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		String securePasswd = passwordEncoder.getCryptoPassword(member.getM_passwd());
		member.setM_passwd(securePasswd);
		
		service.updateMember(member);
		model.addAttribute("member", member);
		System.out.println(member);

			return "redirect:/member";
	}
	
	// 결제 폼 이동(임시) 
	@GetMapping("paymentForm")
	public String paymentForm(Model model, HttpServletRequest request, HttpServletResponse response) {
		// 테스트용 값
		model.addAttribute("name", "아이티윌bs");
		model.addAttribute("amount", 100);
		model.addAttribute("goodsname", "오마카세");
		model.addAttribute("buyer_email", "hong@hong.com");
		model.addAttribute("buyer_name", "홍길동");
		model.addAttribute("buyer_tel", "010-1234-5678");
		model.addAttribute("buyer_addr", "부산광역시 부산진구 부전동");
		model.addAttribute("merchant_uid", "ORD20180131-0000011");
		
		return "payment/payments";
	}
	
	// 예약 내역 클릭시 
	@GetMapping("memberRSList")
	public String memberRSList(Model model, HttpSession session) {
		
		if(session.getAttribute("sId") == null || session.getAttribute("cId") != null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		String sId = (String)session.getAttribute("sId");
		List<ReservationVO> resList = service.getMemberReservationList(sId);
		List<RestaurantVO> rsList = service.getMemberRestaurant(sId);
		
		// 결제정보 조회
		List<PayVO> payInfoList = payService.getPayInfo(sId);
		
		Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
		
		Set<String> uniqueDates = new LinkedHashSet<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");

		for (ReservationVO reservation : resList) {
		    Timestamp rDate = reservation.getR_date();
		    String dateString = dateFormat.format(rDate);
		    uniqueDates.add(dateString);
		}

		List<String> sortedDates = new ArrayList<>(uniqueDates);
		Collections.sort(sortedDates);
		Collections.reverse(sortedDates);

		model.addAttribute("payInfoList", payInfoList);
	    model.addAttribute("sortedDates", sortedDates);
		model.addAttribute("currentDateTime", currentDateTime);
		model.addAttribute("resList", resList);
		model.addAttribute("rsList", rsList);
		
		return "member/memberRSList";
	}
	
	// 양도 관리
	@GetMapping("memberAssignList")
	public String memberAssignList(Model model, HttpSession session) {
		
		if(session.getAttribute("sId") == null || session.getAttribute("cId") != null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		String sId = (String)session.getAttribute("sId");
		
		// 리스트 조회
		List<PayVO> payInfoList = payService.getPayInfo(sId);
		List<AssignmentVO> aList = assignmentService.getAssignInfo(sId);
		List<ReservationVO> resList = service.getMemberReservationList(sId);
		List<RestaurantVO> rsList = service.getMemberRestaurant(sId);

		model.addAttribute("payInfoList", payInfoList);
		model.addAttribute("aList", aList);
		model.addAttribute("resList", resList);
		model.addAttribute("rsList", rsList);
		
		return "member/memberAssignList";
	}
	
	// 내가 쓴 리뷰
	@GetMapping("memberReview") 
	public String memberReview(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg","접근권한이 없습니다.");
			return "fail_back";
		}
		
		List<ReviewVO> rvList = service.getReviewList(sId);
		
		model.addAttribute("rvList",rvList);
		
		return "member/memberReview";
	}
	
	// 회원탈퇴 
	@GetMapping("memberWithdrawal")
	public String memberWithdrawal(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null || session.getAttribute("cId") != null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		return "member/memberWithdrawal";
	}
	
	@PostMapping("memberWithdrawalPro")
	public String memberWithdrawalPro(HttpSession session, @RequestParam(defaultValue = "") String m_passwd, Model model) {
		
		if(m_passwd.equals("")) {
			model.addAttribute("msg","비밀번호를 입력해주세요.");
			return "fail_back";
		}
		
		String id = (String)session.getAttribute("sId");
		
		MemberVO member = service.isCorrectMember(id);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(!passwordEncoder.matches(m_passwd, member.getM_passwd())) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			return "fail_back";
		}
		
		int deleteCount = service.secessionMember(member.getM_idx());
		
		if(deleteCount <= 0) {
			model.addAttribute("msg","회원탈퇴를 실패하였습니다.");
			return "fail_back";
		}
		
		session.invalidate();
		
		model.addAttribute("success","회원탈퇴 되었습니다.\\n이후에 다시 뵙길 기원하겠습니다.");
		return "secession_success";
	}
	
	@PostMapping("ReviewPro")
	public String ReviewPro(ReviewVO review, Model model, HttpSession session) {

		System.out.println(review);
		
		if(review.getImg().getOriginalFilename().equals("")) {
			model.addAttribute("msg","이미지는 필수입니다.");
			return "fail_back";
		}
		
		// 파일 업로드할 경로
		String uploadDir = "resources/upload";
		
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		String subDir = ""; //서브디렉토리(날짜 구분)
		// 설정한 날짜별로 파일 생성
		try {
			// 오늘날짜 가지고 옴
			Date date = new Date();
			
			// 가지고 온 날짜를 yyyy/mm/dd 로 변경함 (/ 로 날짜별로 파일을 지정해 주기 위해)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
			
			//sdf 로 설정된 date를 subDir 에 저장하고 원 경로인 saveDir 과 경로를 합침
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			
			// 실제 경로를 관리하는 Path 객체를 리턴받음
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드를 호출하여 Path 객체가 관리하는 경로 생성
			// (존재하지 않으면 거쳐가는 경도들 중 없는 경로 모두 생성)
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 객체로 전달된 img 를 MultipartFile 객체로 꺼냄
		MultipartFile mFile1 = review.getImg();
		
		// 파일명 중복 방지를 위해
		// 렌덤 ID 값을 추출하여 파일명 앞에 붙여서
		// "렌덤값ID_파일명.확장자" 형식으로 중복 파일명 처리
		String uuid = UUID.randomUUID().toString();
		
		
		// 생성된 UUID 값과 업로드 파일명을 결합하여 VO 객체에 저장
		String fileName1 = uuid.substring(0,8)+"_"+mFile1.getOriginalFilename();
		
		review.setRv_img(subDir+"/"+fileName1);
		
		int insertCount = service.registReview(review);
		
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 리뷰목록으로 서블릿 리다이렉트
		if(insertCount > 0) {
			
			service.updateRvStatus(review.getR_idx());
			
			if(!mFile1.getOriginalFilename().equals("")) {
				try {
					mFile1.transferTo(new File(saveDir,fileName1));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
			return "redirect:/";
		} else {
			model.addAttribute("msg", "리뷰작성 실패");
			return "fail_back";
		}
		
	}
	
	@GetMapping("RvDelete")
	public String RvDelete(@RequestParam int rv_idx, Model model,HttpSession session) {
		
		
		System.out.println(rv_idx);
		
		int deleteCount = service.deletReview(rv_idx);
		
		if(deleteCount > 0) {
			return "redirect:memberReview";
		}
		
		model.addAttribute("msg", "리뷰삭제 실패");
		return "fail_back";
	}
	
}

package com.itwillbs.test;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

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

import com.itwillbs.test.handler.MyPasswordEncoder;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동
	@GetMapping("member")
	public String member(HttpServletRequest request, HttpServletResponse response,
	        Model model) {
		
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
		
		String sId = (String)session.getAttribute("sId");
		List<ReservationVO> resList = service.getMemberReservationList(sId);
		List<RestaurantVO> rsList = service.getMemberRestaurant(sId);
		
		Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
		
		model.addAttribute("currentDateTime", currentDateTime);
		model.addAttribute("resList", resList);
		model.addAttribute("rsList", rsList);
		
		return "member/memberRSList";
	}
	
//	// 내가 찜한 식당
//	@GetMapping("memberLike")
//	public String memberLike() {
//		return "member/memberLike";
//	}
	
	// 내가 쓴 리뷰
	@GetMapping("memberReview")
	public String memberReview() {
		return "member/memberReview";
	}
	
	// 회원탈퇴 
	@GetMapping("memberWithdrawal")
	public String memberWithdrawal() {
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
	
}

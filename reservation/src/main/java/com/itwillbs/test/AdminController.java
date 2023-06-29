
package com.itwillbs.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.test.service.AssignmentService;
import com.itwillbs.test.service.CeoService;
import com.itwillbs.test.service.HelpService;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.service.PayService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.service.ReviewService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.CeoVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.PayVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;

@Controller
public class AdminController {
	@Autowired
	MemberService mservice;
	@Autowired
	ReservationService rservice;
	@Autowired
	RestaurantService reservice;
	@Autowired
	AssignmentService aservice;
	@Autowired
	HelpService hservice;
	@Autowired
	PayService pservice;
	@Autowired
	ReviewService revservice;
	@Autowired
	CeoService cservice;
	//=============================== 관리자 페이지 메인 ==================================
	
	// 로그인 성공 후 관리자페이지 클릭 시 관리자페이지로 이동
	@GetMapping("adminMain")
	public String adminMain(Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		// 예약 목록 조회 / 역순 조회
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList" ,reservationList);
		List<ReservationVO> reservationDESCList = rservice.getReservationListDESC();
		model.addAttribute("reservationDESCList" ,reservationDESCList);
		
		// 일반 회원 목록 조회
		List<MemberVO> memberList = mservice.memberList();
		model.addAttribute("memberList", memberList);
		
		// 기업 회원 목록 조회
		List<CeoVO> ceoMemberList = cservice.ceoList();
		model.addAttribute("ceoMemberList", ceoMemberList);
		
		// 오늘 총 예약 수
		ReservationVO todayReservationCount = rservice.adminReservationCount(0);
		model.addAttribute("todayReservationCount" ,todayReservationCount);
		
		// 가게 목록 조회
		List<RestaurantVO> RestaurantList = reservice.getRestaurantList();
		model.addAttribute("RestaurantList", RestaurantList);
		return "admin/adminMain";
	}
	
	// 관리자 메인 페이지에서 전체 예약 확인하기 클릭 시 전체 예약 리스트 페이지로 이동
	@GetMapping("adminAllReservation")
	public String adminAllReservation(Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		return "admin/adminAllReservation";
	}
	
	// 관리자의 사이트 이용 통계 페이지로 이동
	@GetMapping("adminStatistics")
	public String adminStatistics(Model model, HttpServletRequest request, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		// 일반 회원 목록 조회
		List<MemberVO> memberList = mservice.memberList();
		model.addAttribute("memberList", memberList);
		
		// 기업 회원 목록 조회
		List<CeoVO> ceoMemberList = cservice.ceoList();
		model.addAttribute("ceoMemberList", ceoMemberList);
		
		// 지난 일자 가입자 수 조회
		MemberVO adminMemberCount = new MemberVO();
		for(int i = 0; i <= 6; i++) {
			adminMemberCount = mservice.adminMemberCount(i);
			model.addAttribute("adminMemberCount" + i, adminMemberCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminMemberCount == null) {
				MemberVO defaultVO = new MemberVO();
				defaultVO.setM_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminMemberCount" + i, defaultVO);
			}
			
		}
		
		// 지난 일자 일반 회원 총 가입자 수 조회
		MemberVO adminMemberTotalCount = new MemberVO();
		for(int i = 0; i <= 6; i++) {
			adminMemberTotalCount = mservice.adminMemberTotalCount(i);
			model.addAttribute("adminMemberTotalCount" + i, adminMemberTotalCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminMemberTotalCount == null) {
				MemberVO defaultVO = new MemberVO();
				defaultVO.setM_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminMemberTotalCount" + i, defaultVO);
			}
		}	
		
		// 지난 일자 기업 회원 가입자 수 조회
		CeoVO adminCEOMemberCount = new CeoVO();
		for(int i = 0; i <= 6; i++) {
			adminCEOMemberCount = cservice.adminCEOMemberCount(i);
			model.addAttribute("adminCEOMemberCount" + i, adminCEOMemberCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminMemberCount == null) {
				CeoVO defaultVO = new CeoVO();
				defaultVO.setC_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminCEOMemberCount" + i, adminCEOMemberCount);
			}
			
		}
		
		// 지난 일자 기업 회원 총 가입자 수 조회
		CeoVO adminCEOMemberTotalCount = new CeoVO();
		for(int i = 0; i <= 6; i++) {
			adminCEOMemberTotalCount = cservice.adminCEOMemberTotalCount(i);
			model.addAttribute("adminCEOMemberTotalCount" + i, adminCEOMemberTotalCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminCEOMemberTotalCount == null) {
				CeoVO defaultVO = new CeoVO();
				defaultVO.setC_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminCEOMemberTotalCount" + i, defaultVO);
			}
		}	
		
		// 예약 목록 조회
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList" ,reservationList);
		
		// 지난 일자 일일 예약 수 조회
		ReservationVO adminReservationCount = new ReservationVO();
		for(int i = 0; i <= 6; i++) {
			adminReservationCount = rservice.adminReservationCount(i);
			model.addAttribute("adminReservationCount" + i, adminReservationCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminReservationCount == null) {
				ReservationVO defaultVO = new ReservationVO();
				defaultVO.setC_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminReservationCount" + i, defaultVO);
			}
		}	
		
		// 지난 일자 총 예약 수 조회
		ReservationVO adminReservationTotalCount = new ReservationVO();
		for(int x = 0; x <= 6; x++) {
			adminReservationTotalCount = rservice.adminReservationTotalCount(x);
			model.addAttribute("adminReservationTotalCount" + x, adminReservationTotalCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminReservationTotalCount == null) {
				ReservationVO defaultVO = new ReservationVO();
				defaultVO.setC_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminReservationTotalCount" + x, defaultVO);
			}
		}
		
		// 가게 목록 조회
			List<RestaurantVO> RestaurantList = reservice.getRestaurantList();
			model.addAttribute("RestaurantList", RestaurantList);
		
		// 지난 일자 결제 금액 조회
		PayVO adminPaymentCount = new PayVO();
		for(int i = 0; i <= 6; i++) {
			adminPaymentCount = pservice.adminPaymentCount(i);
			model.addAttribute("adminPaymentCount" + i, adminPaymentCount);
			// 조회 결과가 없을 경우 0 값으로 대체
			if(adminPaymentCount == null) {
				PayVO defaultVO = new PayVO();
				defaultVO.setP_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminPaymentCount" + i, defaultVO);
			}
		}
		
		// 지난 일자 총 결제 금액 조회
		PayVO adminPaymentTotalCount = new PayVO();
		for(int x = 0; x <= 6; x++) {
			adminPaymentTotalCount = pservice.adminPaymentTotalCount(x);
			model.addAttribute("adminPaymentTotalCount" + x, adminPaymentTotalCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminPaymentTotalCount == null) {
				PayVO defaultVO = new PayVO();
				defaultVO.setP_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminPaymentTotalCount" + x, defaultVO);
			}
		}
		
		return "admin/adminStatistics";
	}
	
	// ================================ 회원 관리 페이지 ================================
	
	// 관리자의 일반 회원 관리 페이지로 이동
	@GetMapping("adminMember")
	public String adminMember(Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		}
		
		List<MemberVO> memberList = mservice.memberList();
		model.addAttribute("memberList", memberList);
		return "admin/adminMember";
	}
	
	// 관리자의 기업 회원 관리 페이지로 이동
	@GetMapping("adminCEOMember")
	public String adminCEOMember(Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		}
		
		List<CeoVO> ceoList = cservice.ceoList();
		model.addAttribute("ceoList", ceoList);
		return "admin/adminCEOMember";
	}
	
	// 회원 관리 페이지에서 회원 정보 수정 페이지 이동
	@GetMapping("deleteMemberForm")
	public String deleteMemberForm(@RequestParam String id, MemberVO member, Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		member = mservice.selectMember(id);
		model.addAttribute(member);
		return "admin/deleteMemberForm";
	}
	
	// 회원 정보 수정 시
	@PostMapping("adminMemberUpdate")
	public String adminMemberUpdate(Model model, MemberVO member, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		mservice.adminUpdateMember(member);
		model.addAttribute("member", member);
	return "redirect:/adminMember";
	}
	
	// 회원 삭제 시
	@GetMapping("deleteMember")
	public String deleteMember(@RequestParam String id, HttpSession session, Model model) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		mservice.deleteMember(id);
		
		return "redirect:/adminMember";
	}
	
	// 기업 회원 관리 페이지에서 기업 회원 정보 수정 페이지 이동
	@GetMapping("deleteCEOForm")
	public String deleteCEOForm(@RequestParam String id, CeoVO ceo, Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		ceo = cservice.selectCEOMember(id);
		model.addAttribute(ceo);
		return "admin/deleteCEOForm";
	}
	
	// 기업 회원 정보 수정 시
	@PostMapping("adminCEOMemberUpdate")
	public String adminCEOMemberUpdate(Model model, CeoVO ceo, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		cservice.adminCEOMemberUpdate(ceo);
		model.addAttribute("ceo", ceo);
		return "redirect:/adminCEOMember";
	}
	
	// 회원 삭제 시
	@GetMapping("deleteCEO")
	public String deleteCEO(@RequestParam String id, HttpSession session, Model model) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		cservice.deleteCEOMember(id);
		
		return "redirect:/adminCEOMember";
	}
	
	
	
	// ==================================================================================
	
	// ================================ 가게 관리 페이지 ================================
	
	// 관리자의 가게 관리 페이지로 이동
	@GetMapping("adminStore")
	public String adminStore(Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		List<RestaurantVO> restaurantList = reservice.getRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		return "admin/adminStore";
	}
	
	// 가게 관리 페이지에서 가게 정보 수정 페이지 이동
	@GetMapping("deleteStoreForm")
	public String deleteStoreForm(@RequestParam String idx, RestaurantVO res, Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		res = reservice.selectAdminRestaurant(idx);
		model.addAttribute(res);
		return "admin/deleteStoreForm";
	}
	
	// 가게 정보 수정 시
	@PostMapping("adminStoreUpdate")
	public String adminStoreUpdate(Model model, RestaurantVO res, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		reservice.adminRestaurantUpdate(res);
		model.addAttribute("res", res);
		return "redirect:/adminStore";
	}
	
	// 가게 삭제 시
	@GetMapping("deleteStore")
	public String deleteStore(@RequestParam int idx, Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		reservice.deleteRestaurant(idx);
		
		return "redirect:/adminStore";
	}
	
	// ==================================================================================
	
	// ================================ 예약 관리 페이지 ================================
	
	// 관리자의 예약 관리 페이지로 이동
	@GetMapping("adminReservation")
	public String adminReservation(Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList", reservationList);
		return "admin/adminReservation";
	}
	
	// 예약 관리 페이지에서 예약 정보 수정 페이지 이동
	@GetMapping("deleteReservationForm")
	public String deleteReservationForm(@RequestParam String idx, ReservationVO re, Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		re = rservice.selectReservation(idx);
		model.addAttribute(re);
		return "admin/deleteReservationForm";
	}
	
	// 예약 정보 수정 시
	@PostMapping("adminReservationUpdate")
	public String adminReservationUpdate(Model model, ReservationVO re,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		rservice.adminReservationUpdate(re);
		model.addAttribute("re", re);
		return "redirect:/adminReservation";
	}
	
	// 예약 삭제 시
	@GetMapping("deleteReservation")
	public String deleteReservation(@RequestParam String idx,HttpSession session, Model model) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		rservice.deleteReservation(idx);
		
		return "redirect:/adminReservation";
	}
	
	// ==================================================================================
	
	// ================================ 양도 관리 페이지 ================================
	// 관리자의 양도 관리 페이지로 이동
	@GetMapping("adminAssignment")
	public String adminAssignment(Model model,HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		List<AssignmentVO> assignmentList = aservice.getAdminAssignmentList();
		model.addAttribute("assignmentList", assignmentList);
		return "admin/adminAssignment";
	}
	
	// 양도 정보 삭제 시
	@GetMapping("deleteAssignment")
	public String deleteAssignment(@RequestParam String idx , HttpServletResponse response, HttpSession session, Model model) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		aservice.deleteAssignment(idx);
		return "redirect:/adminAssignment";
	}
	
	// ==================================================================================
	
	// ================================ 리뷰 관리 페이지 ================================
	// 관리자의 리뷰 관리 페이지로 이동
	@GetMapping("adminReview")
	public String adminReview(Model model, HttpSession session) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		List<ReviewVO> reviewList = revservice.getAdminReviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "admin/adminReview";
	}
	
	// 리뷰 정보 삭제 시
	@GetMapping("deleteReview")
	public String deleteReview(@RequestParam String idx , HttpServletResponse response,HttpSession session, Model model) {
		// 관리자 아이디 판별
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";			
		} 
		
		
		revservice.deleteReview(idx);
		return "redirect:/adminReview";
	}
	
	// ==================================================================================
	
}

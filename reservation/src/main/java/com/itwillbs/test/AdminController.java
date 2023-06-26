
package com.itwillbs.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.test.service.AssignmentService;
import com.itwillbs.test.service.HelpService;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;

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
	//=============================== 관리자 페이지 메인 ==================================
	
	// 로그인 성공 후 관리자페이지 클릭 시 관리자페이지로 이동
	@GetMapping("adminMain")
	public String adminMain(Model model) {
		// 예약 목록 조회
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList" ,reservationList);
		
		// 가게 목록 조회
		List<RestaurantVO> RestaurantList = reservice.getRestaurantList();
		model.addAttribute("RestaurantList", RestaurantList);
		return "admin/adminMain";
	}
	
	// 관리자 메인 페이지에서 전체 예약 확인하기 클릭 시 전체 예약 리스트 페이지로 이동
	@GetMapping("adminAllReservation")
	public String adminAllReservation() {
		return "admin/adminAllReservation";
	}
	
	// 관리자의 사이트 이용 통계 페이지로 이동
	@GetMapping("adminStatistics")
	public String adminStatistics(Model model, HttpServletRequest request) {
		// 회원 목록 조회
		List<MemberVO> memberList = mservice.memberList();
		model.addAttribute("memberList", memberList);
		
		// 예약 목록 조회
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList" ,reservationList);
		
		// 지난 일자 예약 수 조회
		ReservationVO adminReservationCount = new ReservationVO();
		for(int i = 0; i <= 6; i++) {
			adminReservationCount = rservice.adminReservationCount(i);
			model.addAttribute("adminReservationCount" + i, adminReservationCount);
			System.out.println(adminReservationCount);
			// 조회 결과 없을 경우 0 값으로 대체
			if(adminReservationCount == null) {
				ReservationVO defaultVO = new ReservationVO();
				defaultVO.setC_idx(0);
				defaultVO.setCount(0);
				model.addAttribute("adminReservationCount" + i, defaultVO);
			}
			
		}
		
		// 가게 목록 조회
			List<RestaurantVO> RestaurantList = reservice.getRestaurantList();
			model.addAttribute("RestaurantList", RestaurantList);
		
		// 총 결제 금액 조회
		int total = rservice.getTotalPay();
		request.setAttribute("total", total);
		
		return "admin/adminStatistics";
	}
	
	// ================================ 회원 관리 페이지 ================================
	
	// 관리자의 회원 관리 페이지로 이동
	@GetMapping("adminMember")
	public String adminMember(Model model) {
		List<MemberVO> memberList = mservice.memberList();
		model.addAttribute("memberList", memberList);
		return "admin/adminMember";
	}
	
	// 회원 관리 페이지에서 회원 정보 수정 페이지 이동
	@GetMapping("deleteMemberForm")
	public String deleteMemberForm(@RequestParam String id, MemberVO member, Model model) {
		member = mservice.selectMember(id);
		model.addAttribute(member);
		return "admin/deleteMemberForm";
	}
	
	// 회원 정보 수정 시
	@PostMapping("adminMemberUpdate")
	public String adminMemberUpdate(Model model, MemberVO member) {
		mservice.adminUpdateMember(member);
		model.addAttribute("member", member);
	return "redirect:/adminMember";
	}
	
	// 회원 삭제 시
	@GetMapping("deleteMember")
	public String deleteMember(@RequestParam String id) {
		mservice.deleteMember(id);
		
		return "redirect:/adminMember";
	}
	
	// ==================================================================================
	
	// ================================ 가게 관리 페이지 ================================
	
	// 관리자의 가게 관리 페이지로 이동
	@GetMapping("adminStore")
	public String adminStore(Model model) {
		List<RestaurantVO> restaurantList = reservice.getRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		return "admin/adminStore";
	}
	
	// 가게 관리 페이지에서 가게 정보 수정 페이지 이동
	@GetMapping("deleteStoreForm")
	public String deleteStoreForm(@RequestParam String idx, RestaurantVO res, Model model) {
		res = reservice.selectAdminRestaurant(idx);
		model.addAttribute(res);
		return "admin/deleteStoreForm";
	}
	
	// 가게 정보 수정 시
	@PostMapping("adminStoreUpdate")
	public String adminStoreUpdate(Model model, RestaurantVO res) {
		reservice.adminRestaurantUpdate(res);
		model.addAttribute("res", res);
		return "redirect:/adminStore";
	}
	
	// 가게 삭제 시
	@GetMapping("deleteStore")
	public String deleteStore(@RequestParam String idx) {
		reservice.deleteRestaurant(idx);
		
		return "redirect:/adminStore";
	}
	
	// ==================================================================================
	
	// ================================ 예약 관리 페이지 ================================
	
	// 관리자의 예약 관리 페이지로 이동
	@GetMapping("adminReservation")
	public String adminReservation(Model model) {
		List<ReservationVO> reservationList = rservice.getReservationList();
		model.addAttribute("reservationList", reservationList);
		return "admin/adminReservation";
	}
	
	// 예약 관리 페이지에서 예약 정보 수정 페이지 이동
	@GetMapping("deleteReservationForm")
	public String deleteReservationForm(@RequestParam String idx, ReservationVO re, Model model) {
		re = rservice.selectReservation(idx);
		model.addAttribute(re);
		return "admin/deleteReservationForm";
	}
	
	// 예약 정보 수정 시
	@PostMapping("adminReservationUpdate")
	public String adminReservationUpdate(Model model, ReservationVO re) {
		rservice.adminReservationUpdate(re);
		model.addAttribute("re", re);
		return "redirect:/adminReservation";
	}
	
	// 예약 삭제 시
	@GetMapping("deleteReservation")
	public String deleteReservation(@RequestParam String idx) {
		rservice.deleteReservation(idx);
		
		return "redirect:/adminReservation";
	}
	
	// ==================================================================================
	
	// ================================ 양도 관리 페이지 ================================
	// 관리자의 양도 관리 페이지로 이동
	@GetMapping("adminAssignment")
	public String adminAssignment(Model model) {
		List<AssignmentVO> assignmentList = aservice.getAdminAssignmentList();
		model.addAttribute("assignmentList", assignmentList);
		return "admin/adminAssignment";
	}
	
	// 양도 정보 삭제 시
	@GetMapping("deleteAssignment")
	public String deleteAssignment(@RequestParam String idx , HttpServletResponse response) {
		aservice.deleteAssignment(idx);
		return "redirect:/adminAssignment";
	}
	
	// ==================================================================================
	
}

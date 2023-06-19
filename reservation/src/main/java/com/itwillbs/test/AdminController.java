package com.itwillbs.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	//=================================관리자 페이지=================================
	// 로그인 성공 후 관리자페이지 클릭 시 관리자페이지로 이동
	@GetMapping("adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 관리자 메인 페이지에서 전체 예약 확인하기 클릭 시 전체 예약 리스트 페이지로 이동
	@GetMapping("adminAllReservation")
	public String adminAllReservation() {
		return "admin/adminAllReservation";
	}
	
	// 관리자의 사이트 이용 통계 페이지로 이동
	@GetMapping("adminStatistics")
	public String adminStatistics() {
		return "admin/adminStatistics";
	}
	
	// 관리자의 회원 관리 페이지로 이동
	@GetMapping("adminMember")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	// 관리자의 가게 관리 페이지로 이동
	@GetMapping("adminStore")
	public String adminStore() {
		return "admin/adminStore";
	}
	
	// 관리자의 예약 관리 페이지로 이동
	@GetMapping("adminReservation")
	public String adminReservation() {
		return "admin/adminReservation";
	}
	
	// 관리자의 양도 관리 페이지로 이동
	@GetMapping("adminAssignment")
	public String adminAssignment() {
		return "admin/adminAssignment";
	}
	
	/*
	 * 정보 수정 폼인 deleteXXXForm은 각 관리 페이지에서 _blank로 새 창 띄워 보여줄 예정(매핑X)
	 */
	
}

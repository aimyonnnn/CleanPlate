package com.itwillbs.test;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
	
	// 메인에서 로그인 버튼 클릭시 로그인 폼으로 이동
	@GetMapping("LoginForm")
	public String LoginForm(){
		return "member/member_login";
	}
	
	// 로그인 폼에서 로그인 버튼 클릭시 메인으로 이동
	@PostMapping("LoginPro")
	public String LoginMain() {
		return "main";
	}
	
	// 회원 마이페이지 
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동
	@GetMapping("member")
	public String myPage() {
		return "member/mypage";
	}
	
	// 예약 내역 클릭시 
	@GetMapping("mypage_rs")
	public String mypage_rs() {
		return "member/mypage_rs";
	}
	
	// 내가 찜한 식당
	@GetMapping("mypage_like")
	public String mypage_like() {
		return "member/mypage_like";
	}
	
	// 내가 쓴 리뷰
	@GetMapping("mypage_rv")
	public String mypage_rv() {
		return "member/mypage_rv";
	}
	
	// 쿠폰/이벤트
	@GetMapping("mypage_ce")
	public String mypage_ce() {
		return "member/mypage_ce";
	}
	
	// 1:1 문의
	@GetMapping("mypage_q")
	public String mypage_q() {
		return "member/mypage_q";
	}
	
	// 회원탈퇴 
	@GetMapping("mypage_d")
	public String mypage_d() {
		return "member/mypage_d";
	}
	
	
	// 관리자페이지
	// 로그인 성공 후 관리자 클릭시 관리자페이지로 이동
	@GetMapping("manager")
	public String manager() {
		return "manager/managerpage";
	}
	
	// 관리자의 공지 페이지로 이동
	@GetMapping("managerpage_n")
	public String manage_n() {
		return "manager/managerpage_n";
	}
	
	// 관리자의 점주 관리 페이지로 이동
	@GetMapping("managerpage_ceo")
	public String managerpage_ceo() {
		return "manager/managerpage_ceo";
	}
	
	// 관리자의 신고 페이지로 이동
	@GetMapping("managerpage_de")
	public String managerpage_de() {
		return "manager/managerpage_de";
	}
}

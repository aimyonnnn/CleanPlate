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
	
}

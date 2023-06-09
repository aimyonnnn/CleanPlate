package com.itwillbs.test;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.test.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동
	@GetMapping("member")
	public String member() {
		return "member/memberForm";
	}
	
	// 비밀번호 입력 후 내정보 수정 페이지로 이동
	@PostMapping("memberInfo")
	public String memberInfo(HttpSession session, Model model) throws Exception {
		
		return "member/memberInfo";
	}
	
	// 예약 내역 클릭시 
	@GetMapping("memberRSList")
	public String memberRSList() {
		return "member/memberRSList";
	}
	
	// 내가 찜한 식당
	@GetMapping("memberLike")
	public String memberLike() {
		return "member/memberLike";
	}
	
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

}

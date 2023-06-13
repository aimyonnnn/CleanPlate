package com.itwillbs.test;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동
	@GetMapping("member")
	public String member(HttpServletRequest request, HttpServletResponse response,
	        Model model) {
		System.out.println("MemberForm");
		
		return "member/memberForm";
	}
	
	// 비밀번호 입력 후 내정보 수정 페이지로 이동
	@PostMapping("memberInfo")
	public String memberInfo(HttpSession session, String id, String passwd, HttpServletRequest request, HttpServletResponse response,
        Model model) {
		System.out.println("MemberInfo");
		
	MemberVO member = service.isCorrectMember(id, passwd);
	
	
	if(member == null) {
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
		model.addAttribute("member", member);
		System.out.println(member);
		return "member/memberInfo";
	}
	
	// 회원 정보 수정 시
	@PostMapping("memberUpdate")
	public String memberUpdate(Model model, MemberVO member) {
		service.updateMember(member);
		model.addAttribute("member", member);
		System.out.println(member);

			return "redirect:/member";
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

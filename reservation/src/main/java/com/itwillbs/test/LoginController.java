package com.itwillbs.test;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.LoginService;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	//=================================로그인 & 로그아웃=================================
	// 메인에서 로그인 버튼 클릭 시 로그인 폼으로 이동
	@GetMapping("loginForm")
	public String LoginForm(){
		return "member/member_login";
	}
	
	// 로그인폼에서 로그인 버튼 클릭 시
	@PostMapping("loginPro")
	public String LoginMain() {
	    return "redirect:/";
	}
	
	// CoolSMS 문자 인증
	@PostMapping("/checkPhone")
	public @ResponseBody String checkPhone(@RequestParam(value="to") String to) throws CoolsmsException {
		return service.PhoneNumberCheck(to);
	}
	
	// 카카오 로그인
	@PostMapping("/checkUser")
	@ResponseBody // JSON 형태의 응답을 반환하도록 지정
	public String checkUser(@RequestParam("email") String email, @RequestParam("nickname") String nickname, HttpSession session) {
		// 카카오에서 불러온 email, nickname 콘솔에 출력
		System.out.println("email : "+ email + ", nickname : " + nickname);

		// DB에서 리턴받았다고 가정
	    String existingEmail = email;
//	    String existingEmail = "tset";
	    
	    // 카카오에서 전달받은 이메일 값으로 회원가입 여부 판별
	    if (existingEmail.equals(email)) { // DB에 카카오에서 전달받은 이메일이 존재할 경우
	    	System.out.println("existing");
	    	// 이미 가입된 회원이므로 세션에 유저의 nickname을 저장
	    	session.setAttribute("kId", nickname);
	        return "existing";
	    } else {
	    	System.out.println("new"); // DB에 이메일이 존재하지 않을 경우 => 회원가입 진행
	        return "new";
	    }
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//개인회원 가입 시
	@PostMapping("personalJoinPro")
	public String PersonalJoinPro() {
		return "redirect:/loginForm";
	}
	
	//기업회원 가입 시
	@PostMapping("businessJoinPro")
	public String businessJoinPro() {
		return "redirect:/loginForm";
	}
	
	//아이디, 비밀번호 찾기
	@GetMapping("forgotten")
	public String forgotten() {
		return "member/member_find";
	}
	//=================================로그인 & 로그아웃=================================

}

package com.itwillbs.test;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
	
	@GetMapping("LoginForm")
	public String LoginForm(){
		return "member/member_login";
	}
	
	@PostMapping("LoginPro")
	public String LoginMain() {
		return "main";
	}
	
	@GetMapping("member")
	public String myPage() {
		return "member/mypage";
	}
}

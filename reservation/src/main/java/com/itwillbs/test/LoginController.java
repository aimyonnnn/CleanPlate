package com.itwillbs.test;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
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
	
	// 카카오 로그인
	@PostMapping("/checkUser")
	@ResponseBody // JSON 형태의 응답을 반환하도록 지정
	public String checkUser(@RequestParam("email") String email, @RequestParam("nickname") String nickname, HttpSession session) {
		// 카카오에서 불러온 email, nickname 콘솔에 출력
		System.out.println("email : "+ email + ", nickname : " + nickname);

		// DB에서 리턴받았다고 가정
	    String existingEmail = email;
	    
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
	
	//=================================회원 마이페이지=================================
	// 로그인 성공후 XXX님 클릭시 마이페이지로 이동
	@GetMapping("mypage")
	public String mypage() {
		return "member/mypage_form";
	}
	
	// 비밀번호 입력 후 내정보 수정 페이지로 이동
	@PostMapping("mypagePro")
	public String mypagePro() {
		return "member/mypage_info";
	}
	
	// 예약 내역 클릭시 
	@GetMapping("mypage_rslist")
	public String mypage_rslist() {
		return "member/mypage_rslist";
	}
	
	// 내가 찜한 식당
	@GetMapping("mypage_like")
	public String mypage_like() {
		return "member/mypage_like";
	}
	
	// 내가 쓴 리뷰
	@GetMapping("mypage_rv")
	public String mypage_rv() {
		return "member/mypageReview";
	}
	
	// 회원탈퇴 
	@GetMapping("withdrawal")
	public String mypage_d() {
		return "member/mypage_withdrawal";
	}
	//=================================회원 마이페이지 끝=================================
	
	//=================================관리자 페이지=================================
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
	//=================================관리자 페이지 끝=================================
}

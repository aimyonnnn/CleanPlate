package com.itwillbs.test;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.CeoService;
import com.itwillbs.test.service.LoginService;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.vo.CeoVO;
import com.itwillbs.test.vo.MemberVO;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CeoService ceoService;
	
	//=================================로그인 & 로그아웃=================================
	// 로그인 폼으로 이동 시
	// 1. 세션의 "sId"가 존재하면 메인으로 리다이렉트
	// 2. 세션의 "sId"가 존재하지 않으면 로그인페이지로 이동
	@GetMapping("loginForm")
	public String loginForm(HttpServletRequest request) {
		// false를 설정해서 세션이 새로 생기지 않도록 설정
		// 세션이 이미 존재할 경우 현재 존재하는 세션을 반환함, 그렇지 않으면 null을 반환
	    HttpSession session = request.getSession(false);
	    
	    if (session != null && session.getAttribute("sId") != null) {
	        return "redirect:/"; // 세션의 sId가 있으면 "/"으로 리다이렉트
	    }
	    return "member/member_login";
	}

	 // 로그인 버튼 클릭 시
	   @PostMapping("loginPro")
	   public String loginMain(
			   String id, String passwd,
			   boolean rememberId, boolean keepLoggedIn,
	           HttpServletRequest request, HttpServletResponse response,
	           Model model) {
		   
	   System.out.println("loginMain");
	   
       // 1. id, passwd를 확인한다. => 일치하지 않을 시 로그인폼 리다이렉트
	   MemberVO member = service.isCorrectUser(id, passwd);
	   System.out.println(member);

		if(member == null) {
			return "redirect:/loginForm";
		}
	   
       // 2. id, passwd가 일치하는 경우
       // 2-1. 속성명 sId에 id값을 저장한다.
       HttpSession session = request.getSession();
       session.setAttribute("sId", id);

       // 3. 아이디 기억하기를 체크한 경우, 쿠키를 생성하여 아이디를 저장
       if (rememberId) {
           Cookie Cookie = new Cookie("rememberId", id);
           Cookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키 유효기간을 7일로 설정
           response.addCookie(Cookie);
       } else {
         Cookie cookie = new Cookie("rememberId", "");
         cookie.setMaxAge(0);
         response.addCookie(cookie);
       }
       
       // 4. 로그인 유지를 체크한 경우
       if (keepLoggedIn) {
           Cookie keepLoggedInCookie = new Cookie("keepLoggedIn", id);
           keepLoggedInCookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키 유효기간을 7일로 설정
           response.addCookie(keepLoggedInCookie);
       } else {
          Cookie cookie = new Cookie("keepLoggedIn", "");
          cookie.setMaxAge(0);
          response.addCookie(cookie);
       }
       
       // 로그인 완료 후 메인으로 리다이렉트
       return "redirect:/";
    }	   
	
	// coolsms 문자 인증
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

		MemberVO member = service.isCorrectKakaoUser(email);
		System.out.println(member);
		
		// DB에 카카오 이메일이 존재하지 않으면 => 회원가입 진행
		if(member == null) {
			return "new";
		} else {
		// DB에 카카오 이메일이 존재하는 경우 => 기존 회원이므로 로그인 처리
		// 기존 회원이므로 세션에 유저의 이메일을 세션에 저장
		// 카카오 로그인으로 로그인 할 경우 메인의 header부분에 카카오 이메일을 출력함 "xxx@xxx.com 님" 출력됨
			session.setAttribute("sId", email);
			return "existing";
		}
	}		
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//개인회원 가입 시
		@PostMapping("memberJoinPro")
		public String memberJoinPro(MemberVO member, Model model) {
			System.out.println("memberJoinPro");
			
			int insertCount = memberService.registMember(member);
			
			if(insertCount == 0) { // 가입 실패 시 
				model.addAttribute("msg", "회원가입 실패! 다시 등록해주세요.");
				return "loginForm";
			} else { // 가입 성공 시
				return "redirect:/loginForm";
			}
		}
		
		//기업회원 가입 시
		@PostMapping("ceoJoinPro")
		public String ceoJoinPro(CeoVO ceo, Model model) {
			System.out.println("ceoJoinPro");
			
			int insertCount = ceoService.registCeo(ceo);
			
			if(insertCount == 0) { // 가입 실패 시 
				model.addAttribute("msg", "회원가입 실패! 다시 등록해주세요.");
				return "loginForm";
			} else { // 가입 성공 시
				return "redirect:/loginForm";
			}
		}
	
	//아이디, 비밀번호 찾기
	@GetMapping("forgotten")
	public String forgotten() {
		return "member/member_find";
	}
	//=================================로그인 & 로그아웃=================================

}

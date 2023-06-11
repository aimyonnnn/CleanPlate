package com.itwillbs.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		
		//회원 아이디 찾기
		@PostMapping("memberIdFind")
		public String memberIdFind(@RequestParam String m_name, @RequestParam String m_tel, Model model, HttpServletResponse response) {
			
			System.out.println(m_name + ", " + m_tel);
			
			MemberVO member = service.retrieveMemberId(m_name, m_tel);
			
			System.out.println(member);
			
			if(member == null) { // id 찾기 실패 시
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script>");
					out.print("alert('입력하신 정보가 일치하지 않습니다.');");
					out.print("history.back();");
					out.print("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			model.addAttribute("member", member);
			
			return "member/memberIdFind";
		}
		
		//회원 비밀번호 찾기
		@PostMapping("memberPasswdFind")
		public String memberPasswdFind(MemberVO membervo , Model model, HttpServletResponse response) {
			System.out.println(membervo);
			
			MemberVO member = service.retrievePasswdFind(membervo);
			
			System.out.println(member);
			
			
			
			if(member == null) { // passwd 찾기 실패 시
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script>");
					out.print("alert('입력하신 정보가 일치하지 않습니다.');");
					out.print("history.back();");
					out.print("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// 랜덤 비밀번호 생성
			String RdPassword = generateRandomPassword();
			System.out.println("Random Password: " + RdPassword);
			
			membervo.setM_passwd(RdPassword);
			
			
			int updateCount = memberService.randomPassword(membervo);
				
			model.addAttribute("member",member);
			
			return "member/memberPasswdFind";
		}
		
		//점주 아이디 찾기
		@PostMapping("ceoIdFind")
		public String ceoIdFind(@RequestParam String c_name, @RequestParam String c_tel, Model model) {
			
			System.out.println(c_name + ", " + c_tel);
			
			CeoVO ceo = service.retrieveCeoId(c_name, c_tel);
			
			System.out.println(ceo);
			
			if(ceo == null) { // id 찾기 실패 시
				return "member/loginForm";
			}
			
			model.addAttribute("member", ceo);
			
			return "member/memberIdFind";
		}
		//=================================로그인 & 로그아웃=================================
		//=================================랜덤 비밀번호 생성================================
		
	    // 사용할 문자 세트 정의
	    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
	    
	    // 생성할 비밀번호의 길이
	    private static final int PASSWORD_LENGTH = 10;

	    // 랜덤 비밀번호 생성 메서드
	    public static String generateRandomPassword() {
	        // SecureRandom 클래스를 사용하여 안전한 랜덤 값을 생성
	        SecureRandom random = new SecureRandom();
	        
	        // 비밀번호를 저장할 StringBuilder 객체 생성
	        StringBuilder password = new StringBuilder();

	        // 비밀번호 길이만큼 반복하여 랜덤 문자 선택
	        for (int i = 0; i < PASSWORD_LENGTH; i++) {
	            // 문자 세트에서 랜덤한 인덱스 선택
	            int randomIndex = random.nextInt(CHARACTERS.length());
	            
	            // 선택된 인덱스에 해당하는 문자를 비밀번호에 추가
	            password.append(CHARACTERS.charAt(randomIndex));
	        }

	        // 생성된 비밀번호를 문자열 형태로 반환
	        return password.toString();
	    }

	    //로그아웃에 필요한 내용 : 일정 시간 이후 움직임 없으면 로그아웃
	    @Controller
	    
	    public class UserController {
        
	    	@Autowired
	    	private HttpServletRequest request;
	    	
	        @GetMapping
	        public ModelAndView logoutCon(HttpServletRequest request) {
	        	HttpSession session = request.getSession(false);
	        	ModelAndView modelAndView = new ModelAndView();	        	
				if(session == null) {//세션만료시 로그아웃되어야 한다.
	        		logout();
	        		modelAndView.setViewName("redirect:/login");//로그인 페이지 리다이렉트
	        	}else {modelAndView.setViewName("main");//세션 유효시 메인 홈페이지로 이동!
	        }
	        return modelAndView; 
	    }

	        @GetMapping("/logout")
	        public String logout() {
	            HttpSession session = request.getSession(false);
	            if (session != null) {
	                session.invalidate(); // 세션 무효화
	            }
	            // 로그인 완료 후 메인으로 리다이렉트
	            return "redirect:/";
	        	}
	        
	        //이부분에 대해서는 설명 필요할 예정
	        //(로그인 세션설정 시간이 지나면 자동 로그아웃을 기능을 위해 일반적인 로그인 방식에
	        //세션 유효시간 설정할 필요가있습니다)쿠키랑은 다름!
//	        @GetMapping("/login")
//	        public String login() {
//	        	HttpSession session = request.getSession();
//	        	
//	        	// 로그인 성공한 경우 세션 유효 시간 설정 (30분)
//	        	session.setMaxInactiveInterval(1800);
//	        	
//	        	// 로그인 처리 후 홈 페이지로 리다이렉트
//	        	return "redirect:/";
	        }
	    }
	    
}

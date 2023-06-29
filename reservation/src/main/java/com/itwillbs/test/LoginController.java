package com.itwillbs.test;

import java.security.SecureRandom;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.test.handler.MyPasswordEncoder;
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
	public String loginForm(HttpServletRequest request, Model model) {
		// false를 설정해서 세션이 새로 생기지 않도록 설정
		// 세션이 이미 존재할 경우 현재 존재하는 세션을 반환함, 그렇지 않으면 null을 반환
	    HttpSession session = request.getSession(false);
	    
	    if (session != null && session.getAttribute("sId") != null) {
	    	model.addAttribute("msg", "이미 로그인 중 입니다. 홈으로 이동합니다");
//	        return "redirect:/"; // 세션의 sId가 있으면 "/"으로 리다이렉트
	    	return "fail_back";
	    }
	    return "member/member_login";
	}

	// 로그인
	@PostMapping("loginPro")
	public String loginMain(@RequestParam String id, @RequestParam String passwd,
	        boolean rememberId, Model model,
	        HttpServletRequest request, HttpServletResponse response) {

	    // 1. id를 조회하여 암호화된 passwd를 가져온다
	    String securePasswd = "";
	    try {
	        securePasswd = service.isCorrectUser(id); // 일반회원 비밀번호 조회
	        if (securePasswd == null) {
	            securePasswd = ceoService.isCorrectCeo(id); // 기업회원 비밀번호 조회
	        }
	    } catch (Exception e) { // id가 존재하지 않아 passwd를 가져오지 못한다면 실행할 구문
	        String msg = "아이디가 존재하지 않습니다.";
	        model.addAttribute("msg", msg);
	        return "fail_back";
	    }

	    // 2. BCryptPasswordEncoder 객체 생성
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	    if (passwd == null || !passwordEncoder.matches(passwd, securePasswd)) { // 로그인 실패
	        String msg = "비밀번호가 일치하지 않습니다.";
	        model.addAttribute("msg", msg);
	        return "fail_back";
	    }
	    

	    // 3. userType 값이 1이면 일반회원, 그 외의 값이면 기업회원으로 가정
	    int userType = 0;
	    try {
	        userType = service.getUserType(id); // 일반회원 유형 조회
	    } catch (Exception ex) {
	        userType = 2; // 기업회원 유형으로 가정
	    }
	    
	    
	    //3-1 userType에 따른 유저 의 status를 확인하여 로그인을 할것인지 결정
	    
	    int status = 0;
	    
	    if(userType == 1) {
	    	MemberVO member = memberService.isCorrectMember(id);
	    	status = member.getM_status();
	    } else {
	    	CeoVO ceo = ceoService.SelectCeo(id);
	    	status = ceo.getC_status();
	    }
	    
	    if(status == 2) {
	        model.addAttribute("msg", "현제 정지이므로 정지가 풀리면 로그인하시길 바랍니다.");
	        return "fail_back";
	    } else if (status == 3) {
	        model.addAttribute("msg", "탈퇴된 계정입니다.");
	        return "fail_back";
	    }

	    HttpSession session = request.getSession();

	    if (!id.equals("admin")) { // 아이디가 admin이 아닌 경우
	        if (userType == 1) { // 일반회원인 경우
	            session.setAttribute("sId", id);
	            System.out.println("일반회원입니다.");
	        } else if (userType == 2) { // 기업회원인 경우
	            session.setAttribute("cId", id);
	            System.out.println("기업회원입니다.");
	        } else {
	            System.out.println("일반회원 또는 기업회원이 아닙니다.");
	        }
	    } else { // 아이디가 admin인 경우
	        session.setAttribute("sId", id);
	        System.out.println("admin입니다.");
	    }

	    // 아이디 기억하기를 체크한 경우, 쿠키를 생성하여 아이디를 저장
	    if (rememberId) {
	        Cookie cookie = new Cookie("rememberId", id);
	        cookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키 유효기간을 7일로 설정
	        response.addCookie(cookie);
	    } else {
	        Cookie cookie = new Cookie("rememberId", "");
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
	@ResponseBody
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
			
		// ==========================수정되었습니다=======================
		// 기존 회원이므로 세션에 유저의 이메일을 세션에 저장
		// 카카오 로그인으로 로그인 할 경우 메인의 header부분에 카카오 이메일을 출력함 "xxx@xxx.com 님" 출력됨
		// ===============================================================
			// => ######세션에는 유저id를 저장하는걸로 수정하겠습니다######
			// 카카오 로그인 시 유저의 email을 세션에 담지않고 회원정보 조회 후 id를 세션에 저장
			
			MemberVO member2 = memberService.getMemberId(email);
			session.setAttribute("sId", member2.getM_id());
			return "existing";
		}
	}	
	
	//네이버 로그인
	@PostMapping("/checkUserNaver")
	@ResponseBody
	public String checkUser(@RequestParam("email") String email,HttpSession session) {

		System.out.println("email : "+ email);
	
		MemberVO member = service.isCorrectKakaoUser(email);
		System.out.println(member);
		
		if(member == null) {
			return "new";
		} else {
			
			MemberVO member2 = memberService.getMemberId(email);
			session.setAttribute("sId", member2.getM_id());
			return "existing";
		}
	}	
	
	// 아이디 실시간 중복 체크 - 일반회원
	@GetMapping("dupId")
	@ResponseBody
	public String dupId(@RequestParam String m_id) {
	  int cnt = service.isDupId(m_id);
	  System.out.println(cnt);
	  if (cnt == 0) { // 아이디 중복이 아닐 경우, 조회했을 때 0
	    return "0"; 
	  } 
	  return "1"; // 아이디 중복일 경우, 조회했을 때 1
	}
	
	// 아이디 실시간 중복 체크 - 기업회원
	@GetMapping("dupId2")
	@ResponseBody
	public String dupId2(@RequestParam String c_id) {
		int cnt = service.isDupId2(c_id);
		System.out.println(cnt);
		if (cnt == 0) { // 아이디 중복이 아닐 경우, 조회했을 때 0
			return "0"; 
		} 
		return "1"; // 아이디 중복일 경우, 조회했을 때 1
	}
	
	
	
//	//로그아웃
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}
	
	//개인회원 가입 시
		@PostMapping("memberJoinPro")
		public String memberJoinPro(MemberVO member, Model model) {
			System.out.println("memberJoinPro");
			
			//암호화
			MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
			String securePasswd = passwordEncoder.getCryptoPassword(member.getM_passwd());
			member.setM_passwd(securePasswd);
			
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
			
			MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
			String securePasswd = passwordEncoder.getCryptoPassword(ceo.getC_passwd());
			ceo.setC_passwd(securePasswd);
			
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
		public String forgotten(HttpSession session, Model model) {
			
			if(session.getAttribute("sId") != null || session.getAttribute("cId") != null) {
				model.addAttribute("msg", "잘못된 접근입니다.");
				return "fail_back";
			}
			
			return "member/member_find";
		}
		
		//회원 아이디 찾기
		@PostMapping("memberIdFind")
		public String memberIdFind(@RequestParam String m_name, @RequestParam String m_tel, Model model, @RequestParam int isVerify) {
			
			System.out.println(m_name + ", " + m_tel + ", " + isVerify);
			
			// 전화번호 인증을 했는지 하지 않았는지 판별
			if(isVerify != 1) {
				model.addAttribute("msg", "전화번호 인증이 확인되지 않았습니다.");
				return "fail_back";
			}
			
			MemberVO member = service.retrieveMemberId(m_name, m_tel);
			
			System.out.println(member);
			
			if(member == null) { // id 찾기 실패 시
				model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
				return "fail_back";
			}
			
			model.addAttribute("member", member);
			
			return "member/memberIdFind";
		}
		
		//회원 비밀번호 찾기
		@PostMapping("memberPasswdFind")
		public String memberPasswdFind(MemberVO membervo , Model model, @RequestParam int isVerify) {
			System.out.println(membervo);
			
			isVerify = 1;
			
			// 전화번호 인증을 했는지 하지 않았는지 판별
			if(isVerify != 1) {
				model.addAttribute("msg", "전화번호 인증이 확인되지 않았습니다.");
				return "fail_back";
			}
			
			MemberVO member = service.retrievePasswdFind(membervo);
			
			System.out.println(member);
			
			
			
			if(member == null) { // passwd 찾기 실패 시
				model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
				return "fail_back";
			}
			// 랜덤 비밀번호 생성과 동시에 암호화
			
			String RandomPasswd = generateRandomPassword();
			
			MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
			
			String securePasswd = passwordEncoder.getCryptoPassword(RandomPasswd);
			
			membervo.setM_passwd(securePasswd);
			
			
			int updateCount = memberService.randomPassword(membervo);
			
			if(updateCount <= 0) {
				model.addAttribute("msg", "비밀번호 변경 실패");
				return "fail_back";
			}
				
			model.addAttribute("RandomPasswd",RandomPasswd);
			
			return "member/memberPasswdFind";
		}
		
		//점주 아이디 찾기
		@PostMapping("ceoIdFind")
		public String ceoIdFind(@RequestParam String c_name, @RequestParam String c_tel, Model model, @RequestParam int isVerify) {
			
			System.out.println(c_name + ", " + c_tel);
			
			// 전화번호 인증을 했는지 하지 않았는지 판별
			if(isVerify != 1) {
				model.addAttribute("msg", "전화번호 인증이 확인되지 않았습니다.");
				return "fail_back";
			}
			
			CeoVO ceo = service.retrieveCeoId(c_name, c_tel);
			
			System.out.println(ceo);
			
			if(ceo == null) { // id 찾기 실패 시
				model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
				return "fail_back";
			}
			
			model.addAttribute("ceo", ceo);
			
			return "member/ceoIdFind";
			
		}
		
		//점주 비밀번호 찾기
				@PostMapping("ceoPasswdFind")
				public String ceoPasswdFind(CeoVO ceo , Model model, @RequestParam int isVerify) {
					
					System.out.println(ceo);
					
					// 전화번호 인증을 했는지 하지 않았는지 판별
					if(isVerify != 1) {
						model.addAttribute("msg", "전화번호 인증이 확인되지 않았습니다.");
						return "fail_back";
					}
					
					CeoVO ceoResult = service.retrievePasswdFind(ceo);
					
					System.out.println(ceoResult);
					
					
					
					if(ceoResult == null) { // passwd 찾기 실패 시
						model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
						return "fail_back";
					}
					// 랜덤 비밀번호 생성
					String RandomPasswd = generateRandomPassword();
					
					MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
					
					String securePasswd = passwordEncoder.getCryptoPassword(RandomPasswd);
					
					ceoResult.setC_passwd(securePasswd);
					
					
					int updateCount = ceoService.randomPassword(ceoResult);
					
					if(updateCount <= 0) {
						model.addAttribute("msg", "비밀번호 변경 실패");
						return "fail_back";
					}
						
					model.addAttribute("RandomPasswd",RandomPasswd);
					
					return "member/ceoPasswdFind";
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
	        @GetMapping("/login")
	        public String login() {
	        	
	        	HttpSession session = request.getSession();
	        	
	        	// 로그인 성공한 경우 세션 유효 시간 설정 (30분)
	        	session.setMaxInactiveInterval(60*30);
	        	
	        	// 로그인 처리 후 홈 페이지로 리다이렉트
	        	return "redirect:/";
	        }
	    }	    
}
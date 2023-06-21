package com.itwillbs.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.AssignmentService;
import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.service.MenuService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.MenuVO;
import com.itwillbs.test.vo.RestaurantVO;

@Controller
public class AssignmentController {
   
   @Autowired
   private AssignmentService assignmentService;
   @Autowired
   private MemberService memberService;
   @Autowired
   private ReservationService reservationService;
   
   private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
   
   @GetMapping("/assignment")
   public String getAssignment(Model model) {
	   
	   // 양도 게시판 출력 리스트
       List<AssignmentVO> assignmentList = assignmentService.getAssignmentList();
       model.addAttribute("assignmentList", assignmentList);
       return "assignment/assignment";
       
   }
   
   // WebSocket - 동의
   @GetMapping("/assignAgree")
   public String login() {
      return "assignment/assignAgree";
   }
   
   // WebSocket - 입장
   @PostMapping("/assignAgreePro")
   public String loginProcess(@RequestParam String id, HttpServletRequest request) {
      logger.info("Welcome "+id);
      return "assignment/assignmentChat";
   }
   
   // 결제하기 버튼 클릭 시
   @GetMapping("assignmentPayment")
   public String paymentForm(Model model, HttpSession session,
		   @RequestParam("r_idx") int r_idx,
           @RequestParam("r_date") String r_date,
           @RequestParam("a_price") int a_price,
           @RequestParam("a_sellerId") String a_sellerId,
           @RequestParam("res_name") String res_name) {
	   
	   System.out.println(a_sellerId);
	   
	   // 현재 세션에 저장된 id로 주문자 정보 조회하기
	   // 기업회원은 구매 불가능!
	   String sId = (String) session.getAttribute("sId");
	   System.out.println(sId);
	   
	   // 세션 아이디가 존재하지 않을 경우
	   if (sId == null) {
	        model.addAttribute("msg", "로그인 후 이용해주세요");
	        return "fail_back";
	    }
	  
	  // 주문자의 정보를 조회하여 폼에 입력
	  MemberVO member = memberService.getMemberInfo(sId);
	  System.out.println(member);
	   
	  model.addAttribute("r_idx", r_idx);
	  model.addAttribute("r_date", r_date);
	  model.addAttribute("res_name", res_name);
	  model.addAttribute("a_price", a_price);
	  model.addAttribute("a_sellerId", a_sellerId);
	  model.addAttribute("member", member);
      
      return "assignment/assignmentPayment";
      
   }
   
   // 예약내역 업데이트
   // 예약 테이블의 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
   @PostMapping("/assignUpdate")
   @ResponseBody
   public Map<String, Integer> assignUpdate(
           HttpSession session,
           @RequestParam("a_sellerId") String a_sellerId,
           @RequestParam("r_idx") int r_idx) {
       System.out.println("assignUpdate");
      
       String sId = (String) session.getAttribute("sId");
      
       System.out.println(r_idx);
       System.out.println(a_sellerId);
     
       int assignUpdateCount = reservationService.updateReservation(sId, r_idx);
       System.out.println(assignUpdateCount);
      
       Map<String, Integer> response = new HashMap<>();
       if (assignUpdateCount > 0) {
           
           // 예약 테이블의 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경 완료 시
           // 양도 테이블의 양도상태 컬럼을 2-거래완료로 변경하기
    	   // 양도상태 번호가 '2-거래완료'인 것은 양도게시판 리스트에서 제거하기
           int assignStatusCount = assignmentService.updateStatus(r_idx);   		
	           if(assignStatusCount > 0) { response.put("result", 1); }
	           
       } else {
           response.put("result", 0);
       }
       
       return response;
   }
   
}
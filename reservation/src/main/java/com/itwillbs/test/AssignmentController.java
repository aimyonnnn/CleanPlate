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
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;

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
      
      // 양도 리스트 전체 조회
       List<AssignmentVO> assignmentList = assignmentService.getAssignmentList();
//       System.out.println(assignmentList);

       model.addAttribute("assignmentList", assignmentList);
       
       return "assignment/assignment";
   }
   
   // 양도 동의하기
   @GetMapping("/assignAgree")
   public String login() {
      return "assignment/assignAgree";
   }
   
   // 채팅방 입장
   @PostMapping("/assignAgreePro")
   public String loginProcess(@RequestParam String id, HttpServletRequest request) {
      logger.info("Welcome "+id);
      return "assignment/assignmentChat";
   }
   
   // 결제하기 - 바로구매 버튼 클릭 시
   @GetMapping("assignmentPayment")
   public String paymentForm(Model model,
		   HttpSession session,
		   @RequestParam("r_idx") int r_idx,
           @RequestParam("r_date") String r_date,
           @RequestParam("a_price") int a_price,
           @RequestParam("res_name") String res_name,
           @RequestParam("a_sellerId") String a_sellerId) {
	   
	   System.out.println(a_sellerId);
	  
	   // 현재 세션에 저장된 id로 주문자 정보 조회하기
	   String sId = (String) session.getAttribute("sId");
	   System.out.println(sId);
	   
	   // 세션 아이디가 존재하지 않을 경우
	   if (sId == null) {
	        model.addAttribute("msg", "로그인 후 이용해주세요");
	        return "fail_back";
	    }
	  
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
   
   // 예약내역 업데이트 하기
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
	           if(assignStatusCount > 0) {
	        	   response.put("result", 1);
	           }
	           
       } else {
           response.put("result", 0);
       }
      
       return response;
   }
   
   
// =======================================================================================================
//   // 결제 취소 테스트
//   @PostMapping("assignCancle")
//   @ResponseBody
//   public Map<String, Object> assignCancle(
//           @RequestParam String merchant_uid,
//           @RequestParam String cancel_request_amount,
//           Model model) {
//       System.out.println("assignCancle");
//       
//       // 파라미터 출력 테스트
//       // merchant_uid : ORD20230615-0000001, cancel_request_amount : 99.95
//       System.out.println("merchant_uid: " + merchant_uid +
//               ", cancel_request_amount: " + cancel_request_amount);
//
//       model.addAttribute("merchant_uid", merchant_uid);
//       model.addAttribute("cancel_request_amount", cancel_request_amount);
//
//       // 환불 금액 DB에 저장
//       // 양도하는 사람의 예약 내역 삭제 처리
//       // 양도받는 사람의 예약 내역으로 인서트
//       // 양도상태를 거래완료로 변경 
//
////       saveRefundAmount(merchant_uid, cancel_request_amount);
//       
//       Map<String, Object> response = new HashMap<>();
//       response.put("status", "success");
//       response.put("message", "환불 요청이 성공적으로 처리되었습니다.");
//       response.put("merchant_uid", merchant_uid);
//       response.put("cancel_request_amount", cancel_request_amount);
//
//       return response;
//   }
   
   
}
package com.itwillbs.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.itwillbs.test.vo.AssignmentVO;

@Controller
public class AssignmentController {
   
   @Autowired
   private AssignmentService assignmentService;
   
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
   
   // 결제 테스트
   @GetMapping("assignmentPayments")
   public String paymentForm(Model model, HttpServletRequest request, HttpServletResponse response) {
      // 테스트용 값
      model.addAttribute("name", "CleanPlate");
      model.addAttribute("amount", 100);
      model.addAttribute("goodsname", "식사예약권");
      model.addAttribute("buyer_email", "itwillbs0530@gmail.com");
      model.addAttribute("buyer_name", "홍길동");
      model.addAttribute("buyer_tel", "010-1234-5678");
      model.addAttribute("buyer_addr", "부산광역시 부산진구 부전동");
      model.addAttribute("merchant_uid", "ORD20230616-0000017");
      
      return "assignment/assignmentPayments";
   }

   // 결제 취소 테스트
   @PostMapping("assignCancle")
   @ResponseBody
   public Map<String, Object> assignCancle(
           @RequestParam String merchant_uid,
           @RequestParam String cancel_request_amount,
           Model model) {
       System.out.println("assignCancle");
       
       // 파라미터 출력 테스트
       // merchant_uid : ORD20230615-0000001, cancel_request_amount : 99.95
       System.out.println("merchant_uid: " + merchant_uid +
               ", cancel_request_amount: " + cancel_request_amount);

       model.addAttribute("merchant_uid", merchant_uid);
       model.addAttribute("cancel_request_amount", cancel_request_amount);

       // 환불 금액 DB에 저장
       // 양도하는 사람의 예약 내역 삭제 처리
       // 양도받는 사람의 예약 내역으로 인서트
       // 양도상태를 거래완료로 변경 

//       saveRefundAmount(merchant_uid, cancel_request_amount);
       
       Map<String, Object> response = new HashMap<>();
       response.put("status", "success");
       response.put("message", "환불 요청이 성공적으로 처리되었습니다.");
       response.put("merchant_uid", merchant_uid);
       response.put("cancel_request_amount", cancel_request_amount);

       return response;
   }
   
   
}
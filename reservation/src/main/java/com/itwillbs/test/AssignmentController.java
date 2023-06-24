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
import com.itwillbs.test.service.PayService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.vo.AssignmentVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.ReservationVO;

@Controller
public class AssignmentController {
   
   @Autowired
   private AssignmentService assignmentService;
   @Autowired
   private MemberService memberService;
   @Autowired
   private ReservationService reservationService;
   @Autowired
   private PayService payService;
   
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
           @RequestParam("p_orderNum") String p_orderNum,
           @RequestParam("p_imp_uid") String p_imp_uid,
           @RequestParam("p_price") int p_price,
           @RequestParam("a_sellerId") String a_sellerId,
           @RequestParam("r_idx") int r_idx
		   ) {
	   
       System.out.println("assignUpdate");
      
       String sId = (String) session.getAttribute("sId");
      
       System.out.println("r_idx :" + r_idx);
       System.out.println("a_sellerId :" + a_sellerId);
       System.out.println("p_imp_uid : " + p_imp_uid);
       System.out.println("p_orderNum :" + p_orderNum);
       System.out.println("p_price : " + p_price);
       
       // ======================= 결제정보 payment 테이블에 저장  =======================
       int insertCount = payService.registPayInfo(p_orderNum, p_imp_uid, p_price, sId, r_idx);
       
       System.out.println(insertCount);
       
       // ======================= 예약상태, 양도상태 컬럼 변경 작업  =======================
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
   
   // 양도 게시판 글 등록하기
   // 마이 페이지의 예약내역탭에서 진행!
   @GetMapping("registAssignment")
   public String registAssignment(
		   @RequestParam("r_idx") int r_idx,
		   @RequestParam("salesValue") int salesValue,
		   Model model, HttpSession session) {
	   
	   System.out.println(r_idx + ", " + salesValue);
	   
	   // 예약번호로 예약정보 조회하기
	   ReservationVO reservationInfo = reservationService.getReservationInfo(r_idx);
	   
	   // 예약테이블의 r_amount > 입력금액 일 때 
	   if(salesValue >	 reservationInfo.getR_amount()) {
		   model.addAttribute("msg", "예약금액 보다 높게 판매할 수 없습니다. 가격을 다시 입력해주세요");
		   return "fail_back";
	   }
	   
	   String sId = (String) session.getAttribute("sId");
	   
	   // 양도 게시판에 글 등록하기
	   // 파라미터 : a_price(=salesValue), a_sellerId(=sId), r_idx
	   int insertCount = assignmentService.registAssignment(salesValue, sId, r_idx);
	   
	   System.out.println(insertCount);
	   
	   if(insertCount != 0) { // 글 등록 성공 시
		   
		   // 양도 게시판에 글이 올라가면 
		   // 예약번호를 조회하여 예약상태 컬럼인 r_status를 '5-판매중'으로 변경하기
		   // (r_status가 1-방문예정, 2-방문완료, 3-취소, 4-양도완료, 5-판매중)
   		   int updateReservationStatus = reservationService.modifyStatus(r_idx);
   			
   				if(updateReservationStatus != 0) {
   					
   					model.addAttribute("msg", "양도 게시판에 정상적으로 등록되었습니다!");
   					model.addAttribute("targetURL", "assignment");
   					return "success_forward";
   				}
	   		}
	   
	   return "redirect:/memberRSList";
   } // registAssignment
   
   
   // 양도 게시판에 판매중인 게시글의 가격 수정하기 
   @PostMapping("modifySalesPrice")
   @ResponseBody
   public String modifySalesPrice(@RequestParam int salesValue, @RequestParam int r_idx, Model model) {
	   
	   System.out.println(r_idx + ", " + salesValue);
	   
	   // 예약번호로 예약정보 조회하기
	   ReservationVO reservationInfo = reservationService.getReservationInfo(r_idx);
	   
	   // 예약테이블의 r_amount > 입력금액 일 때 
	   if(salesValue >	 reservationInfo.getR_amount()) {
		   return "0";
	   }
	   
	   // 가격 수정하기
	   int updateCount = assignmentService.modifySalesPrice(salesValue, r_idx);
	   
	   if(updateCount != 0) return "1";
	   
	   return "0";
   }
   
   
   
   
}
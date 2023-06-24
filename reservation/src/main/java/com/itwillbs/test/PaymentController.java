package com.itwillbs.test;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.PayService;
import com.itwillbs.test.vo.PayVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PayService payService;
	
	// 결제 취소
    @PostMapping("paymentCancel")
    @ResponseBody
	public PayVO paymentCancel(PayVO pay, Model model, @RequestParam("r_idx") int r_idx) {
    	
    	System.out.println(r_idx);
    	
    	// 결제정보 조회
    	PayVO payInfo = payService.getPayInfoByRidx(r_idx);
    	System.out.println(payInfo);
    	
	    return payInfo;
	}

    // 결제 취소 테스트
	@GetMapping("paymentCancelTest")
	public String paymentCancel(PayVO pay, Model model, HttpSession session) {
    	
    	String sId = (String) session.getAttribute("sId");
    	
    	System.out.println(sId);
    	
    	// 결제내역 조회
    	List<PayVO> payInfoList = payService.getPayInfo(sId);
    	
    	model.addAttribute("payInfoList", payInfoList);
    	
	    return "assignment/assignmentPaymentCancel";
	}
	
	
	@PostMapping("payCancel")
	public ResponseEntity<String> orderCancle(PayVO pay) throws Exception {
		
		 System.out.println(pay);
		 
		// ----------------- api 작업 -----------------
		// 주문번호가 있으면 실행	
		// payService - getToken() : 토큰 받아오기
		// payService - paymentInfo() : 결제번호와 토큰으로 결제된 금액 받아오기
		// payService - payMentCancle() : 결제 취소 기능 메서드 호출
		 
		if(!"".equals(pay.getPayment_num())) {
			String token = payService.getToken();
			int amount = Integer.parseInt(payService.paymentInfo(pay.getPayment_num(), token));
			payService.payMentCancle(token, pay.getPayment_num(), amount, pay.getReason());
		}
		
		//----------------- DB 작업 -----------------
		// PayService - orderCancle() 호출
		// 결제 상태변경(PAYMENTS.payment_status)
		
		payService.orderCancle(pay);
		return ResponseEntity.ok().body("예약취소완료"); // <200 OK OK,주문취소완료,[]>
	}
	
	// 양도
	@PostMapping("payCancel2")
	public ResponseEntity<String> orderCancle2(PayVO pay) throws Exception {
		
		System.out.println(pay);
		 
		// ----------------- api 작업 -----------------
			// 주문번호가 있으면 실행	
			// payService - getToken() : 토큰 받아오기
			// payService - paymentInfo() : 결제번호와 토큰으로 결제된 금액 받아오기
			// payService - payMentCancle() : 결제 취소 기능 메서드 호출
		 
		if (!"".equals(pay.getPayment_num())) {
	        String token = payService.getToken();
	        int amount = Integer.parseInt(payService.paymentInfo(pay.getPayment_num(), token));
	        int refundAmount = (int) (amount * 0.0005); // 결제 금액의 0.05%로 환불할 금액 계산
	        payService.payMentCancle(token, pay.getPayment_num(), refundAmount, pay.getReason());
	    }
		
		//----------------- DB 작업 -----------------
		// PayService - orderCancle() 호출
		// 결제 상태변경(PAYMENTS.payment_status)
		
		payService.orderCancle2(pay);
		return ResponseEntity.ok().body("결제취소완료"); // <200 OK OK,주문취소완료,[]>
	}

	
	
	
	
	
	
	
}

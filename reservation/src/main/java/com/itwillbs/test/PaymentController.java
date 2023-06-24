package com.itwillbs.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.test.service.PayService;
import com.itwillbs.test.vo.PayVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PayService payService;

	@PostMapping("payCancel")
	public ResponseEntity<String> orderCancle(PayVO pay) throws Exception {
		// System.out.println(pay);
		// ----------- api 작업 -----------------
		// 주문번호가 있으면 실행	
		// payService - getToken() : 토큰 받아오기
		// payService - paymentInfo() : 결제번호와 토큰으로 결제된 금액 받아오기
		// payService - payMentCancle() : 결제 취소 기능 메서드 호출
		
		if(!"".equals(pay.getPayment_num())) {
			String token = payService.getToken();
			int amount = Integer.parseInt(payService.paymentInfo(pay.getPayment_num(), token));
			payService.payMentCancle(token, pay.getPayment_num(), amount, pay.getReason());
		}
		
		// ------------ DB 작업 -----------------
		// PayService - orderCancle() 호출
		// 결제 상태변경(PAYMENTS.payment_status), 티켓예약 상태변경, 스낵결제 상태변경
		payService.orderCancle(pay);
		return ResponseEntity.ok().body("주문취소완료"); // <200 OK OK,주문취소완료,[]>
	}

	
	
	
	
	
	
	
}

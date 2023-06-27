package com.itwillbs.test;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.PayService;
import com.itwillbs.test.vo.PayVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PayService payService;
	
	private IamportClient api;
	
	// 결제 검증을 위한 api키
	public PaymentController() {
		this.api = new IamportClient("7282578621856564","uUdnTnwy30JL3CvPQiB8ymuQNa6zLArW6ljmfO9IZAGStHKe19yY7Fil099s3TJwFHw0UEMhk49KvTBy");
	}
	
	// 결제 검증
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {
			System.out.println(imp_uid);
			return api.paymentByImpUid(imp_uid);
	}
	
	// 예약결제 취소를 위한 결제정보 조회
    @PostMapping("paymentCancel")
    @ResponseBody
	public PayVO paymentCancel(PayVO pay, Model model, @RequestParam("r_idx") int r_idx) {
    	
    	System.out.println(r_idx);
    	
    	// 결제정보 조회
    	PayVO payInfo = payService.getPayInfoByRidx(r_idx);
    	System.out.println(payInfo);
    	
	    return payInfo;
	}
    
    // 판매금액 정산을 위한 결제정보 조회
    @PostMapping("paymentCancel2")
    @ResponseBody
    public PayVO paymentCancel2(PayVO pay, Model model, @RequestParam("r_idx") int r_idx) {
    	
    	System.out.println(r_idx);
    	
    	PayVO payInfoBySeller = payService.getInfoBySeller(r_idx);
    	System.out.println(payInfoBySeller);
    
    	
    	return payInfoBySeller;
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
	
	// 판매금액 정산하기 - 부분취소
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
	        payService.payMentCancle(token, pay.getPayment_num(), amount, pay.getReason());
	    }
		
		//----------------- DB 작업 -----------------
		// PayService - orderCancle() 호출
		// 결제 상태변경(PAYMENTS.payment_status)
		
		payService.orderCancle2(pay);
		return ResponseEntity.ok().body("결제취소완료"); // <200 OK OK,주문취소완료,[]>
	}

	
	
	
	
	
	
	
}

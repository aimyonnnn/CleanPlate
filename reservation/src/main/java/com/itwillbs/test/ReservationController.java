package com.itwillbs.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	// 예약 검색 페이지
	@GetMapping("reservationMain")
	public String reservationMain() {
		return "reservation/reservation_main";
	}
	
	// 예약 페이지
	@GetMapping("reservationReserve")
	public String reservationReserve() {
		return "reservation/reservation_reserve";
	}
	
	// 결제 후 예약 내역 페이지
	@GetMapping("reservationResult")
	public String reservationResult() {
		return "reservation/reservation_result";
	}
	
	
	
}

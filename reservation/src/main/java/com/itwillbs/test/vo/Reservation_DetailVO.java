package com.itwillbs.test.vo;

import lombok.Data;

@Data
public class Reservation_DetailVO {
	private int me_idx; // 메뉴번호
	private int r_idx; // 예약번호
	private String me_name; // 메뉴이름
	private int quantity; // 인원수
}

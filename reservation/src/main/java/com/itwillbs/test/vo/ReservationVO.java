package com.itwillbs.test.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVO {
	private int r_idx; // 예약번호
//	private int m_idx; // 회원번호
//	private int c_idx; // 점주 번호
	private String me_name; //예약한 메뉴
	private int r_amount; // 예약비용
	private int r_tables;// 테이블 수
	private int r_personnel; //예약 인원
	private String m_name; // 예약자 이름 (점주 예약 관리 페이지 예약자이름 출력을 위해)	
	private int r_status; // 예약 상태 (출력할때)
	private Timestamp r_date; // 예약 날짜
	private String r_request; // 요청사항
	private int res_idx; // 레스토랑 번호
	private String res_name; // 식당 이름 (점주 예약 관리 페이지 식당이름 출력을 위해)
}

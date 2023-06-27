package com.itwillbs.test.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVO {
	private int r_idx; // 예약번호
	private int m_idx; // 회원번호
	private int c_idx; // 점주 번호
	private String me_name; //예약한 메뉴
	private int r_amount; // 예약비용
	private int r_tables;// 테이블 수
	private int r_personnel; //예약 인원
	private int r_status; // 예약 상태 (출력할때)
	private Timestamp r_date; // 예약 날짜
	private String r_request; // 요청사항
	private int res_idx; // 레스토랑 번호
	private int total; // 사이트 총 매출 조회를 위한 컬럼
	//---------------------------
	private int rv_status; // 리뷰를 작성하였는지에 대한 상태
	
	// -------------------------- 예약내역 출력 참조중
	private String res_name; // 식당 이름 (점주 예약 관리 페이지 식당이름 출력을 위해)
	private String m_name; // 예약자 이름 (점주 예약 관리 페이지 예약자이름 출력을 위해)	
    private String res_address; // 식당 주소
    private String res_detailAddress; // 식당 상세주소
    private String res_amenity; // 식당 편의시설 
    private String res_amenity_info; // 식당 편의시설 설명
    private Timestamp date; // 통계를 위한 날짜 정보
    private int count; // 통계를 위한 예약 수 카운트
    private String res_photo1; // 대표사진
}

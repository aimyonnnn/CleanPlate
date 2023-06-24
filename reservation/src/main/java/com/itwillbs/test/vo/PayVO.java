package com.itwillbs.test.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PayVO {

	private int p_idx; // 결제번호
	private String p_orderNum; // 주문번호
	private String payment_num; // 아임포트imp_uid값
	private Date p_orderDate; // 주문일자
	private int payment_total_price; // 가격
	private int p_status; // 결제상태 1-결제완료 2-결제취소
	private String m_id; // 회원아이디
	private int r_idx; // 예약번호
	private String reason; // "테스트 결제 환불" 고정값
	
}

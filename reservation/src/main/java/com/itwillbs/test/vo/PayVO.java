package com.itwillbs.test.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PayVO {

	private int p_idx; // 결제번호
	private String p_orderNum; // 주문번호-자동생성한것
	private String p_imp_uid; // 아임포트 주문번호 -> 취소할때 필요함
	private Date p_orderDate; // 주문일자
	private int p_price; // 가격
	private int p_status; // 결제상태 1-결제완료 2-결제취소
	private String m_id; // 회원아이디
	private int r_idx; // 예약번호
	
}

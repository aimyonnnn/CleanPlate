package com.itwillbs.test.vo;

import java.sql.Date;

import lombok.Data;
/*
CREATE TABLE payment (
    p_idx INT not null primary key auto_increment COMMENT '결제번호',
    p_orderNum VARCHAR(255) not null COMMENT '주문번호',
    payment_num VARCHAR(255) not null COMMENT '아임포트imp_uid값',
    p_orderDate TIMESTAMP not null COMMENT '결제날짜',
    payment_total_price INT not null COMMENT '결제금액',
    p_status INT not null COMMENT '결제상태 1-결제완료, 2-결제취소',
    m_idx int not null COMMENT '회원번호',
    r_idx int not null COMMENT '예약번호',
    FOREIGN key(m_idx) REFERENCES members(m_idx),
    FOREIGN key(r_idx) REFERENCES reservation(r_idx)
);
*/

@Data
public class PayVO {
	private int p_idx; // 결제번호
	private String p_orderNum; // 주문번호
	private String payment_num; // 아임포트imp_uid값
	private Date p_orderDate; // 주문일자
	private int payment_total_price; // 가격
	private int p_status; // 결제상태 1-결제완료 2-결제취소
	private int m_idx; // 회원번호
	private int r_idx; // 예약번호
	private String reason; // "테스트 결제 환불" 고정값
}

package com.itwillbs.test.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


/*
CREATE TABLE QNA (
    q_idx int PRIMARY KEY AUTO_INCREMENT comment 'QNA 번호'
    , q_subject varchar(50) NOT NULL comment 'QNA 제목'
    , q_context varchar(500) NOT NULL comment 'QNA 내용'
    , q_re_context varchar(500) comment '답변'
    , q_division int NOT NULL comment '회원/점주 구분  1 - 회원  2 - 점주'
    , q_category int NOT NULL comment '구분 1 - 결제 문의 2 - 오류 문의 3 - 사용문의 4 - 기타문의'
    , q_file varchar(100) comment 'QNA 파일'
    , m_idx int NOT NULL comment 'QNA 회원 번호'
    , FOREIGN KEY (m_idx) REFERENCES members (m_idx)
);
 */

@Data
public class QNAVO {

	private int q_idx;
	private String q_subject;
	private String q_context;
	private String q_re_context;
	private int q_division;
	private int q_category;
	private String q_file;
	private Timestamp q_date;
	private int m_idx;
	private int c_idx;
	private MultipartFile file;
}

package com.itwillbs.test.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
   CREATE TABLE reviews (
	rv_idx int PRIMARY KEY AUTO_INCREMENT, -- 리뷰번호
	rv_scope int NOT NULL, -- 별점
	rv_comment varchar(500) NOT NULL, -- 리뷰내용
	rv_img varchar(50), -- 리뷰 이미지
	res_idx int NOT NULL, -- 레스토랑 번호
	m_idx int NOT NULL, -- 회원 번호
	FOREIGN KEY (res_idx) REFERENCES restaurant (res_idx),
	FOREIGN KEY (m_idx) REFERENCES members (m_idx)
);
 */

@Data
public class ReviewVO {
	private int rv_idx; // 리뷰번호
	private int rv_scope; // 별점
	private String rv_comment; // 리뷰내용
	private String rv_img; // 리뷰 이미지
	private String m_nick; // 닉네임
	private int r_idx; // 예약번호
	private MultipartFile img; // 진짜 이미지
	private String res_name; //레스토랑 이름
}

package com.itwillbs.test.vo;

import lombok.*;

/*

-- 식당 테이블 생성
CREATE TABLE restaurant (
	res_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '식당번호',
	res_brn VARCHAR(12) NOT NULL COMMENT '사업자등록번호',
	res_name VARCHAR(100) NOT NULL COMMENT '식당이름',
	res_tel VARCHAR(13) NOT NULL COMMENT '식당전화번호',
	res_address VARCHAR(100) NOT NULL COMMENT '식당주소',
	res_detailAddress VARCHAR(50) NOT NULL COMMENT '상세주소',
	res_openinghours VARCHAR(15) NOT NULL COMMENT '영업시간',
	res_breaktime VARCHAR(15) COMMENT '브레이크타임',
	res_dayoff VARCHAR(3) NOT NULL COMMENT '휴무',
	res_amenity VARCHAR(50) COMMENT '편의시설',
	res_amenity_info VARCHAR(50) COMMENT '편의시설 설명',
	res_photo1 VARCHAR(50) NOT NULL COMMENT '필수 가게사진1',
	res_photo2 VARCHAR(50) COMMENT '가게사진2',
	res_photo3 VARCHAR(50) COMMENT '가게사진3',
	res_intro VARCHAR(100) NOT NULL COMMENT '가게소개',
	c_idx INT NOT NULL COMMENT '점주번호',
	FOREIGN KEY (c_idx) REFERENCES ceo (c_idx)
);

*/
@Data
public class RestaurantVO {
	private int res_idx;
	private String res_brn;
	private String res_name;
	private String res_tel;
	private String res_address;
	private String res_detailAddress;
	
	private String res_openinghours;
	private String res_open;
	private String res_close;
	
	private String res_breaktime;
	private String res_breakstart;
	private String res_breakend;
	
	private String res_totaltable;
	private String res_dayoff;
	private String res_amenity;
	private String res_amenity_info;
	
	private String res_photo1;
	private String res_photo2;
	private String res_photo3;
	private String res_intro;
	
	
}

package com.itwillbs.test.vo;

import lombok.*;

/*
CREATE TABLE restaurant (
	res_idx INT AUTO_INCREMENT,
	res_brn VARCHAR(12) NOT NULL,
	res_name VARCHAR(100) NOT NULL,
	res_tel VARCHAR(13) NOT NULL,
	res_address VARCHAR(100) NOT NULL,
	res_detailAddress VARCHAR(50) NOT NULL,
	res_open VARCHAR(5) NOT NULL,
	res_close  VARCHAR(5) NOT NULL,
	res_breakstart VARCHAR(5),
	res_breakend VARCHAR(5),
	res_holiday VARCHAR(3) NOT NULL,
	res_amenity VARCHAR(10),
	res_photo VARCHAR(50),
	res_intro VARCHAR(100) NOT NULL,
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
	private String res_open;
	private String res_close;
	private String res_breakstart;
	private String res_breakend;
	private String res_holiday;
	private String res_amenity;
	private String res_photo;
	private String res_intro;
	
}

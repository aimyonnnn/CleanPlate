package com.itwillbs.test.vo;

import org.springframework.web.multipart.*;

import com.google.gson.*;

/*
CREATE TABLE menus (
	me_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '메뉴번호',
	me_name varchar(50) NOT NULL COMMENT '메뉴이름',
	me_price INT NOT NULL COMMENT '메뉴가격',
	me_context varchar(400) NOT NULL COMMENT'메뉴설명',
	me_photo varchar(50) NOT NULL COMMENT '메뉴사진',
	res_idx INT NOT NULL COMMENT '식당번호',
	FOREIGN KEY (res_idx) REFERENCES restaurant (res_idx)
);
*/
import lombok.*;

@Data
public class MenuVO {
	
	private int me_idx;
	private String me_name;
	private int me_price;
	private String me_context;
	private String me_photo;
	private MultipartFile me_file;
	private String me_file_name;
	private int res_idx;
	
	
	
}

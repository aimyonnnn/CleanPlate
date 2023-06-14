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

// 검색 테스트용 샘플 데이터
INSERT INTO restaurant (res_brn, res_name, res_tel, res_address, res_detailAddress, res_open, res_close, res_breakstart, res_breakend, res_holiday, res_amenity, res_photo, res_intro)
VALUES
  ('1234567890', '레스토랑1', '010-1234-5678', '서울특별시 강남구', '강남로 123번길', '09:00', '21:00', '13:00', '14:00', '월', '와인 바', 'restaurant1.jpg', '레스토랑1 소개'),
  ('2345678901', '레스토랑2', '010-2345-6789', '서울특별시 강서구', '강서로 456번길', '08:30', '20:30', NULL, NULL, '화', '야외 테라스', 'restaurant2.jpg', '레스토랑2 소개'),
  ('3456789012', '레스토랑3', '010-3456-7890', '서울특별시 종로구', '종로로 789번길', '10:00', '22:00', '14:00', '15:00', '수', '키즈 코너', 'restaurant3.jpg', '레스토랑3 소개'),
  ('4567890123', '레스토랑4', '010-4567-8901', '서울특별시 송파구', '송파로 1234번길', '07:30', '19:30', NULL, NULL, '목', NULL, 'restaurant4.jpg', '레스토랑4 소개'),
  ('5678901234', '레스토랑5', '010-5678-9012', '서울특별시 강동구', '강동로 2345번길', '09:30', '21:30', '12:30', '13:30', '금', '주차장', 'restaurant5.jpg', '레스토랑5 소개'),
  ('6789012345', '레스토랑6', '010-6789-0123', '서울특별시 마포구', '마포로 3456번길', '08:00', '20:00', NULL, NULL, '토', '바다 전망', 'restaurant6.jpg', '레스토랑6 소개')

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

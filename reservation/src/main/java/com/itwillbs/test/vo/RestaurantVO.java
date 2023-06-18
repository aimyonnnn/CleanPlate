package com.itwillbs.test.vo;

import lombok.*;

/*
CREATE TABLE restaurant (
	res_idx INT AUTO_INCREMENT PRIMARY KEY,
	res_brn VARCHAR(12) NOT NULL COMMENT '사업자등록번호',
	res_name VARCHAR(100) NOT NULL COMMENT '가게명',
	res_tel VARCHAR(13) NOT NULL COMMENT '전화번호',
	res_address VARCHAR(100) NOT NULL COMMENT '주소',
	res_detailAddress VARCHAR(50) NOT NULL COMMENT '상세주소',
	res_open time NOT NULL COMMENT '영업시작시간',
	res_close time NOT NULL COMMENT '영업종료시간',
	res_breakstart time COMMENT '브레이크타임시작시간',
	res_breakend time COMMENT '브레이크타임종료시간',
	res_holiday VARCHAR(3) NOT NULL COMMENT '휴무일',
	res_amenity VARCHAR(50) COMMENT '편의시설',
	res_photo VARCHAR(50) COMMENT '가게사진',
	res_intro VARCHAR(100) NOT NULL COMMENT '가게소개글'
);

// 샘플 데이터
INSERT INTO restaurant (res_brn, res_name, res_tel, res_address, res_detailAddress, res_open, res_close, res_breakstart, res_breakend, res_holiday, res_amenity, res_photo, res_intro) VALUES
('123456789012', 'Restaurant A', '123-456-7890', '123 Main Street', 'Unit 1', '09:00:00', '18:00:00', '13:00:00', '14:00:00', 'Sun', 'WiFi, Parking', 'photo_a.jpg', 'Welcome to Restaurant A!'),
('987654321098', 'Restaurant B', '987-654-3210', '456 Elm Street', 'Suite 2', '10:00:00', '20:00:00', NULL, NULL, 'Mon', 'Outdoor Seating, Takeout', 'photo_b.jpg', 'Experience the finest at Restaurant B.'),
('456789012345', 'Restaurant C', '456-789-0123', '789 Oak Street', 'Apt 3', '08:30:00', '17:30:00', NULL, NULL, 'Tue', 'Delivery, Bar', 'photo_c.jpg', 'Discover the flavors of Restaurant C.'),
('654321098765', 'Restaurant D', '654-321-0987', '987 Maple Avenue', 'Floor 4', '07:00:00', '16:00:00', '12:00:00', '13:00:00', 'Wed', 'Private Dining, Live Music', 'photo_d.jpg', 'Indulge in the ambiance of Restaurant D.'),
('987012345678', 'Restaurant E', '987-012-3456', '321 Cedar Street', 'Unit 5', '11:30:00', '21:30:00', NULL, NULL, 'Thu', 'Vegetarian Options, Outdoor Seating', 'photo_e.jpg', 'Experience a delightful journey at Restaurant E.');


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

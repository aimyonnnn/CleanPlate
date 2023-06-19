package com.itwillbs.test.vo;


import lombok.*;

/*
CREATE TABLE restaurant (
	res_idx INT AUTO_INCREMENT PRIMARY KEY,
	res_brn VARCHAR(12) NOT NULL COMMENT '사업자등록번호',
	res_name VARCHAR(100) NOT NULL COMMENT '가게명',
	res_tel VARCHAR(13) NOT NULL COMMENT '전화번호',
	res_postcode int NOT NULL COMMENT '우편번호',
	res_address VARCHAR(100) NOT NULL COMMENT '주소',
	res_detailAddress VARCHAR(50) COMMENT '상세주소',
	res_open time NOT NULL COMMENT '영업시작시간',
	res_close time NOT NULL COMMENT '영업종료시간',
	res_breakstart time COMMENT '브레이크타임시작시간',
	res_breakend time COMMENT '브레이크타임종료시간',
	res_holiday VARCHAR(3) NOT NULL COMMENT '휴무일',
	res_amenity VARCHAR(50) COMMENT '편의시설',
	res_photo VARCHAR(50) COMMENT '가게사진',
	res_intro VARCHAR(100) NOT NULL COMMENT '가게소개글'
);

======================================###DB에 저장된 사진 출력하는 방법###======================================
// 사진 경로 : src/main/webapp/resources/images/restaurant/1.jpg
// DB에 사진 경로를 저장할 때 "restaurant/1.jpg" "restaurant/2.jpg" "restaurant/3.jpg" 이렇게 저장한 뒤에
// <img src="${pageContext.request.contextPath }/resources/images/${restaurant.res_photo}" class="card-img-top" alt="Item Image">
// 위와 같이 입력하면 사진이 출력됩니다.

// 2줄 요약
// DB에 사진 저장할 때 restaurant/1.jpg 이런식으로 저장한다. 폴더명/파일명.jpg
// 뷰 페이지에서 출력하고 싶을 때 ${xxx_photo}로 꺼내서 <img src=""> 안에 위와 같이 붙여넣는다!
======================================###DB에 저장된 사진 출력하는 방법###======================================

### 사진을 출력 할 수 있게 이미지 경로를 추가하였습니다###
-- restaurant 테이블
INSERT INTO restaurant (res_brn, res_name, res_tel, res_address, res_detailAddress, res_open, res_close, res_breakstart, res_breakend, res_holiday, res_amenity, res_photo, res_intro) VALUES
('123456789012', 'Restaurant A', '123-456-7890', '123 Main Street', 'Unit 1', '09:00:00', '18:00:00', '13:00:00', '14:00:00', 'Sun', 'WiFi, Parking', 'restaurant/1.jpg', 'Welcome to Restaurant A!'),
('987654321098', 'Restaurant B', '987-654-3210', '456 Elm Street', 'Suite 2', '10:00:00', '20:00:00', NULL, NULL, 'Mon', 'Outdoor Seating, Takeout', 'restaurant/2.jpg', 'Experience the finest at Restaurant B.'),
('456789012345', 'Restaurant C', '456-789-0123', '789 Oak Street', 'Apt 3', '08:30:00', '17:30:00', NULL, NULL, 'Tue', 'Delivery, Bar', 'restaurant/3.jpg', 'Discover the flavors of Restaurant C.'),
('654321098765', 'Restaurant D', '654-321-0987', '987 Maple Avenue', 'Floor 4', '07:00:00', '16:00:00', '12:00:00', '13:00:00', 'Wed', 'Private Dining, Live Music', 'restaurant/4.jpg', 'Indulge in the ambiance of Restaurant D.'),
('987012345678', 'Restaurant E', '987-012-3456', '321 Cedar Street', 'Unit 5', '11:30:00', '21:30:00', NULL, NULL, 'Thu', 'Vegetarian Options, Outdoor Seating', 'restaurant/5.jpg', 'Experience a delightful journey at Restaurant E.');


*/
@Data
public class RestaurantVO {
	private int res_idx;
	private String res_brn;
	private String res_name;
	private String res_tel;
	private String res_postcode;
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

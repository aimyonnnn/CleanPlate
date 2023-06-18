package com.itwillbs.test.vo;

import com.google.gson.Gson;

import lombok.Data;

/*
 
 // 양도 게시판 테스트를 위한 샘플 데이터 입니다.
 // 순서대로 입력하시면 됩니다.
 
 // #####구매자가 양도 게시판에서 구매하기를 클릭하고 결제 시#####
 // 1. 예약 테이블의 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
 // => 구매자의 회원번호는 sId 세션값으로 아이디를 조회하여 가져옴
 // 2. 양도 테이블의 양도상태 컬럼을 2-거래완료로 변경
 // 3. 양도 게시판으로 다시 접속 시 '2-거래완료' 처리된 글은 보이지 않음
 // => 양도 게시판 게시물 조회 시 
 // 1. 양도상태가 '2-거래완료'가 아니고
 // 2. 예약일자가 오늘 이후인 경우만 조회, 이전 날짜는 조회 안되게 함

use cleanplate;
show tables;
select * from members;
select * from restaurant;
select * from reservation;
select * from assignment;

drop table members;
drop table restaurant;
drop table reservation;
drop table assignment;

-- members 테이블
INSERT INTO members (m_id, m_passwd, m_name, m_nick, m_birth, m_tel, m_email, m_status, m_regdate)
VALUES
('user1', '1234', 'User1', 'Nickname1', '1990-01-01', '010-1234-5678', 'user1@example.com', 1, NOW()),
('user2', '1234', 'User2', 'Nickname2', '1995-02-02', '010-9876-5432', 'user2@example.com', 1, NOW()),
('user3', '1234', 'User3', 'Nickname3', '2000-03-03', '010-5555-5555', 'user3@example.com', 1, NOW());

-- restaurant 테이블
INSERT INTO restaurant (res_brn, res_name, res_tel, res_address, res_detailAddress, res_open, res_close, res_breakstart, res_breakend, res_holiday, res_amenity, res_photo, res_intro) VALUES
('123456789012', 'Restaurant A', '123-456-7890', '123 Main Street', 'Unit 1', '09:00:00', '18:00:00', '13:00:00', '14:00:00', 'Sun', 'WiFi, Parking', 'restaurant/1.jpg', 'Welcome to Restaurant A!'),
('987654321098', 'Restaurant B', '987-654-3210', '456 Elm Street', 'Suite 2', '10:00:00', '20:00:00', NULL, NULL, 'Mon', 'Outdoor Seating, Takeout', 'restaurant/2.jpg', 'Experience the finest at Restaurant B.'),
('456789012345', 'Restaurant C', '456-789-0123', '789 Oak Street', 'Apt 3', '08:30:00', '17:30:00', NULL, NULL, 'Tue', 'Delivery, Bar', 'restaurant/3.jpg', 'Discover the flavors of Restaurant C.'),
('654321098765', 'Restaurant D', '654-321-0987', '987 Maple Avenue', 'Floor 4', '07:00:00', '16:00:00', '12:00:00', '13:00:00', 'Wed', 'Private Dining, Live Music', 'restaurant/4.jpg', 'Indulge in the ambiance of Restaurant D.'),
('987012345678', 'Restaurant E', '987-012-3456', '321 Cedar Street', 'Unit 5', '11:30:00', '21:30:00', NULL, NULL, 'Thu', 'Vegetarian Options, Outdoor Seating', 'restaurant/5.jpg', 'Experience a delightful journey at Restaurant E.');

 -- reservation 테이블
INSERT INTO reservation (m_idx, r_personnel, r_status, r_date, res_idx)
VALUES
  (1, 2, 1, '2023-06-19 18:00:00', 1),
  (1, 4, 1, '2023-06-20 12:30:00', 2),
  (1, 3, 1, '2023-06-21 20:00:00', 3),
  (2, 1, 1, '2023-06-22 19:00:00', 4),
  (2, 2, 1, '2023-06-23 15:30:00', 5);
 
 -- assignment 테이블, 100원 테스트 결제용
 INSERT INTO assignment (a_status, a_price, a_sellerId, r_idx) VALUES
(1, 100, 'seller1', 1),
(1, 200000, 'seller2', 2),
(2, 150000, 'seller3', 3),
(1, 120000, 'seller4', 4),
(2, 580000, 'seller5', 5);

*/

@Data
public class AssignmentVO { // 양도테이블
	
	private int a_idx; // 양도번호
    private int a_status; // 양도상태
    private int a_price; // 가격
    private String a_sellerId; // 판매자
    private int r_idx; // 예약번호
    private String r_date; // 예약 날짜 및 시간
    private String res_name; // 가게명
    private String res_photo; // 가게 사진
    
    // json으로 변환
    public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
    }
    
    
}
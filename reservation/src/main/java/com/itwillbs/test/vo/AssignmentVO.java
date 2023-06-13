package com.itwillbs.test.vo;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

/*

양도 게시판 데이터 출력용 임시VO 입니다.
정렬, 필터 기능 테스트용으로 만들었습니다.
구문, 데이터 입력하면 정렬, 필터기능 정상 동작합니다.

1. SQL 구문

CREATE TABLE assignment (
  a_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '양도 인덱스',
  a_title VARCHAR(45) NOT NULL COMMENT '제목',
  a_content VARCHAR(500) COMMENT '내용',
  a_status INT NOT NULL COMMENT '상태',
  a_reservation_date DATE COMMENT '예약 날짜',
  a_price int COMMENT '가격',
  a_image VARCHAR(45) COMMENT '이미지',
  a_created_date DATE NOT NULL COMMENT '생성일',
  m_idx INT NOT NULL COMMENT '회원번호',
);

2. 임시 데이터

INSERT INTO ASSIGNMENT (a_title, a_content, a_status, a_reservation_date, a_price, a_image, a_created_date, m_idx)
VALUES
  ('La Finest', '프렌치 레스토랑으로, 고급스러운 분위기와 정교한 프렌치 요리를 즐길 수 있습니다.', 1, '2023-07-01', 500000, '이미지1.jpg', '2023-06-09', 1),
  ('Belluca', '이탈리안 다이닝 레스토랑으로, 품위 있는 분위기와 훌륭한 이탈리안 요리를 제공합니다.', 1, '2023-06-12', 490000, '이미지2.jpg', '2023-06-08', 1),
  ('Cortina', '알프스 산맥을 연상시키는 고급스러운 스키 리조트 레스토랑으로, 산간지역의 특산물을 사용한 요리를 즐길 수 있습니다.', 1, '2023-06-18', 700000, '이미지3.jpg', '2023-06-01', 1),
  ('Esquisse', '현대적이고 세련된 분위기의 프렌치 다이닝 레스토랑으로, 현대적인 감각으로 재해석된 프렌치 요리를 선보입니다.', 1, '2023-06-13', 800000, '이미지4.jpg', '2023-05-30', 1),
  ('Essorée', '동남아시아 요리에 특화된 고급 다이닝 레스토랑으로, 태국, 인도네시아, 베트남 등 동남아시아의 다채로운 맛을 경험할 수 있습니다.', 1, '2023-06-14', 650000, '이미지5.jpg', '2023-05-29', 1),
  ('Grand', '내지중해를 배경으로 한 고급스러운 다이닝 레스토랑으로, 지중해 지역의 해산물과 향신료를 사용한 요리를 맛볼 수 있습니다.', 1, '2023-07-13', 590000, '이미지6.jpg', '2023-06-03', 2),
  ('Le Jardin', '프랑스의 정원을 연상시키는 아름다운 실내 정원 레스토랑으로, 신선한 재료와 아름다운 분위기가 특징입니다.', 1, '2023-06-15', 450000, '이미지7.jpg', '2023-06-05', 2),
  ('La Boulangerie', '프랑스식 빵집으로, 신선한 빵과 디저트를 맛볼 수 있습니다.', 1, '2023-07-05', 750000, '이미지3.jpg', '2023-06-16', 1),
  ('Sushi Yama', '일본식 초밥 전문 레스토랑으로, 신선한 재료와 정교한 솜씨로 만들어지는 초밥을 즐길 수 있습니다.', 1, '2023-06-21', 890000, '이미지8.jpg', '2023-06-03', 2),
  ('Mexican Delight', '멕시코 음식 전문 레스토랑으로, 풍부한 맛과 특색 있는 멕시코 음식을 맛볼 수 있습니다.', 1, '2023-07-10', 510000, '이미지9.jpg', '2023-06-12', 2),
  ('The Grill House', '고급 스테이크 하우스로, 최상급의 고기와 정통 그릴 요리를 즐길 수 있습니다.', 1, '2023-06-25', 550000, '이미지10.jpg', '2023-06-10', 2),
  ('Seafood Paradise', '해산물 요리 전문 레스토랑으로, 신선한 해산물과 다양한 해산물 요리를 맛볼 수 있습니다.', 1, '2023-07-15', 420000, '이미지11.jpg', '2023-06-02', 2),
  ('Vegetarian Delight', '채식주의자를 위한 고급 채식 레스토랑으로, 신선한 채소와 다양한 채식 요리를 제공합니다.', 1, '2023-06-29', 990000, '이미지12.jpg', '2023-06-01', 2)

*/

@Data
public class AssignmentVO { // 양도테이블
	
    private int a_idx; // 양도번호
    private String a_title; // 양도글 제목
    private String a_content; // 내용 
    private int a_status; // 양도글 상태 1-거래중, 2-거래완료
    private Date a_reservation_date; // 예약날짜
    private int a_price; // 가격 
    private String a_image; // 이미지
    private Date a_created_date; // 작성날짜
    private int m_idx; // 회원번호 
    
    
    // json으로 변환
    public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
    }
    
    
}
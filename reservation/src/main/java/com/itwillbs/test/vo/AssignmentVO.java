package com.itwillbs.test.vo;

import com.google.gson.Gson;

import lombok.Data;

/*
 
 // #####구매자가 양도 게시판에서 구매하기를 클릭하고 결제 시#####
 // 1. 예약 테이블의 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
 // => 구매자의 회원번호는 sId 세션값으로 아이디를 조회하여 가져옴
 // 2. 양도 테이블의 양도상태 컬럼을 2-거래완료로 변경
 // 3. 양도 게시판으로 다시 접속 시 '2-거래완료' 처리된 글은 보이지 않음
 // => 양도 게시판 게시물 조회 시 
 // 1. 양도상태가 '2-거래완료'가 아니고
 // 2. 예약일자가 오늘 이후인 경우만 조회, 이전 날짜는 조회 안되게 함

*/

@Data
public class AssignmentVO { // 양도테이블
	
	private int a_idx; // 양도번호
    private int a_status; // 양도상태
    private int a_price; // 가격
    private String a_sellerId; // 판매자
    private int r_idx; // 예약번호
    

    // json으로 변환
    public String toJson() {
      Gson gson = new Gson();
      return gson.toJson(this);
    }
    
    
}
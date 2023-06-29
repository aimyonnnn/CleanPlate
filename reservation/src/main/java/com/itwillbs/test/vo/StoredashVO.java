package com.itwillbs.test.vo;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class StoredashVO {
	private int storeId;
	private int reservationCount;
	private String c_id;
	private String orderDate; // 예약 날짜
	private int salesAmount; // 매출 금액
	private int salesCount; // 매출 건수


}
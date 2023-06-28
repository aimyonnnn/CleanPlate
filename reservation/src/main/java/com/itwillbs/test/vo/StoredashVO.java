package com.itwillbs.test.vo;

import lombok.Data;

@Data
public class StoredashVO {
	private int storeId;
	private int reservationCount;
	private String c_id;
	private String orderDate;
	private int salesAmount;
	private int salesCount;
}
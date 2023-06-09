package com.itwillbs.test.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CeoVO { // 회원 테이블
	private int c_idx; // 점주번호
	private String c_id; // 아이디
	private String c_passwd; // 패스워드
	private String c_name; // 이름
	private String c_tel; // 전화번호
	private String c_email; // 이메일
	private CeoStatus c_status; // enum 타입 회원상태
	private Date c_regdate; // 회원가입일
}

enum CeoStatus {
	ACTIVE(1), SUSPENSION(2), WITHDRAWAL(3);
	
	private int value;
	
	CeoStatus(int value) {
		this.value = value;
	}
	
	public int getValue() {
        return value;
    }
}

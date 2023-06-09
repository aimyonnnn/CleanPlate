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
	private String c_status; // 회원상태
	private Date c_regdate; // 회원가입일
}


package com.itwillbs.test.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO { // 회원 테이블
	private int m_idx; // 회원번호
	private String m_id; // 아이디
	private String m_passwd; // 패스워드
	private String m_name; // 이름
	private String m_nick; // 닉네임
	private String m_birth; // 생년월일
	private String m_tel; // 전화번호
	// -----전화번호 분리용  ---------------
	private String m_tel1; // 전화번호1
	private String m_tel2; // 전화번호2
	private String m_tel3; // 전화번호3
	// -------------------------------------
	private String m_email; // 이메일
	// -----이메일 분리용  -----------------
	private String m_email1; // 이메일1
	private String m_email2; // 이메일2
	// -------------------------------------
	private int m_status; // 회원상태
	private Date m_regdate; // 회원가입일
	private int userType; // 일반, 기업회원 구분
}

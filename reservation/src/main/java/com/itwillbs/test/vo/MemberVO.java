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
	private String m_email; // 이메일
	private String m_status; // 회원상태
	private Date m_regdate; // 회원가입일
}

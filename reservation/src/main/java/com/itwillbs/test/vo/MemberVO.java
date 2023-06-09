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
	private MemberStatus m_status; // enum 타입 회원상태
	private Date m_regdate; // 회원가입일
}

enum MemberStatus {
	ACTIVE(1), SUSPENSION(2), WITHDRAWAL(3); // 활동중, 정지, 탈퇴
	
	private int value;
	
	MemberStatus(int value) {
		this.value = value;
	}
	
	public int getValue() {
        return value;
    }
}
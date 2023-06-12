package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.CeoVO;
import com.itwillbs.test.vo.MemberVO;

@Mapper
public interface LoginMapper {
	
	// 로그인 시 id, passwd 조회하기
	MemberVO isCorrectUser(@Param("id") String id, @Param("passwd") String passwd);
	
	// 카카오 이메일로 로그인 시 email 조회하기
	MemberVO isCorrectKakaoUser(String email);
	
	// 회원 아이디 찾기를 위한 이름과 전화번호 조회
	MemberVO selectMemberId(@Param("m_name") String m_name, @Param("m_tel") String m_tel);

	// 점주 아이디 찾기를 위한 이름과 전화번호 조회
	CeoVO selectCeoId(@Param("c_name") String c_name, @Param("c_tel") String c_tel);
	
	// 회원 비밀번호 번경전 정보가 있는지 조회
	MemberVO selectMemberPasswd(MemberVO membervo);

	CeoVO selectCeoPasswd(CeoVO ceo);
	
}

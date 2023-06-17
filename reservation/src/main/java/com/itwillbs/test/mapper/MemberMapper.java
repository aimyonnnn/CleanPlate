package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 개인회원 등록
	int insertMember(MemberVO member);
	
	// 임시비밀번호 업데이트
	int updatePassword(MemberVO membervo);

	// 맴버 정보 수정을 위한 아이디 및 패스워드 조회
	MemberVO isCorrectMember(@Param("id") String id, @Param("passwd") String passwd);

	// 멤버 정보 수정
	int updateMember(MemberVO member);

	// 멤버 정보 조회
	MemberVO selectMember(@Param("id") String id);
	
	// 양도 결제시 필요한 고객 정보
	MemberVO selectMemberInfo(String sId);

}

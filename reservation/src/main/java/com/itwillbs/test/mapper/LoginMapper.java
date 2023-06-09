package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.MemberVO;

@Mapper
public interface LoginMapper {
	
	// 로그인 시 id, passwd 조회하기
	MemberVO isCorrectUser(@Param("id") String id, @Param("passwd") String passwd);
	
	// 카카오 이메일로 로그인 시 email 조회하기
	MemberVO isCorrectKakaoUser(String email);
	
}

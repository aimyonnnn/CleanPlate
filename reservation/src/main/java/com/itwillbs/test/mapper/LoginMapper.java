package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.MemberVO;

@Mapper
public interface LoginMapper {
	
	// id, passwd 조회하기
	MemberVO isCorrectUser(@Param("id") String id, @Param("passwd") String passwd);
	
}

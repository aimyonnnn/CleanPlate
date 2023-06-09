package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.MemberVO;
@Mapper
public interface MemberMapper {
	
	// 개인회원 등록
	int insertMember(MemberVO member);

}

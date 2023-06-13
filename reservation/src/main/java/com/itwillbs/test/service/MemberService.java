package com.itwillbs.test.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.MemberMapper;
import com.itwillbs.test.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	// 개인회원 등록
	public int registMember(MemberVO member) {
		System.out.println("registMember");
		return mapper.insertMember(member);
	}
	
	// 임시 비빌번호 업데이트
	public int randomPassword(MemberVO membervo) {
		return mapper.updatePassword(membervo);
	}

	// 회원정보 폼 접근 시 , id, passwd 확인
	public MemberVO isCorrectMember(String id, String passwd) {
		return mapper.isCorrectMember(id, passwd);
	}

	// 회원 정보 수정
	public int updateMember(MemberVO member) {
		return mapper.updateMember(member);
	}
	
	public MemberVO selectMember(@Param("id") String id) {
		return mapper.selectMember(id);
	}
	
}

package com.itwillbs.test.service;

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
	
}

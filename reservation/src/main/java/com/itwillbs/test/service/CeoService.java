package com.itwillbs.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.CeoMapper;
import com.itwillbs.test.vo.CeoVO;

@Service
public class CeoService {
	@Autowired
	private CeoMapper mapper;

	// 점주 회원 등록 
	public int registCeo(CeoVO ceo) {
		System.out.println("registCeo");
		return mapper.insertCeo(ceo);
	}
	
	// 점주 임시비밀번호 발급
	public int randomPassword(CeoVO ceoResult) {
		return mapper.updatePasswdCeo(ceoResult);
	}
	
	public String isCorrectCeo(String id) {
		return mapper.selectCeo(id);
	}
}

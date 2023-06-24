package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.HelpMapper;
import com.itwillbs.test.mapper.MemberMapper;
import com.itwillbs.test.vo.HelpVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.QNAVO;

@Service
public class HelpService {
	
	@Autowired
	HelpMapper mapper;
	@Autowired
	MemberMapper mMapper;

	// help 게시판 목록 조회
	public List<HelpVO> getHelpList(int h_index) {
		return mapper.getHelplist(h_index);
	}

	public int registQNA(QNAVO qna, String id) {
		MemberVO member = mMapper.isCorrectMember(id);
		qna.setM_idx(member.getM_idx());
		return mapper.insertQNA(qna);
	}

}

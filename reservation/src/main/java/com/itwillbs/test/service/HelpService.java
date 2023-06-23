package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.HelpMapper;
import com.itwillbs.test.vo.HelpVO;

@Service
public class HelpService {
	
	@Autowired
	HelpMapper mapper;

	// help 게시판 목록 조회
	public List<HelpVO> getHelpList(int h_index) {
		return mapper.getHelplist(h_index);
	}

}

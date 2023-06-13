package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.AssignmentMapper;
import com.itwillbs.test.vo.AssignmentVO;

@Service
public class AssignmentService {
	
	@Autowired
	private AssignmentMapper mapper;
	
	// 양도게시판 전체 리스트 조회하기
	public List<AssignmentVO> getAssignmentList() {
		return mapper.getAssignmentList();
	}
	
}

package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.AssignmentVO;

public interface AssignmentMapper {

	// 양도게시판 전체 리스트 조회하기
	List<AssignmentVO> getAssignmentList();
	
}

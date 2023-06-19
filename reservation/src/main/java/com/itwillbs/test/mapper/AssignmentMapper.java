package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.AssignmentVO;

public interface AssignmentMapper {

	// 양도 게시판 출력
	List<AssignmentVO> getAssignmentList();
	
	// 양도상태'2-거래완료'로 변경
	int updateStatus(int r_idx);
	
}

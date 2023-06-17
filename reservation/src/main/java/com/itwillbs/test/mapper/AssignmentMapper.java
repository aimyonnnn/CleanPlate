package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.AssignmentVO;

public interface AssignmentMapper {

	// 양도게시판 전체 리스트 조회하기
	List<AssignmentVO> getAssignmentList();
	
	// 양도 테이블의 양도상태 컬럼을 2-거래완료로 변경하기
	int updateStatus(int r_idx);
	
}

package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.AssignmentVO;

public interface AssignmentMapper {

	// 양도 게시판 출력
	List<AssignmentVO> getAssignmentList();
	
	// 양도상태'2-거래완료'로 변경
	int updateStatus(int r_idx);
	
	// 관리자의 양도 리스트 조회
	List<AssignmentVO> getAdminAssignmentList();

	// 관리자의 양도 정보 삭제
	int deleteAssignment(String idx);
}

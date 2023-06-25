package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	// 양도 게시판 글 쓰기
	int insertAssignment(@Param("salesValue") int salesValue, @Param("sId") String sId, @Param("r_idx") int r_idx);
	
	// 양도 게시판 가격 수정하기
	int updateSalesPrice(@Param("salesValue") int salesValue, @Param("r_idx") int r_Idx);
	
	// 양도 내역 조회
	List<AssignmentVO> selectAssignInfo(String sId);
}

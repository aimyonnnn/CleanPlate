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
	
	// 양도 테이블의 양도상태 컬럼을 2-거래완료로 변경하기
	public int updateStatus(int r_idx) {
		return mapper.updateStatus(r_idx);
	}
	
}

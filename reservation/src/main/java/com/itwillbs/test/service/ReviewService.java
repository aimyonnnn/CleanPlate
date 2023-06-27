package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.ReviewMapper;
import com.itwillbs.test.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewMapper mapper;

	// 리뷰 목록 조회
	public List<ReviewVO> getAdminReviewList() {
		return mapper.getAdminReviewList();
	}

	// 리뷰 정보 삭제
	public int deleteReview(String idx) {
		return mapper.deleteReview(idx);
	}
	
	
}

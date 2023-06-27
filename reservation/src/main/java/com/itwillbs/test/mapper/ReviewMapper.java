package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.ReviewVO;

public interface ReviewMapper {

	// 리뷰 목록 조회
	List<ReviewVO> getAdminReviewList();

	// 리뷰 정보 삭제
	int deleteReview(String idx);

}

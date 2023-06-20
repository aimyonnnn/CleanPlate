package com.itwillbs.test.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;


@Mapper
public interface ReservationMapper {
	
	// 식당 이름 실시간 조회
	List<RestaurantVO> selectRestaurantName(String resName);
	
	// 전체 식당 조회
	List<RestaurantVO> selectRestaurantList();
	
	// 점주 전체 식당 조회
	List<RestaurantVO> selectOwnerRestaurantList(String sId);
	
	// 취소버튼 누를시 상태를 취소로 변경
	int UpdateCancleStatus(int r_idx);

	// 양도 결제 완료 시 업데이트 처리
	int updateReservation(@Param("sId") String sId, @Param("r_idx") int r_idx);

	List<ReviewVO> selectReviewList(int res_idx);

	
}

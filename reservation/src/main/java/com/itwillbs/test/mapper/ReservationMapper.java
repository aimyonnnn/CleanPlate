package com.itwillbs.test.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.RestaurantVO;


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

	
	
}

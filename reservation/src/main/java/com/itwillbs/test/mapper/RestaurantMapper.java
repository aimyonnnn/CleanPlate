package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.RestaurantVO;

@Mapper
public interface RestaurantMapper {
	
	// Reservation 탭의 가게 정보 조회하기
	RestaurantVO selectRestaurantInfo(String res_idx);

	
	
}

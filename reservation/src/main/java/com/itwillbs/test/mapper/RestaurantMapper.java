package com.itwillbs.test.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.*;

@Mapper
public interface RestaurantMapper {
	
	// Reservation 탭의 가게 정보 조회하기
	RestaurantVO selectRestaurantInfo(String res_idx);

	int insertStore(RestaurantVO restaurant);

	List<ReservationVO> selectReservationList(String sId);

	List<RestaurantVO> selectRestaurantList();

	RestaurantVO selectRestaurant(String res_brn);

	int updateRestaurant(RestaurantVO restaurant);
	
}

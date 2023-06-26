package com.itwillbs.test.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.test.vo.*;

@Mapper
public interface RestaurantMapper {
	
	// Reservation 탭의 가게 정보 조회하기
	RestaurantVO selectRestaurantInfo(int res_idx);

	// 가게 추가
	int insertRestaurant(RestaurantVO restaurant);

	// 예약 내역 조회
	List<ReservationVO> selectReservationList(@Param("id") String cId);

	// 가게 내역 조회
	List<RestaurantVO> selectRestaurantList();

	// 가게 정보 수정
	int updateRestaurant(RestaurantVO restaurant);

	// 가게별 리뷰 점수 조회
	List<Map<String, Object>> selectRestaurantReviewScores();

	// 가게 조회
	RestaurantVO selectRestaurant(String res_brn);

	// 관리자의 가게 정보 수정
	int adminRestaurantUpdate(RestaurantVO res);

	// 관리자의 가게 정보 삭제
	int deleteRestaurant(String idx);

	// 관리자의 가게 조회
	RestaurantVO selectAdminRestaurant(String idx);

	// 리뷰수 조회 계산
	int getRestaurantrievewNum();
	
	// 예약 조회
	ReservationVO getReservation(int r_idx);
	
	// 점주 예약 갯수
	int getOwnerReservationCount(String cId);


	
	
}

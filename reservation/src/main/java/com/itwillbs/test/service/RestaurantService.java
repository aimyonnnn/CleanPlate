package com.itwillbs.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.RestaurantMapper;
import com.itwillbs.test.vo.*;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper mapper;
	
	// Reservation 탭의 가게 정보 조회하기
	public RestaurantVO getRestaurantInfo(String res_idx) {
		return mapper.selectRestaurantInfo(res_idx);
	}
	
	public int registStore(RestaurantVO restaurant) {
		return mapper.insertStore(restaurant);
	}
	
	//점주 예약 정보 조회
	public List<ReservationVO> getReservationList(String sId) {
		return mapper.selectReservationList(sId);
	}
	
	//점주 예약 메뉴 정보 조회
	public List<Reservation_DetailVO> getRDList(String sId) {
		return mapper.selectRDList(sId);
	}
	// 가게 목록 조회
	public List<RestaurantVO> getRestaurantList() {
		return mapper.selectRestaurantList();
	}
	// 가게 수정
	public int ModifyRestaurant(RestaurantVO restaurant) {
		return mapper.updateRestaurant(restaurant);
	}
	
	
}

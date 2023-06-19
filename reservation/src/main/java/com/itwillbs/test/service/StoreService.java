package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.test.mapper.*;
import com.itwillbs.test.vo.*;


@Service
public class StoreService {
	
	@Autowired
	private StoreMapper mapper;
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
	// 가게 정보 조회
	public RestaurantVO getRestaurantInfo(String res_brn) {
		return mapper.selectRestaurant(res_brn);
	}
	// 가게 수정
	public int ModifyRestaurant(RestaurantVO restaurant) {
		return mapper.updateRestaurant(restaurant);
	}

}

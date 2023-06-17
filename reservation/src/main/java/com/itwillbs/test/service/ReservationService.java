package com.itwillbs.test.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.ReservationMapper;
import com.itwillbs.test.vo.RestaurantVO;

@Service
public class ReservationService {
	
	@Autowired
	ReservationMapper mapper;
	
	// 식당 이름 실시간 조회
	public List<RestaurantVO> getRestaurantName(String resName) {
		return mapper.selectRestaurantName(resName);
	}

	// 전체 식당 리스트 조회
	public List<RestaurantVO> getRestaurantList() {
		return mapper.selectRestaurantList();
	}
	
	// 점주의 전체 식당 리스트 조회
	public List<RestaurantVO> getOwnerRestaurantList(String sId) {
		return mapper.selectOwnerRestaurantList(sId);
	}
	
	


	
}

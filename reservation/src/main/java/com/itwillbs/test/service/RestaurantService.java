package com.itwillbs.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.RestaurantMapper;
import com.itwillbs.test.vo.RestaurantVO;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper mapper;
	
	// Reservation 탭의 가게 정보 조회하기
	public RestaurantVO getRestaurantInfo(String res_idx) {
		return mapper.selectRestaurantInfo(res_idx);
	}

	
	
}

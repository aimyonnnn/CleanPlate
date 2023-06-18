package com.itwillbs.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.RestaurantMapper;
import com.itwillbs.test.vo.RestaurantVO;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper mapper;
	
	// 가게이름으로 가게 정보 조회하기
	// 양도 게시판에서 가게이름 클릭 시 가게 상세 정보 페이지로 이동
	public RestaurantVO getRestaurantInfo(String res_name) {
		return mapper.selectRestaurantInfo(res_name);
	}

	
	
}

package com.itwillbs.test.service;

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

}

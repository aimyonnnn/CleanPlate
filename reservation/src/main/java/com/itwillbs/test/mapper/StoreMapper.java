package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.*;

import com.itwillbs.test.vo.*;


@Mapper
public interface StoreMapper {

	int insertStore(RestaurantVO restaurant);

}

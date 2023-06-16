package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.test.vo.*;


@Mapper
public interface StoreMapper {

	int insertStore(RestaurantVO restaurant);

	List<ReservationVO> selectReservationList(String sId);

	List<Reservation_DetailVO> selectRDList(String sId);

}

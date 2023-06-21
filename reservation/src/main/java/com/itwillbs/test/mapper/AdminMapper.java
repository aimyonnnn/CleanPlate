package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.ReservationVO;

@Mapper
public interface AdminMapper {

	public List<ReservationVO> getReservationList();

}

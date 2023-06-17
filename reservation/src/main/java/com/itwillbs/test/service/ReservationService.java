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
	
	// 상태를 취소로 변경
	public int CancelStatus(int r_idx) {
		return mapper.UpdateCancleStatus(r_idx);
	}
	
	// 예약 테이블의 판매자 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
	public int updateReservation(String sId, int r_idx) {
		return mapper.updateReservation(sId, r_idx);
	}


	
}

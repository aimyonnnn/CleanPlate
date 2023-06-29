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
	public RestaurantVO getRestaurantInfo(int res_idx) {
		return mapper.selectRestaurantInfo(res_idx);
	}
	
	public int registStore(RestaurantVO restaurant) {
		return mapper.insertRestaurant(restaurant);
	}
	
	//점주 예약 정보 조회
	public List<ReservationVO> getReservationList(String sId) {
		return mapper.selectReservationList(sId);
	}
	
	// 가게 목록 조회
	public List<RestaurantVO> getRestaurantList() {
		return mapper.selectRestaurantList();
	}
	// 가게 수정
	public int ModifyRestaurant(RestaurantVO restaurant) {
		return mapper.updateRestaurant(restaurant);
	}
	
	// 가게별 리뷰 출력
	public List<Map<String, Object>> getRestaurantReviewScores() {
		return mapper.selectRestaurantReviewScores();
	}
		
	// 관리자 페이지 가게 관리
	public RestaurantVO selectAdminRestaurant(String idx) {
		return mapper.selectAdminRestaurant(idx);
	}
	
	// 관리자 페이지 가게 정보 수정
	public int adminRestaurantUpdate(RestaurantVO res) {
		return mapper.adminRestaurantUpdate(res);
	}
	
	// 관리자 페이지 가게 정보 삭제
	public int deleteRestaurant(String idx) {
		return mapper.deleteRestaurant(idx);
	}

	//리뷰 수 계산
	public int getRestaurantrievewNum() {
		return mapper.getRestaurantrievewNum();
	}

	public int getOwnerReservationCount(String cId) {
		return mapper.getOwnerReservationCount(cId);
	}

	public int selectRestaurantRes_idx(int c_idx, String res_brn) {
		return mapper.selectRestaurantRes_idx(c_idx, res_brn);
	}

	public int getOwnerRestaurantCont(String id) {
		return mapper.getOwnerRestaurantCount(id);
	}
	
	public int deletePhoto(String res_photo) {
		return mapper.deletePhoto(res_photo);
	}
	
	

		
}

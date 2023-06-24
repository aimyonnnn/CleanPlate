package com.itwillbs.test.service;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.ReservationMapper;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;

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
	public int CancelStatus(int r_idx, int r_status) {
		return mapper.UpdateCancleStatus(r_idx, r_status);
	}
	
	// 예약 테이블의 판매자 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
	public int updateReservation(String sId, int r_idx) {
		return mapper.updateReservation(sId, r_idx);
	}
	
	// 가계 상세 페이지의 리뷰 불러오기
	public List<ReviewVO> getReviewList(int res_idx) {
		return mapper.selectReviewList(res_idx);
	}
	
	// 예약이 많은 순서로 식당 조회
	public List<Map<String, Object>> getReservationCountByRestaurant() {
		return mapper.selectReservationCountByRestaurant();
	}
	
	// 예약 목록 조회
	public List<ReservationVO> getReservationList() {
		return mapper.getReservationList();
	}

	// 관리자의 예약 정보 조회
	public ReservationVO selectReservation(String idx) {
		return mapper.selectReservation(idx);
	}
	
	// 관리자의 예약 정보 수정
	public int adminReservationUpdate(ReservationVO re) {
		return mapper.adminReservationUpdate(re);
	}

	// 관리자의 예약 정보 삭제
	public int deleteReservation(String idx) {
		return mapper.deleteReservation(idx);
	}

	// 총 결제 금액 조회
	public int getTotalPay() {
		return mapper.getTotalPay();
	}
	
	// 예약 정보 조회
	public ReservationVO getReservationInfo(int r_idx) {
		return mapper.selectReservationInfo(r_idx);
	}
	
	// 양도 게시판에 글 등록시 예약상태를 '5-판매중'으로 변경하기
	public int modifyStatus(int r_idx) {
		return mapper.updateStatus(r_idx);
	}
	
	// 홈컨트롤러
	public void modifyStatusHome() {
		mapper.updateStatusHome();
	}

	public void modifyStatusHome2() {
		mapper.updateStatusHome2();
	}

	// 예약 정보에서 런치에 예약된 테이블 수 조회
	public int getLunchReservationTables(int res_idx, String r_date) {
		return mapper.selectedLunchTables(res_idx, r_date);
	}
	
	// 예약 정보에서 디너에 예약된 테이블 수 조회
	public int getDinnerReservationTables(int res_idx, String r_date) {
		return mapper.selectedDinnerTables(res_idx, r_date);
	}

	public int registReservation(int r_personnel, String r_date, String r_request, int r_amount,
			int r_status, int m_idx, int res_idx,  int me_idx, int r_tables) {
		return mapper.insertReservation(r_personnel, r_date, r_request, r_amount, r_status, m_idx, res_idx, me_idx, r_tables);
	}
	
}

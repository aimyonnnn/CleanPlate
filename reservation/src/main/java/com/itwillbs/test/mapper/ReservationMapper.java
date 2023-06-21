package com.itwillbs.test.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;


@Mapper
public interface ReservationMapper {
	
	// 식당 이름 실시간 조회
	List<RestaurantVO> selectRestaurantName(String resName);
	
	// 전체 식당 조회
	List<RestaurantVO> selectRestaurantList();
	
	// 점주 전체 식당 조회
	List<RestaurantVO> selectOwnerRestaurantList(String sId);
	
	// 취소버튼 누를시 상태를 취소로 변경
	int UpdateCancleStatus(@Param("r_idx") int r_idx, @Param("r_status") int r_status);

	// 양도 결제 완료 시 업데이트 처리
	int updateReservation(@Param("sId") String sId, @Param("r_idx") int r_idx);

	List<ReviewVO> selectReviewList(int res_idx);
	
	// 가게별 리뷰 점수 조회
	List<Map<String, Object>> selectRestaurantReviewScores();
	
	// 예약이 많은 순서로 식당 조회
	List<Map<String, Object>> selectReservationCountByRestaurant();

	// 예약 목록 조회
	List<ReservationVO> getReservationList();

	// 관리자의 예약 정보 조회
	ReservationVO selectReservation(String idx);

	// 관리자의 예약 정보 수정
	ReservationVO adminReservationUpdate(ReservationVO re);

	// 관리자의 예약 정보 삭제
	ReservationVO deleteReservation(String idx);

	// 총 결제 금액 조회
	int getTotalPay();
	
	// 예약 정보 조회
	ReservationVO selectReservationInfo(int r_idx);

	
}

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
	int adminReservationUpdate(ReservationVO re);

	// 관리자의 예약 정보 삭제
	int deleteReservation(String idx);

	// 예약 정보 조회
	ReservationVO selectReservationInfo(int r_idx);
	
	// 양도 게시판에 글 등록시 예약상태를 '5-판매중'으로 변경하기
	int updateStatus(int r_idx);
	
	// 홈컨트롤러
	void updateStatusHome();

	void updateStatusHome2();

	// 런치에 예약된 테이블 수 조회 
	int selectedLunchTables(@Param("res_idx") int res_idx,@Param("r_date") String r_date);

	// 디너에 예약된 테이블 수 조회 
	int selectedDinnerTables(@Param("res_idx") int res_idx,@Param("r_date") String r_date);

	// 예약내역 입력
	int insertReservation(
		    @Param("r_personnel") int r_personnel,
		    @Param("r_date") String r_date,
		    @Param("r_request") String r_request,
		    @Param("r_amount") int r_amount,
		    @Param("r_status") int r_status,
		    @Param("m_idx") int m_idx,
		    @Param("res_idx") int res_idx,
		    @Param("me_idx") int me_idx,
		    @Param("r_tables") int r_tables
		);

	int selectReservationIdx(@Param("r_date") String r_date, @Param("m_idx") int m_idx, @Param("res_idx") int res_idx);

	ReservationVO selectReservationAllInfo(int r_idx);
	
	// 결제취소 후 예약상태 변경
	int updateReservationStatus(String payment_num);

	// 예약이 꽉찬 날 조회
	String[] selectFullDay();

	// 지난 일자 예약 수 조회
	ReservationVO adminReservationCount(int i);

	// 예약 목록 역순 조회
	List<ReservationVO> getReservationListDESC();

}

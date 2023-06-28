package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface StoredashMapper {
    // 오늘의 총 예약수
    int getTodayReservationCounts(String cId);
    
    // 이번 달 총 예약수
    int getMonthlyReservationCounts(String cId);
    
    // 일간 매출 조회
    int getTodaySalesAmount(String cId);
    
    // 일주일 매출 조회
    int getWeeklyallSalesAmount(String cId);
    
    //일간 예약 수 조회
    List<Integer> getReservationCount(String cId);
    
    // 최근 1주일 간 매출 금액 조회
    List<Integer> getWeeklySalesAmount(String cId);
}

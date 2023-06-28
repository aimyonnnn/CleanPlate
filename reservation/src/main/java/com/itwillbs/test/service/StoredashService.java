package com.itwillbs.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.StoredashMapper;

@Service
public class StoredashService {

    private StoredashMapper storedashMapper;

    public StoredashService(StoredashMapper storedashMapper) {
        this.storedashMapper = storedashMapper;
        System.out.println("list1");
    }

    // 오늘의 총 예약수
    public int getTodayReservationCounts(String cId) {
        System.out.println("list2");
        return storedashMapper.getTodayReservationCounts(cId);
    }

    // 이번 달 총 예약수
    public int getMonthlyReservationCounts(String cId) {
        System.out.println("list3");
        return storedashMapper.getMonthlyReservationCounts(cId);
    }

    // 일간 매출 조회
    public int getTodaySalesAmount(String cId) {
        System.out.println("list4");
        return storedashMapper.getTodaySalesAmount(cId);
    }

    // 일주일 매출 조회
    public int getWeeklyallSalesAmount(String cId) {
        System.out.println("list5");
        return storedashMapper.getWeeklyallSalesAmount(cId);
    }

    // 일간 예약 수 조회
    public List<Integer> getReservationCount(String cId) {
        System.out.println("list6");
        return storedashMapper.getReservationCount(cId);
    }

    // 최근 1주일 간 매출 금액 조회
    public List<Integer> getWeeklySalesAmount(String cId) {
        System.out.println("list7");
        return storedashMapper.getWeeklySalesAmount(cId);
    }

}

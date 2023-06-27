package com.itwillbs.test.service;

import java.util.List;
import java.util.Map;

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
    public List<Integer> getTodayReservationCounts() {
        System.out.println("list2");
        return storedashMapper.getTodayReservationCounts();
    }

    // 이번 달 총 예약수
    public List<Integer> getMonthlyReservationCounts() {
        System.out.println("list3");
        return storedashMapper.getMonthlyReservationCounts();
    }
    
    // 일간 매출 조회
    public List<Integer> getTodaySalesAmonut(){
    	System.out.println("list4");
    	return storedashMapper.getTodaySalesAmount();
    }
     
    // 일주일 매출 조회
    public List<Integer> getWeeklyallSalesAmount() {
    	System.out.println("list5");
    	return storedashMapper.getWeeklyallSalesAmount();
    }
    
    //일간 예약 수 조회
    public List<Integer> getReservationCountsByWeek() {
         System.out.println("list6");
         return storedashMapper.getReservationCountsByWeek();    	
    }
    // 최근 1주일 간 매출 금액 조회
    public List<Integer> getWeeklySalesAmount() {
        System.out.println("list7");
        return storedashMapper.getWeeklySalesAmount();
    }
    

}



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
    }

    // 오늘의 총 예약수
    public List<Map<String, Object>> getTodayReservationCounts() {
        return storedashMapper.getTodayReservationCounts();
    }

    // 이번 달 총 예약수
    public List<Map<String, Object>> getMonthlyReservationCounts() {
        return storedashMapper.getMonthlyReservationCounts();
    }
}


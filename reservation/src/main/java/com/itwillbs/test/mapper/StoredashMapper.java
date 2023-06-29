package com.itwillbs.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StoredashMapper {
    int getTodayReservationCounts(String cId);

    int getMonthlyReservationCounts(String cId);

    int getTodaySalesAmount(String cId);

    int getWeeklyallSalesAmount(String cId);

//    List<Map<String, Object>> getDailyOrderCounts(String cId);
}

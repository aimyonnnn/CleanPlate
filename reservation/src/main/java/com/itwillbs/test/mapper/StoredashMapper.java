package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StoredashMapper {
    int getTodayReservationCounts(String cId);

    int getMonthlyReservationCounts(String cId);

    int getTodaySalesAmount(String cId);

    int getWeeklyallSalesAmount(String cId);
}

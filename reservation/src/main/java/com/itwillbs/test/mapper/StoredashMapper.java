package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface StoredashMapper {
    @Select("SELECT r.res_idx AS storeId, COUNT(*) AS reservationCount, c.c_id " +
            "FROM restaurant AS r " +
            "JOIN ceo AS c ON r.c_idx = c.c_idx " +
            "JOIN payment AS p ON r.res_idx = p.r_idx " +
            "WHERE DATE(p.p_orderDate) = CURDATE() " +
            "GROUP BY r.res_idx")
    List<Map<String, Object>> getTodayReservationCounts();

    @Select("SELECT r.res_idx AS storeId, COUNT(*) AS reservationCount, c.c_id " +
            "FROM restaurant AS r " +
            "JOIN ceo AS c ON r.c_idx = c.c_idx " +
            "JOIN payment AS p ON r.res_idx = p.r_idx " +
            "WHERE YEAR(p.p_orderDate) = YEAR(CURDATE()) AND MONTH(p.p_orderDate) = MONTH(CURDATE()) " +
            "GROUP BY r.res_idx")
    List<Map<String, Object>> getMonthlyReservationCounts();
}




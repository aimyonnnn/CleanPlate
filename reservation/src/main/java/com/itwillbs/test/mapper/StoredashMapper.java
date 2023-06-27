package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface StoredashMapper {
    @Select("SELECT COUNT(*) AS todayReservationCount "
    	    +"FROM payment "
    	    +"WHERE DATE(p_orderDate) = CURDATE()")
    List<Integer> getTodayReservationCounts();

    @Select("SELECT COUNT(*) AS weeklyReservationCount "
    		+"FROM payment "
    		+"WHERE DATE(p_orderDate) "
    		+"BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 DAY) AND CURDATE()")
    List<Integer> getMonthlyReservationCounts();
    
  //일일 예약수
    @Select("SELECT COUNT(*) "
    		+ "FROM payment WHERE DATE(p_orderDate) "
    		+ "BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 DAY) AND CURDATE() "
    		+ "GROUP BY DATE(p_orderDate)")
    List<Integer> getReservationCountsByWeek();
    
    // 최근 1주일 간 매출 금액 조회
    @Select("SELECT SUM(payment_total_price) "
    		+ "FROM payment WHERE p_orderDate "
    		+ "BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 DAY) AND CURDATE() "
    		+ "GROUP BY DAY(p_orderDate)")
    List<Integer> getWeeklySalesAmount();

    // 일일 매출액
    @Select("SELECT SUM(payment_total_price) "
            + "FROM payment "
            + "WHERE DATE(p_orderDate) = CURDATE()")
    List<Integer> getTodaySalesAmount();

    //일주일간 매출액
    @Select("SELECT SUM(payment_total_price) "
            + "FROM payment "
            + "WHERE DATE(p_orderDate) BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 DAY) AND CURDATE()")
	List<Integer> getWeeklyallSalesAmount();

}

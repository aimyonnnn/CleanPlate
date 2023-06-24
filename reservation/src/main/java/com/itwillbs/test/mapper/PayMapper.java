package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PayMapper {

	int insertPayInfo(
			@Param("p_orderNum") String p_orderNum, 
            @Param("payment_num") String payment_num, 
            @Param("payment_total_price") int payment_total_price, 
            @Param("sId") String sId, 
            @Param("r_idx") int r_idx);
}

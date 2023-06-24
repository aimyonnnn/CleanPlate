package com.itwillbs.test.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PayMapper {

	int insertPayInfo(
			@Param("p_orderNum") String p_orderNum, 
            @Param("p_imp_uid") String p_imp_uid, 
            @Param("p_price") int p_price, 
            @Param("sId") String sId, 
            @Param("r_idx") int r_idx);
}

package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.PayVO;

@Mapper
public interface PayMapper {

	int insertPayInfo(
			@Param("p_orderNum") String p_orderNum, 
            @Param("payment_num") String payment_num, 
            @Param("payment_total_price") int payment_total_price, 
            @Param("sId") String sId, 
            @Param("r_idx") int r_idx);
	
	// 결제내역 조회
	List<PayVO> selectPayInfo(String sId);
}

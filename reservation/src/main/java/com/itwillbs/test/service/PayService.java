package com.itwillbs.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.PayMapper;

@Service
public class PayService {
	
	@Autowired
	private PayMapper mapper;
	
	public int registPayInfo(String p_orderNum, String p_imp_uid, int p_price, String sId, int r_idx) {
		return mapper.insertPayInfo(p_orderNum, p_imp_uid, p_price, sId, r_idx);
	}
	
		
}
package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.TimesMapper;
import com.itwillbs.test.vo.TimesVO;

@Service
public class TimesService {
	@Autowired
	private TimesMapper mapper;
	
	public List<TimesVO> getTimesInfo(int res_idx) {
		return mapper.selectTimesInfo(res_idx);
	}

	public void insertTime(TimesVO t_Time) {
		mapper.insertTime(t_Time);
	}
	
	// 특정 가게의 시간리스트 조회
	public List<TimesVO> getTimesList(int res_idx) {
		return mapper.selectTimesList(res_idx);
	}

}

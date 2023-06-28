package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.TimesVO;

@Mapper
public interface TimesMapper {

	List<TimesVO> selectTimesInfo(int res_idx);

	void insertTime(TimesVO t_Time);

	List<TimesVO> selectTimesList(int res_idx);

}

package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.test.vo.HelpVO;
import com.itwillbs.test.vo.QNAVO;

@Mapper
public interface HelpMapper {

	// help 게시판 목록 조회
	List<HelpVO> getHelplist(int h_index);

	int insertQNA(QNAVO qna);

}

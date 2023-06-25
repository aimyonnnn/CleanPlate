package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.HelpVO;
import com.itwillbs.test.vo.NoticeVO;
import com.itwillbs.test.vo.QNAVO;

@Mapper
public interface HelpMapper {

	// help 게시판 목록 조회
	List<HelpVO> getHelplist(int h_index);

	int insertQNA(QNAVO qna);

	List<QNAVO> selectQNAList(String id);

	int updateQnaAnswer(QNAVO qna);

	// 공지 등록
	int insertNotice(NoticeVO notice);

	// 공지 글목록 조회
	List<NoticeVO> selectNoticeList(@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	// 전체 게시물 수 조회 요청 
	int selectNoticeListCount(@Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	// 공지글 상세정보 조회 요청 
	NoticeVO selectNotice(int no_idx);

	// 조회수 증가 
	void updateReadcount(NoticeVO notice);

	// 공지글 수정
	int updateNotice(NoticeVO notice);

	// 공지글 삭제
	int deleteNotice(int no_idx);

}

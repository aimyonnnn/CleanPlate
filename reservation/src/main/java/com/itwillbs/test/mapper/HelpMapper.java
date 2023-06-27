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
	
	//회원 qna 추가
	int insertQNA(QNAVO qna);
	
	//점주 qna 추가
	int insertCeoQNA(QNAVO qna);
	
	// 회원 QNA 리스트
	List<QNAVO> selectQNAMemberList(@Param("id")String id,@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword, @Param("startRow") int startRow, @Param("listLimit") int listLimit);
	
	// 점주 QNA 리스트
	List<QNAVO> selectQNACeoList(@Param("id")String id,@Param("searchType") String searchType,@Param("searchKeyword") String searchKeyword, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

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
	
	// QNA 글 수
	int selectQnaListCount(@Param("id")String id, @Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	String selectMemberIdInfo(int q_idx);

	int deleteQNA(int q_idx);
	
	// 점주 QNA 글 수
	int selectQnaCeoListCount(@Param("id")String id, @Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	String selectCeoIdInfo(int q_idx);

	

}

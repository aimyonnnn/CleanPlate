package com.itwillbs.test.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
create table help
(h_noticeIdx int primary key NOT NULL UNIQUE,
h_noticeNum int unique,
h_noticeSubject VARCHAR(100),
h_noticeContent VARCHAR(1000),
h_date timestamp,
h_index int NOT NULL
);
*/

@Data
public class HelpVO {

	private int h_noticeIdx; // help 게시판 통합 글번호
	private int h_noticeNum; // help 게시판 공지사항 글번호
	private String h_noticeSubject; // help 게시판 글 제목
	private String h_noticeContent; // help 게시판 글 내용
	private Timestamp h_date; // 작성일
	private int h_index; // 분류 번호 -- 1 : 공지사항 , 2 : FAQ , 3 : Q&A
	
}

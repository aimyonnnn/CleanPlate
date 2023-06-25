package com.itwillbs.test.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
CREATE TABLE notice (
    no_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT 'NOTICE 번호',
    no_subject VARCHAR(50) NOT NULL COMMENT 'NOTICE 제목',
    no_content TEXT NOT NULL COMMENT 'NOTICE 내용',
    no_category INT NOT NULL COMMENT '구분 1 - 일반 공지글 2 - 상위 고정 공지글',
    no_date DATE NOT NULL COMMENT 'NOTICE 날짜',
    no_file VARCHAR(100) COMMENT 'NOTICE 파일',
    no_readcount INT NOT NULL COMMENT 'NOTICE 조회수'
);
 */
@Data
public class NoticeVO {
	private int no_idx;
	private String no_subject;
	private String no_content;
	private int no_category;
	private Date no_date;
	private String no_file;
	private MultipartFile file;
	private int no_readcount;
}

package com.itwillbs.test.mapper;

import com.itwillbs.test.vo.CeoVO;

public interface CeoMapper {

	// 점주 회원 등록
	int insertCeo(CeoVO ceo);
	
	// 점주 임시 비밀번호 발급
	int updatePasswdCeo(CeoVO ceoResult);

	String selectCeo(String id);

}

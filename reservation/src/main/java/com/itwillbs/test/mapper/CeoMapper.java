package com.itwillbs.test.mapper;

import java.util.List;

import com.itwillbs.test.vo.CeoVO;

public interface CeoMapper {

	// 점주 회원 등록
	int insertCeo(CeoVO ceo);
	
	// 점주 임시 비밀번호 발급
	int updatePasswdCeo(CeoVO ceoResult);

	String selectCeo(String id);

	CeoVO selectFromCeo(String id);

	int deleteUpdateCeo(int c_idx);

	void updateCeo(CeoVO ceo);
	
	// 기업 회원 리스트 조회
	List<CeoVO> ceoList();

	// 기업 회원 정보 조회
	CeoVO selectCEOMember(String id);

	// 기업 회원 정보 수정
	int adminCEOMemberUpdate(CeoVO ceo);

	int deleteCEOMember(String id);

	CeoVO adminCEOMemberCount(int i);

	CeoVO adminCEOMemberTotalCount(int i);

}

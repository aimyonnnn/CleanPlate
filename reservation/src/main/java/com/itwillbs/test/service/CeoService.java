package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.CeoMapper;
import com.itwillbs.test.vo.CeoVO;

@Service
public class CeoService {
	@Autowired
	private CeoMapper mapper;

	// 점주 회원 등록 
	public int registCeo(CeoVO ceo) {
		System.out.println("registCeo");
		return mapper.insertCeo(ceo);
	}
	
	// 점주 임시비밀번호 발급
	public int randomPassword(CeoVO ceoResult) {
		return mapper.updatePasswdCeo(ceoResult);
	}
	
	public String isCorrectCeo(String id) {
		return mapper.selectCeo(id);
	}
	
	//점주 회원 탈퇴를 위한 정보 가져오기
	public CeoVO SelectCeo(String id) {
		return mapper.selectFromCeo(id);
	}
	
	// 점주 회원 탈퇴 진행(상태변경)
	public int secessionCeo(int c_idx) {
		return mapper.deleteUpdateCeo(c_idx);
	}

	public void updateCeo(CeoVO ceo) {
		mapper.updateCeo(ceo);
	}

	// 기업 회원 리스트 조회
	public List<CeoVO> ceoList() {
		return mapper.ceoList();
	}

	public CeoVO selectCEOMember(String id) {
		return mapper.selectCEOMember(id);
	}

	public int adminCEOMemberUpdate(CeoVO ceo) {
		return mapper.adminCEOMemberUpdate(ceo);
	}

	public int deleteCEOMember(String id) {
		return mapper.deleteCEOMember(id);
	}

	public CeoVO adminCEOMemberCount(int i) {
		return mapper.adminCEOMemberCount(i);
	}

	public CeoVO adminCEOMemberTotalCount(int i) {
		return mapper.adminCEOMemberTotalCount(i);
	}

}

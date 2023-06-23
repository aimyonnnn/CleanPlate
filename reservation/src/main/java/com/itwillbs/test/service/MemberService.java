package com.itwillbs.test.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.MemberMapper;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	// 개인회원 등록
	public int registMember(MemberVO member) {
		System.out.println("registMember");
		return mapper.insertMember(member);
	}
	
	// 임시 비빌번호 업데이트
	public int randomPassword(MemberVO membervo) {
		return mapper.updatePassword(membervo);
	}

	// 회원정보 폼 접근 시 , id, passwd 확인
	public MemberVO isCorrectMember(String id) {
		return mapper.isCorrectMember(id);
	}

	// 회원 정보 수정
	public int updateMember(MemberVO member) {
		return mapper.updateMember(member);
	}
	
	public MemberVO selectMember(@Param("id") String id) {
		return mapper.selectMember(id);
	}
	
	// 양도 결제시 필요한 고객 정보
	public MemberVO getMemberInfo(String sId) {
		return mapper.selectMemberInfo(sId);
	}
	
	// 카카오 로그인 시 회원 email을 조회 후 m_id를 리턴받아 세션id에 저장
	public MemberVO getMemberId(String email) {
		return mapper.selectMemberId(email);
	}
	
	// 멤버 예약 목록
	public List<ReservationVO> getMemberReservationList(String sId) {
		return mapper.selectMemberReservation(sId) ;
	}
	
	// 멤버가 예약한 레스토랑
	public List<RestaurantVO> getMemberRestaurant(String sId) {
		return mapper.selectMemberRestaurant(sId) ;
	}
	
	// 비밀번호 확인
	public String isCorrectPasswd(String id) {
		return mapper.isCorrectPasswd(id);
	}

	// 관리자의 멤버 목록 조회
	public List<MemberVO> memberList() {
		return mapper.selectMemberList();
	}

	// 관리자의 멤버 삭제
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	// 회원 탈퇴시 상태변경
	public int secessionMember(int m_idx) {
		return mapper.updateMemberStatus(m_idx);
	}


}

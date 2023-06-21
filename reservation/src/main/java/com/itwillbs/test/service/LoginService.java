package com.itwillbs.test.service;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.LoginMapper;
import com.itwillbs.test.vo.CeoVO;
import com.itwillbs.test.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper mapper;
	
	// coolsms 문자연동 시작
	public String PhoneNumberCheck(String to) throws CoolsmsException{
		String api_key = "#"; // 실제 테스트 시에 바꿔줘야함! 기능 동작 확인 완료함!
		String api_secret = "#"; // 실제 테스트 시에 바꿔줘야함! 기능 동작 확인 완료함!
		Message coolsms = new Message(api_key, api_secret);
			
		Random rand = new Random(); 
		String numStr = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10)); 
			numStr += ran;
		}
		  
		HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);    // 수신전화번호
	    params.put("from", "#"); // 발신전화번호, 실제 테스트 시에 바꿔줘야함! 기능 동작 확인 완료함!
	    params.put("type", "sms"); 
	    params.put("text", "Clean Plate [" + numStr + "] 입니다.");
	 
	    coolsms.send(params); // 메시지 전송
			  
		return numStr;
		 
	}
	// coolsms 문자연동 끝

	// 로그인 시 id, passwd 조회하기
	public String isCorrectUser(String id) {
		System.out.println("LoginService");
		return mapper.isCorrectUser(id);
	}
	
	// 카카오 이메일로 로그인 시 email 조회하기
	public MemberVO isCorrectKakaoUser(String email) {
		return mapper.isCorrectKakaoUser(email);
	}
	
	//이름과 전화번호로 회원 조회
	public MemberVO retrieveMemberId(String m_name, String m_tel) {
		return mapper.selectMemberId(m_name, m_tel);
	}

	//이름과 전화번호로 점주 조회
	public CeoVO retrieveCeoId(String c_name, String c_tel) {
		return mapper.selectCeoId(c_name, c_tel);
	}
	
	//아이디와 이름 그리고 전화번호로 회원 조회
	public MemberVO retrievePasswdFind(MemberVO membervo) {
		return mapper.selectMemberPasswd(membervo);
	}

	public CeoVO retrievePasswdFind(CeoVO ceo) {
		return mapper.selectCeoPasswd(ceo);
	}
	
	// 일반회원, 기업회원 구분
	public int getUserType(String id) {
		return mapper.selectUserType(id);
	}
	
	// 아이디 실시간 중복 체크 - 일반회원
	public int isDupId(String m_id) {
		return mapper.isDupId(m_id);
	}
	
	// 아이디 실시간 중복 체크 - 기업회원
	public int isDupId2(String c_id) {
		return mapper.isDupId2(c_id);
	}
	
	
	
}

package com.itwillbs.test.service;

import java.util.HashMap;
import java.util.Random;

import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class LoginService {
	
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
	
	
	
	
	
	
}

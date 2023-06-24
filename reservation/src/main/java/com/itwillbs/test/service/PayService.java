package com.itwillbs.test.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.itwillbs.test.mapper.PayMapper;
import com.itwillbs.test.vo.PayVO;

@Service
public class PayService {

	@Autowired
	private PayMapper mapper;

	private String impKey = "7282578621856564";
	private String impSecret = "uUdnTnwy30JL3CvPQiB8ymuQNa6zLArW6ljmfO9IZAGStHKe19yY7Fil099s3TJwFHw0UEMhk49KvTBy";

	public int registPayInfo(String p_orderNum, String payment_num, int payment_total_price, String sId, int r_idx) {
		return mapper.insertPayInfo(p_orderNum, payment_num, payment_total_price, sId, r_idx);
	}

	//====================== API 작업 ======================
	// 토큰 받아오는 메서드
	public String getToken() throws Exception {
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");
		
		conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		Gson gson = new Gson();
		
		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		String token = gson.fromJson(response, Map.class).get("access_token").toString();
		
		br.close();
		
		conn.disconnect();
		
		return token;
	}

	// 결제 정보 불러오기
	public String paymentInfo(String imp_uid, String access_token)
			throws IOException, ParseException, org.json.simple.parser.ParseException {
		
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
		
		conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		JSONParser parser = new JSONParser();
		JSONObject p = (JSONObject) parser.parse(br.readLine());
		String response = p.get("response").toString();
		
		p = (JSONObject) parser.parse(response);
		
		String amount = p.get("amount").toString();
		
		return amount;
	}

	// 결제 취소
	public void payMentCancle(String access_token, String imp_uid, int amount, String reason)
			throws IOException, ParseException {
		
		System.out.println("imp_uid = " + imp_uid);
		
		// 확인
		System.out.println("결제취소!");
		System.out.println(access_token);
		System.out.println(imp_uid);
		
		HttpsURLConnection conn = null;
		
		URL url = new URL("https://api.iamport.kr/payments/cancel");
		
		conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
		
		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		br.close();
		
		conn.disconnect();
	}

	// ================================== DB 작업 ==================================
	// 결제 취소
	public int orderCancle(PayVO pay) throws Exception {
		
		if (!pay.getPayment_num().equals("")) {
			String token = getToken();
			int price = pay.getPayment_total_price();
			payMentCancle(token, pay.getPayment_num(), price, pay.getReason());
		}
		
		// payment_num 으로 조회 후 결제상태(p_status) 변경
		int updatePaymentCount = mapper.updatePayment(pay.getPayment_num());
		System.out.println("updatePaymentCount : " + updatePaymentCount);
		
		return updatePaymentCount;
	}
	
	// 결제 취소 - 양도
	public int orderCancle2(PayVO pay) throws Exception {
		
		if (!pay.getPayment_num().equals("")) {
			String token = getToken();
			int price = pay.getPayment_total_price();
			payMentCancle(token, pay.getPayment_num(), price, pay.getReason());
		}
		
		return 1;
	}
	
	// 결제리스트 조회
	public List<PayVO> getPayInfo(String sId) {
		return mapper.selectPayInfo(sId) ;
	}
	
	// 결제정보 조회
	public PayVO getPayInfoByRidx(int r_idx) {
		return mapper.selectPayInfoByRidx(r_idx);
	}
	
	// 결제정보 저장 - 예약
	public int registReservationPayInfo(String p_orderNum, String payment_num, int payment_total_price, String sId) {
		return mapper.insertReservationPayInfo(p_orderNum, payment_num, payment_total_price, sId);
	}

	
}

package com.example.domain.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.member.dao.SignDAO;
import com.example.domain.member.vo.MemberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SignupServiceImpl implements SignupService{

	@Autowired
	private SignDAO signDAO;
	
//	아이디 중복확인
	public String memberIdCheck(String id) {
		return signDAO.memberIdCheck(id);
	}
	
//	닉네임 중복확인
	public String memberNicknameCheck(String nickname) {
		return signDAO.memberNicknameCheck(nickname);
	}

//	회원가입시 인증번호 보내기
	public String phoneCheckSMS(String phone, String randomSum) {
		
		String phoneCheck = signDAO.memberCheckSMS(phone);
//		존재하는 전화번호인지 확인
//		존재하지 않을때
		if(phoneCheck==null) {
//		문자 보내기 전 준비 할 data
			String api_key = "NCS5WMVI3SWRII1N";
			String api_secret = "CQRPTISX9OKEDKQ0IO7AUTEC0LDK0SWH";
			String from = "01051494811";
			String text = "Hadam 인증번호는 ["+randomSum+"] 입니다";
			Message coolsms = new Message(api_key, api_secret);
			
//		coolsms 라이브러리사용시 to from type text 필수입력
			HashMap<String, String> sendContent = new HashMap<String, String>();
			sendContent.put("to", phone);					// 입력 받은 사용자 번호 
			sendContent.put("from", from);					// 보내는 (내)번호...ㅠㅜ
			sendContent.put("type", "SMS");					// 문자 타입
			sendContent.put("text", text);					// 문자 내용
			sendContent.put("app_version", "하루를 담다(Hadam)");			// app_version은 해도되고 안해도 되는건데 뭔가해서 해봄
			
//	    실제 문자 보내는 부분
			try {
				JSONObject obj = (JSONObject) coolsms.send(sendContent);
				System.out.println(obj.toString());
				String result = String.valueOf(obj.get("success_count"));
//				System.out.println(result);
				if(result.equals("1")) {
//	    		문자보내기 성공하면 인증번호
					return randomSum;
				}else {
//	    		문자보내기 실패하면 0
					return "0";
				}
				
//	    	System.out.println(obj.toString());
			}catch(CoolsmsException e){
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
//	    	문자보내기 시도가 실패하면 0
				return "0";
			}

//		가입된 전화번호 일때
		}else {
			return "1";
		}
	}
	
//	회원가입 정보입력
	public Integer signupCompletion(MemberVO vo) {
		return signDAO.signupCompletion(vo);
	}

//	회원가입한 회원 index 조회
	public Integer getMemberIndex(String memberId) {
		return signDAO.getMemberIndex(memberId);
	}
	
	
	
//	네이버 회원정보 입력
	public String naverSignup(MemberVO vo) {
//		네이버 기가입 회원인지 확인
		String naver = signDAO.naverMemberCheck(vo.getMemberId());
		
		return naver;
		
	}
	
	
	
	
//	카카오 인가코드 받아오기	
	public String getKakaoAccessToken(String code) {
		String accessToken = "";
		String refreshToken = "";
		String reqUrl = "https://kauth.kakao.com/oauth/token";
		
		try {
//			연결 객체 생성
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
//			필수 헤더 세팅
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setDoOutput(true); 						//OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        
//	        필수 쿼리 파라미터 세팅
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=").append("1bce4a6cad3104a2d5cc6134e1af3958");
	        sb.append("&redirect_uri=").append("http://localhost:8080/signup/kakaoCallback");
	        sb.append("&code=").append(code);
	        
//	        BufferedWriter로 파라미터 읽고, 보냄 (아직 안닫음)
	        bw.write(sb.toString());
	        bw.flush();
			
	        int responseCode = conn.getResponseCode();
//	        log.info("[KakaoApi.getAccessToken] responseCode = {}", responseCode);
	        
//	        가져온 코드가 200~300사이가 아니면 오류임
	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        
	        String result = responseSb.toString();
//	        log.info("responseBody = {}", result);
	        
	        
	        JsonElement el =(JsonParser.parseString(result));
	        accessToken = el.getAsJsonObject().get("access_token").getAsString();
	        refreshToken = el.getAsJsonObject().get("refresh_token").getAsString();
	        
	        br.close();
	        bw.close();
	        
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return accessToken;
	}
	
	/*카카오 사용자 정보받아오기*/
	public MemberVO getKakaoUserInfo(String accessToken){
		MemberVO vo = new MemberVO();
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		
		 try{
		        URL url = new URL(reqUrl);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		        
		        
		        int responseCode = conn.getResponseCode();
//		        log.info("[KakaoApi.getUserInfo] responseCode : {}",  responseCode);

		        BufferedReader br;
		        if (responseCode >= 200 && responseCode <= 300) {
		            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }

		        String line = "";
		        StringBuilder responseSb = new StringBuilder();
		        while((line = br.readLine()) != null){
		            responseSb.append(line);
		        }
		        String result = responseSb.toString();
//		        log.info("responseBody = {}", result);

		        
		        JsonElement el = JsonParser.parseString(result);
		        //System.out.println(result);
		        String id =  (String) el.getAsJsonObject().get("id").getAsString();
		        JsonObject properties = el.getAsJsonObject().get("properties").getAsJsonObject();
		        JsonObject kakaoAccount = el.getAsJsonObject().get("kakao_account").getAsJsonObject();
		        	
//		        System.out.println("도와줘요 카카오"+properties.getAsJsonObject());
//		        System.out.println("도와줘요 카카오"+kakaoAccount.getAsJsonObject());
		        
		        String memberId = id;
		        String memberNickname = properties.getAsJsonObject().get("nickname").getAsString();
				String memberTemp = kakaoAccount.getAsJsonObject().get("gender").getAsString();
				String birthyear = kakaoAccount.getAsJsonObject().get("birthyear").getAsString();
				String birthday = kakaoAccount.getAsJsonObject().get("birthday").getAsString();
				String phoneTemp = kakaoAccount.getAsJsonObject().get("phone_number").getAsString();
				
//				핸드폰번호
				phoneTemp = phoneTemp.replaceAll("-", "");
				String memberPhoneNumber = phoneTemp.substring(phoneTemp.length()-8);
				memberPhoneNumber = "010"+memberPhoneNumber;
				// System.out.println("핸드폰 번호 가져오기 "+memberPhoneNumber);

//				성별 
				String memberSex = "";
				if(memberTemp.equals("female")) memberSex = "여자";
				if(memberTemp.equals("male")) memberSex = "남자";
					
					
				vo.setMemberId(memberId);
				vo.setMemberPassword(memberId);
		        vo.setMemberNickname(memberNickname);
				vo.setMemberSex(memberSex);
				vo.setMemberPhoneNumber(memberPhoneNumber);
				vo.setMemberBirth(birthyear+birthday);
		        
		        br.close();

		    }catch (Exception e){
		        e.printStackTrace();
		    }
		    return vo;
		
	}
	
	
	/*취향 설정했는지 확인 */
	public Integer checkPreference(String memberId) {
		return signDAO.checkPreference(memberId);
	}
	
}

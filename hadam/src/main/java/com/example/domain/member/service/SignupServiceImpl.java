package com.example.domain.member.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.member.dao.SignDAO;
import com.example.domain.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SignupServiceImpl implements SignupService{

	@Autowired
	private SignDAO signupDAO;
	
//	아이디 중복확인
	public String memberIdCheck(String id) {
		return signupDAO.memberIdCheck(id);
	}
	
//	닉네임 중복확인
	public String memberNicknameCheck(String nickname) {
		return signupDAO.memberNicknameCheck(nickname);
	}

//	회원가입시 인증번호 보내기
	public String phoneCheckSMS(String phone, String randomSum) {
		
		String phoneCheck = signupDAO.memberCheckSMS(phone);
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
		return signupDAO.signupCompletion(vo);
	}

//	회원가입한 회원 index 조회
	public Integer getMemberIndex(String memberId) {
		return signupDAO.getMemberIndex(memberId);
	}
	
//	네이버 회원정보 입력
	public Integer naverSignup(MemberVO vo) {
//		네이버 기가입한 회원인지 확인
		String naver = signupDAO.naverMemberCheck(vo.getMemberId());
//		가입안된 회원이면 가입시켜	
		if(naver == null ) {
			signupDAO.naverSignup(vo);
			return 1;
//		기가입된 경우
		}else {
			return 0;
			
		}
	}
	
}

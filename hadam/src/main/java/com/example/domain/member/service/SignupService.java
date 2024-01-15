package com.example.domain.member.service;

import org.springframework.web.bind.annotation.RequestParam;

public interface SignupService {

	String memberIdCheck(String id);										// 아이디 중복확인
	String memberNicknameCheck(String nickname);							// 닉네임 중복확인
	String phoneCheckSMS(String phone, String randomSum);					// 핸드폰 인증번호 보내기
}

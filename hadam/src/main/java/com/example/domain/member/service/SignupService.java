package com.example.domain.member.service;

import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.member.vo.MemberVO;

public interface SignupService {

	String memberIdCheck(String id);										// 아이디 중복확인
	String memberNicknameCheck(String nickname);							// 닉네임 중복확인
	String phoneCheckSMS(String phone, String randomSum);					// 핸드폰 인증번호 보내기
	Integer signupCompletion(MemberVO vo);									// 회원가입 정보 입력
	Integer getMemberIndex(String memberId);								// 회원가입한 회원 index 조회
	
	Integer naverSignup(MemberVO vo);										// 네이버 회원정보 입력
}

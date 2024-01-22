package com.example.domain.mypage.service;

public interface MypageService {

	String passwordCheck(String memberId, String password);					/*현재 비밀번호 확인하기*/
	Integer passwordChange(String memberId, String newPasswrod);
	
}

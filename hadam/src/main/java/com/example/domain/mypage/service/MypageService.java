package com.example.domain.mypage.service;

import com.example.domain.member.vo.MemberVO;

public interface MypageService {

	String passwordCheck(String memberId, String password);					/*현재 비밀번호 확인하기*/
	Integer passwordChange(String memberId, String newPasswrod); 			/*비밀번호 변경하기*/
	String mypagePhoneNumber(Integer index); 								/*로그인한 사용자 전화번호 가져오기*/
	Integer phoneNumberChange(MemberVO vo);									/*전화번호 변경하기*/				
}

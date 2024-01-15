package com.example.domain.member.dao;

import org.apache.ibatis.annotations.Mapper;

/*	 
	페이지명	회원가입 페이지 
	용도		회원가입시에 필요한 DB연동작업	
	작성자 	최성익  
*/

@Mapper
public interface SignupDAO {

	/* 아이디 중복체크 */
	String memberIdCheck(String id);

	/* 닉네임 중복체크 */
	String memberNicknameCheck(String nickname);
	
	String memberCheckSMS(String phone);
}

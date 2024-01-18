package com.example.domain.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.member.vo.MemberVO;

/*	 
	페이지명	회원가입 페이지 
	용도		회원가입시에 필요한 DB연동작업	
	작성자 	최성익  
*/

@Mapper
public interface SignDAO {

//	==================== 회원가입 =====================

//	아이디 중복체크
	String memberIdCheck(String id);
//	닉네임 중복체크
	String memberNicknameCheck(String nickname);
//	전화번호 중복체크
	String memberCheckSMS(String phone);
//	회원가입정보 입력
	Integer signupCompletion(MemberVO vo);
//	취향정보 입력을 위한 memberIndex 검색
	Integer getMemberIndex(String memberId);
	
//	==================== 로그인 =======================
	
//	로그인 정보 확인 후 로그인 페이지 이동 
	MemberVO loginCheck(String memberId, String memberPassword);
	
}

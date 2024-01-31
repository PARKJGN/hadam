package com.example.domain.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.dao.SignDAO;
import com.example.domain.member.vo.MemberVO;

@Service
public class SigninServiceImpl implements SigninService{

	@Autowired
	private SignDAO signDAO;

	
//	로그인 정보 확인 후 로그인 페이지 이동
	public MemberVO loginCheck(String memberId, String memberPassword) {
		
		return signDAO.loginCheck(memberId, memberPassword);
	}

//	로그인 시 프로필 사진 가져오기
	public MemberUploadImagesVO profileCheck(Integer memberIndex) {
		return signDAO.profileCheck(memberIndex);
	}
	
//	아이디 비밀번호 찾기 - 아이디 가져오기
	public MemberVO getMemberId(String memberPhoneNumber) {
		return signDAO.getMemberId(memberPhoneNumber);
	}
}

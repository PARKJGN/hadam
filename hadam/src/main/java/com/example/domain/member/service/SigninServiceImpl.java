package com.example.domain.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}

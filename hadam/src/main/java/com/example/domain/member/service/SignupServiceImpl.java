package com.example.domain.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.member.dao.SignupDAO;

@Service
public class SignupServiceImpl implements SignupService{

	@Autowired
	private SignupDAO signupDAO;
	
	
	public String memberIdCheck(String id) {
		return signupDAO.memberIdCheck(id);
	}
	
	public String memberNicknameCheck(String nickname) {
		return signupDAO.memberNicknameCheck(nickname);
	}

}

package com.example.domain.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO mypageDAO;
	
	/*현재 비밀번호 확인하기*/
	public String passwordCheck(String memberId, String password) {
		return mypageDAO.passwordCheck(memberId, password);
	}
	
	public Integer passwordChange(String memberId, String newPassword) {
		return mypageDAO.passwordChange(memberId, newPassword);
	}
}

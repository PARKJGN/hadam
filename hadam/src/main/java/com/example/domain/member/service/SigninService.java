package com.example.domain.member.service;

import java.util.List;

import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;

public interface SigninService {

//	로그인 정보 확인 후 로그인 페이지 이동
	public MemberVO loginCheck(String memberId, String memberPassword);
	public MemberUploadImagesVO profileCheck(Integer memberIndex);

	
	
}

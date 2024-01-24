package com.example.domain.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.member.dao.MemberDAO;
import com.example.domain.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	// 스케줄 참가하기 버튼 클릭시 작성할 내 정보 조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		
		return memberDAO.getMemberList(vo);
	}

}

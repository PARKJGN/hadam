package com.example.domain.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.board.dao.CommunityUserDAO;
import com.example.domain.member.vo.MemberVO;

@Service
public class CommunityUserServiceImpl implements CommunityUserService{
	
	@Autowired
	private CommunityUserDAO communityUserDAO;

	// 현재 유저 정보 가져오기
	public MemberVO getCurrentUser() {
		MemberVO vo = new MemberVO();
		Integer memberNickname = vo.getMemberIndex();
		return communityUserDAO.getUserByUsername(memberNickname);
	}


	// memberIndex로 member정보 가져오기
	public MemberVO getMemberByMemberIndex(MemberVO vo) {

		return communityUserDAO.getMemberByMemberIndex(vo);
	}

}

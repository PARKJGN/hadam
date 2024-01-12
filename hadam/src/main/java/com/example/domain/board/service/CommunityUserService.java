package com.example.domain.board.service;

import com.example.domain.member.vo.MemberVO;

public interface CommunityUserService {

	MemberVO getCurrentUser();

	MemberVO getMemberByMemberIndex(MemberVO vo);
	
}

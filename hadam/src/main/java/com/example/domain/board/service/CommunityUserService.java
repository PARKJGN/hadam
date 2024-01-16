package com.example.domain.board.service;

import com.example.domain.member.vo.MemberVO;

public interface CommunityUserService {
	
	// 현재유저 조회
	MemberVO getCurrentUser();
	
	// 멤버인덱스의 해당하는 멤버 정보 찾기
	MemberVO getMemberByMemberIndex(MemberVO vo);
	
}

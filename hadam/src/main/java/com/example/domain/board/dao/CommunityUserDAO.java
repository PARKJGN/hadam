package com.example.domain.board.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.member.vo.MemberVO;

@Mapper
public interface CommunityUserDAO {
	
	// 당장은 안쓰는데 나중에 쓸수도 있어서 일단 안지웠습니다.
	MemberVO getUserByUsername(int memberNickname);
	
	// memberVO의 memberIndex로 회원정보 가져오기
	MemberVO getMemberByMemberIndex(MemberVO vo);

}

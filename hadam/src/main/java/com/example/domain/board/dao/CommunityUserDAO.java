package com.example.domain.board.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.member.vo.MemberVO;

@Mapper
public interface CommunityUserDAO {

	MemberVO getUserByUsername(int memberNickname);

	MemberVO getMemberByMemberIndex(MemberVO vo);

}

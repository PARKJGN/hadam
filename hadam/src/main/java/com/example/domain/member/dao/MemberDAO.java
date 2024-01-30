package com.example.domain.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	// 스케줄 참가하기 버튼 클릭시 작성할 내 정보 조회
	List<MemberVO> getMemberList(MemberVO vo);
	
	// 모든 회원 정보 조회
	List<MemberVO> allMemberList();
	
	
	// 관리자
	
	// 계정 정보 조회
	MemberVO getAccountInfo(String memberId);
	
	// 계정 정보 수정
	Integer accountU(MemberVO vo);
			
	// 계정 삭제
	void accountD(MemberVO vo);

}

package com.example.domain.member.service;

import java.util.List;

import com.example.domain.member.vo.MemberVO;

public interface MemberService {
	
	// 스케줄 참가하기 버튼 클릭시 작성할 내 정보조회
	List<MemberVO> getMemberList(MemberVO vo);

}

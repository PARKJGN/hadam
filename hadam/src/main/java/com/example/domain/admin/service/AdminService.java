package com.example.domain.admin.service;

import java.util.List;

import com.example.domain.admin.vo.AdminVO;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.schedule.vo.ScheduleVO;

public interface AdminService {
	
	// 대시보드
	AdminVO adminSelect();
	
	// 게시글 차트 구현
	List<BoardVO> boardChart(BoardVO vo);
	
	// 남녀 성비 차트 구현
	MemberVO sexChart(MemberVO vo);
	
	// 스케줄별 선호 카테고리 차트 구현
	List<ScheduleVO> cateChart(ScheduleVO vo);
}

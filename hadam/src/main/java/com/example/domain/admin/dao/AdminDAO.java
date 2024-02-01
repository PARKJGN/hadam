package com.example.domain.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.admin.vo.AdminVO;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.schedule.vo.ScheduleVO;

@Mapper
public interface AdminDAO {
	
	// 대시보드
	public AdminVO adminSelect();
	
	// 게시글 차트 구현
	public List<BoardVO> boardChart(BoardVO vo);
	
	// 남녀 성비 차트 구현
	public MemberVO sexChart(MemberVO vo);
	
	// 스케줄별 선호 카테고리 차트 구현
	public List<ScheduleVO> cateChart(ScheduleVO vo);

}

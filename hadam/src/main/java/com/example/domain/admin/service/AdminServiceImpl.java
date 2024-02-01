package com.example.domain.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.admin.dao.AdminDAO;
import com.example.domain.admin.vo.AdminVO;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.schedule.vo.ScheduleVO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	// 대시보드
	@Override
	public AdminVO adminSelect() {

		return adminDAO.adminSelect();
	}

	// 게시글 차트 구현
	@Override
	public List<BoardVO> boardChart(BoardVO vo) {

		return adminDAO.boardChart(vo);
	}

	// 남녀 성비 차트 구현
	@Override
	public MemberVO sexChart(MemberVO vo) {
		
		return adminDAO.sexChart(vo);
	}

	
	// 스케줄별 선호 카테고리 차트 구현
	@Override
	public List<ScheduleVO> cateChart(ScheduleVO vo) {

		return adminDAO.cateChart(vo);
	}
	

}

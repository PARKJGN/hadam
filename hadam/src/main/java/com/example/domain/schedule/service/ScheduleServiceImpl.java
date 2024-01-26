package com.example.domain.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.schedule.dao.ScheduleDAO;
import com.example.domain.schedule.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	// 스케줄 목록 조회
	public List<ScheduleVO> getScheduleList(Integer scheduleTableId) {

		return scheduleDAO.getScheduleList(scheduleTableId);
	}
	
	// 보드테이블에 저장된 스케줄 목록 조회
	public List<ScheduleVO> getScheduleBoardList() {
	
		return scheduleDAO.getScheduleBoardList();
	}

	// 내 스케줄 목록 불러오기 [최성익]
	public List<ScheduleVO> mypageSchedule(Integer memberIndex){
		return scheduleDAO.mypageSchedule(memberIndex);
	}
}

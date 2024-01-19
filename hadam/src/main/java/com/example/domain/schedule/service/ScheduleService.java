package com.example.domain.schedule.service;

import java.util.List;

import com.example.domain.schedule.vo.ScheduleVO;

public interface ScheduleService {
	
	// 스케줄 목록 조회
	List<ScheduleVO> getScheduleList(Integer scheduleTableId);

}

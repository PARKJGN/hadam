package com.example.domain.schedule.service;

import java.util.List;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

public interface ScheduleService {
	
	// 스케줄 목록 조회
	List<ScheduleVO> getScheduleList(Integer scheduleTableId);
	
	// 보드테이블에 저장된 스케줄 목록조회
	List<ScheduleVO> getScheduleBoardList(List<ScheduleTableVO> getScheduleTableBoardList);
	
	// 내 스케줄 목록 불러오기 [최성익]
	List<ScheduleVO> mypageSchedule(Integer memberIndex);
	
}

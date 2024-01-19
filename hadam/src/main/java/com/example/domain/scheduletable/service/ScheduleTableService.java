package com.example.domain.scheduletable.service;

import java.util.List;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

public interface ScheduleTableService {
	
	// 스케줄표 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableList();
	
	// 스케줄 리스트 가져오기
	List<ScheduleTableVO> getScheduleList();
	
	// 해당하는 스케줄테이블 가져오기 
	 List<ScheduleTableVO> getScheduleTable(ScheduleTableVO vo);

	
	// 스케줄테이블id 가져오기
	Integer getScheduleTableId(ScheduleTableVO svo);
	
	// 스케줄표 하나 가져오기
	ScheduleTableVO getSchedule(ScheduleTableVO svo);
	
	// 스케줄표 상태 업데이트
	void updateScheduleTableStatus(ScheduleTableVO vo);
	


	
}

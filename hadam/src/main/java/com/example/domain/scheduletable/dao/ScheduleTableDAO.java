package com.example.domain.scheduletable.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Mapper
public interface ScheduleTableDAO {
	
	// 스케줄표 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableList();
	
	// 스케줄 리스트 가져오기
	List<ScheduleTableVO> getScheduleList();
	
	// 해당 스케줄 테이블 가져오기
	 List<ScheduleTableVO> getScheduleTable(ScheduleTableVO vo);

	
	// scheduleTableId 가져오기
	Integer getScheduleTableId(ScheduleTableVO svo);
	
	// 스케줄표 하나 가져오기
	ScheduleTableVO getSchedule(ScheduleTableVO svo);
	
	// 스케줄표 상태 업데이트
	void updateScheduleTableStatus(ScheduleTableVO vo);
	
	// 스케줄표 insert
	void insertscheduletable(ScheduleTableVO stvo);
	
	
}

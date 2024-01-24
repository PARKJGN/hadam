package com.example.domain.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.domain.schedule.vo.ScheduleVO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> getScheduleList( Integer scheduleTableId);
	
	// 보드테이블에 저장된 스케줄리스트 조회
	List<ScheduleVO> getScheduleBoardList();

}

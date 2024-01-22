package com.example.domain.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.schedule.vo.ScheduleVO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> getScheduleList( Integer scheduleTableId);
	
	// 스케줄 list insert
	void insertScheduleList(@Param("svoList") List<ScheduleVO> svoList, @Param("scheduleTableId") Integer scheduleTableId, @Param("memberIndex") Integer memberIndex);

}

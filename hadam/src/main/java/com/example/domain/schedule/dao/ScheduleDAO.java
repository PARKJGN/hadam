package com.example.domain.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> getScheduleList( Integer scheduleTableId);
	
	// 보드테이블에 저장된 스케줄리스트 조회
	List<ScheduleVO> getScheduleBoardList(List<ScheduleTableVO> getScheduleTableBoardList);
	
	// 스케줄 list insert
	void insertScheduleList(@Param("svoList") List<ScheduleVO> svoList, @Param("scheduleTableId") Integer scheduleTableId, @Param("memberIndex") Integer memberIndex);

	// 내 스케줄 목록 불러오기 [최성익]
	List<ScheduleVO> mypageSchedule(Integer memberIndex);
	
}

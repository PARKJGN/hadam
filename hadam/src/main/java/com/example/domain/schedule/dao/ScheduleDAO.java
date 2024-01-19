package com.example.domain.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.domain.schedule.vo.ScheduleVO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> getScheduleList( Integer scheduleTableId);

}

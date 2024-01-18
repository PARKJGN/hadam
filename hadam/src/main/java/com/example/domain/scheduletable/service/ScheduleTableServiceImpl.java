package com.example.domain.scheduletable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.dao.ScheduleTableDAO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Service
public class ScheduleTableServiceImpl implements ScheduleTableService {
	
	@Autowired 
	private ScheduleTableDAO scheduleTableDAO;

	// 스케줄표 리스트 가져오기
	public List<ScheduleTableVO> getScheduleTableList() {
		
		List<ScheduleTableVO> list = scheduleTableDAO.getScheduleTableList();
		
		return list;
	}

	// 스케줄 리스트 가져오기
	public List<ScheduleTableVO> getScheduleList() {
		
		return scheduleTableDAO.getScheduleList();
	}

	// 해당하는 스케줄테이블 가져오기
	public  List<ScheduleTableVO> getScheduleTable(ScheduleTableVO vo) {

		return scheduleTableDAO.getScheduleTable(vo);
	}

	

	// 스케줄 테이블 id 가져오기
	public Integer getScheduleTableId(ScheduleTableVO svo) {
	
		return scheduleTableDAO.getScheduleTableId(svo);
	}

	// 스케줄표 하나 가져오기
	public ScheduleTableVO getSchedule(ScheduleTableVO svo) {
		
		return scheduleTableDAO.getSchedule(svo);
	}

	// 스케줄표 상태 업데이트
	public void updateScheduleTableStatus(ScheduleTableVO vo) {
		
		scheduleTableDAO.updateScheduleTableStatus(vo);
		
	}

	

	
}

package com.example.domain.scheduletable.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.schedule.dao.ScheduleDAO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.dao.ScheduleTableDAO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Service
public class ScheduleTableServiceImpl implements ScheduleTableService {
	
	@Autowired 
	private ScheduleTableDAO scheduleTableDAO;
	
	@Autowired
	private ScheduleDAO scheduleDao;

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

	@Override
	@Transactional
	public void insertscheduletable(ScheduleTableVO stvo) {
		
		// 스케줄표 insert
		scheduleTableDAO.insertscheduletable(stvo);
		
		//셀렉키로 stvo에 스케줄테이블id가 들어가있음
		Integer scheduleTableId = stvo.getScheduleTableId();
		
		// 스케줄 insert
		List<ScheduleVO> svoList = stvo.getScheduleList();
		scheduleDao.insertScheduleList(svoList, scheduleTableId, stvo.getMemberIndex());
	}

	

	
}

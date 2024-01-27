package com.example.domain.scheduletable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.board.vo.BoardVO;
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
	public List<ScheduleTableVO> getScheduleTableList(ScheduleTableVO vo) {
		
		List<ScheduleTableVO> list = scheduleTableDAO.getScheduleTableList(vo);
		
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

	// 스케줄 테이블 id 리스트 가져오기
	public List<ScheduleTableVO> getScheduleTableBoardList() {
		
		return scheduleTableDAO.getScheduleTableBoardList();
	}

	// boardId값 넘겨받아 스케줄테이블 리스트 출력
	public List<ScheduleTableVO> getScheduleDataByBoardId(Integer boardId) {
		
		return scheduleTableDAO.getScheduleDataByBoardId(boardId);
	}

	// 수정할 스케줄에서 boardId 가져오기
	public ScheduleTableVO getBoardIdByScheduleTable(Integer boardId) {
		
		return scheduleTableDAO.getBoardIdByScheduleTable(boardId);
	}

	// 수정시 기존에 있던 boardStatus 대기로 바꾸기
	public void updateScheduleTableStatusToWait(BoardVO vo) {
		
		scheduleTableDAO.updateScheduleTableStatusToWait(vo);
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

	// 내 스케줄 삭제 [최성익]
	public Integer scheduleDelete(Integer scheduleTableId) {
		return scheduleTableDAO.scheduleDelete(scheduleTableId);
	}
	
}

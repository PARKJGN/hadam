package com.example.domain.scheduletable.service;

import java.util.List;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.scheduletable.vo.AiCreateVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

public interface ScheduleTableService {
	
	// 스케줄표 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableList(ScheduleTableVO vo);
	
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
	
	// 스케줄테이블id 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableBoardList(PagingVO pvo);
	
	// 스케줄상세 모달페이지 -> boardId값 받아서 스케줄리스트 출력
	List<ScheduleTableVO> getScheduleDataByBoardId(Integer boardId);
	
	// 수정할 스케줄에서 boardId 가져오기
	ScheduleTableVO getBoardIdByScheduleTable(Integer boardId);
	
	// 수정시 기존에 있던 boardStatus 대기로 바꾸기
	void updateScheduleTableStatusToWait(BoardVO vo);
	
	// 스케줄표 insert
	void insertScheduleTable(ScheduleTableVO stvo);
	
	// ai스케줄표 create
	List<LocationVO> aiCreateScheduleTable(AiCreateVO aivo, Integer memberIndex);
	
	// 내 스케줄 삭제 [최성익]
	Integer scheduleDelete(Integer ScheduleTableId);
	
	// 스케줄공유 게시판에 검색
	List<ScheduleTableVO> searchScheduleBoards(BoardVO vo);
	
}

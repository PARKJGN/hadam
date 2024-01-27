package com.example.domain.scheduletable.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.scheduletable.vo.AiCreateVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

@Mapper
public interface ScheduleTableDAO {
	
	// 스케줄표 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableList(ScheduleTableVO vo);
	
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
	
	// 스케줄테이블 id 리스트 가져오기
	List<ScheduleTableVO> getScheduleTableBoardList();
	
	// boardId값 넘겨받아 스케줄테이블 리스트출력
	List<ScheduleTableVO> getScheduleDataByBoardId(Integer boardId);
	
	// 수정할 스케줄에서 boardId 가져오기
	ScheduleTableVO getBoardIdByScheduleTable(Integer boardId);
	
	// 수정시 기존에 있던 tableStatus 대기로 바꾸기 
	void updateScheduleTableStatusToWait(BoardVO vo);
	
	// 스케줄표 insert
	void insertScheduleTable(ScheduleTableVO stvo);
	
	// ai스케줄표 create
	List<LocationVO> aiCreateScheduleTable(@Param("aivo") AiCreateVO aivo, @Param("preferenceList") List<String> preferenceList, @Param("secondAi") Integer secondAi);
	
	List<LocationVO> CreateScheduleTable(@Param("aivo") AiCreateVO aivo, @Param("categoryList") List<String> categoryList);
	
}

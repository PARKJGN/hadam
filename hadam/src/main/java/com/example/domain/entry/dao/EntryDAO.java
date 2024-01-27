package com.example.domain.entry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.entry.vo.EntryApplicationVO;

@Mapper
public interface EntryDAO {
	
	// 스케줄 참가하기 버튼클릭시 저장
	void scheduleAttendSave(EntryApplicationVO vo);

	// entry 삭제
	void deleteEntry(Integer boardId);
	
	// entry 명단 확인
	EntryApplicationVO checkEntry(EntryApplicationVO vo);
	
	
}

package com.example.domain.entry.service;

import java.util.List;

import com.example.domain.entry.vo.EntryApplicationVO;

public interface EntryService {
	
	// 스케줄 참가신청
	void scheduleAttendSave(EntryApplicationVO vo);
	
	// 명단 삭제
	void deleteEntry(Integer boardId);
	
	// 명단 리스트 확인
	EntryApplicationVO checkEntry(EntryApplicationVO vo);
	
}

package com.example.domain.entry.service;

import com.example.domain.entry.vo.EntryApplicationVO;

public interface EntryService {
	
	// 스케줄 참가신청
	void scheduleAttendSave(EntryApplicationVO vo);

	void deleteEntry(Integer boardId);
	
}

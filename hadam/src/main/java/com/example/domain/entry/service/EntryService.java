package com.example.domain.entry.service;

import java.util.List;

import com.example.domain.entry.vo.EntryApplicationVO;

public interface EntryService {
	
	// 스케줄 참가신청
	void scheduleAttendSave(EntryApplicationVO vo);

	void deleteEntry(Integer boardId);
	
	// 마이페이지 참가신청 리스트 가져오기 [최성익]
	List<EntryApplicationVO> mypageEntry(Integer memberIndex);
	
}

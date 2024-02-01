package com.example.domain.entry.service;

import java.util.List;

import com.example.domain.entry.vo.EntryApplicationVO;

public interface EntryService {
	
	// 스케줄 참가신청
	void scheduleAttendSave(EntryApplicationVO vo);
	
	// 명단 삭제
	void deleteEntry(Integer boardId);
	
	// 마이페이지 참가신청 받은 리스트 가져오기 [최성익]
	List<EntryApplicationVO> mypageEntryResponse(Integer memberIndex);
	
	// 마이페이지 참가신청 보낸 리스트 가져오기 [최성익]
	List<EntryApplicationVO> mypageEntryRequest(Integer memberIndex);
	
	// 명단 리스트 확인
	EntryApplicationVO checkEntry(EntryApplicationVO vo);
	
	// 동행신청 수락 [최성익]
	Integer entryAccept(Integer boardId, Integer guestMemberIndex);
	
	// 동행신청 거절 [최성익]
	Integer entryRejection(Integer boardId, Integer guestMemberIndex);
	
	// 동행신청 취소 [최성익]
	Integer entryCancel(Integer boardId, Integer memberIndex);
}

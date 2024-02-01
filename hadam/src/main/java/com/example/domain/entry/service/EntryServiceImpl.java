package com.example.domain.entry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.entry.dao.EntryDAO;
import com.example.domain.entry.vo.EntryApplicationVO;

@Service
public class EntryServiceImpl implements EntryService{
	
	@Autowired
	private EntryDAO entryDAO;
	
	
	// 스케줄 참가신청
	public void scheduleAttendSave(EntryApplicationVO vo) {
		
		entryDAO.scheduleAttendSave(vo);
	}


	// entry 삭제
	public void deleteEntry(Integer boardId) {
		
		entryDAO.deleteEntry(boardId);
	}


	// entry 명단 확인
	public EntryApplicationVO checkEntry(EntryApplicationVO vo) {
		return entryDAO.checkEntry(vo);
	}
	
	
	// 마이페이지 참가신청 받은 리스트 가져오기 [최성익]
	public List<EntryApplicationVO> mypageEntryResponse(Integer memberIndex){
		return entryDAO.mypageEntryResponse(memberIndex);
	}
	
	// 마이페이지 참가신청 보낸 리스트 가져오기 [최성익]
	public List<EntryApplicationVO> mypageEntryRequest(Integer memberIndex){
		return entryDAO.mypageEntryRequest(memberIndex);
	}
	
	// 동행신청 수락 [최성익]
	public Integer entryAccept(Integer boardId, Integer guestMemberIndex) {
		return entryDAO.entryAccept(boardId, guestMemberIndex);
	}
	
	// 동행신청 거절 [최성익]
	public Integer entryRejection(Integer boardId, Integer guestMemberIndex) {
		return entryDAO.entryRejection(boardId, guestMemberIndex);
	}
	
	// 동행신청 취소 [최성익]
	public Integer entryCancel(Integer boardId, Integer memberIndex) {
		return entryDAO.entryCancel(boardId, memberIndex);
	}
	
}

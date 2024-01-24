package com.example.domain.entry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}

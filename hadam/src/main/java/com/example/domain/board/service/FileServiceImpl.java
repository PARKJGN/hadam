package com.example.domain.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.board.dao.FileDAO;
import com.example.domain.images.vo.MemberUploadImagesVO;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	FileDAO fileDAO;

	// memberuploadimage테이블에 insert
	public void saveFile(MemberUploadImagesVO vo) {
		fileDAO.saveFile(vo);
		
	}
	
	// file의 boardId 셀렉
	public int selectId() {
		
		return fileDAO.selectId();
	}

	// file 수정
	public void updateFile(MemberUploadImagesVO vo) {
		
		fileDAO.updateFile(vo);
	}

	// file 삭제
	public void deleteFile(int boardId) {
		fileDAO.deleteFile(boardId);
		
	}
	
	
}

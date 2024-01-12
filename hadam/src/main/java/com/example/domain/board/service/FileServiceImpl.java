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

	public int selectId() {
		
		return fileDAO.selectId();
	}
	
	
}

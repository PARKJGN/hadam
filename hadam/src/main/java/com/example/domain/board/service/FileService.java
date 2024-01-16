package com.example.domain.board.service;

import com.example.domain.images.vo.MemberUploadImagesVO;

public interface FileService {
	
	// 다중 파일 업로드
	public void saveFile(MemberUploadImagesVO vo);
	
	// 같은 boardId 찾기
	public int selectId();
	
	// 파일 수정
	public void updateFile(MemberUploadImagesVO vo);
	
	// 파일 삭제
	public void deleteFile(int boardId);
}

package com.example.domain.board.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.images.vo.MemberUploadImagesVO;

@Mapper
public interface FileDAO {
	
	// 파일 첨부 insert
	public void saveFile(MemberUploadImagesVO vo);
	
	// file의 boardId 갖고오기
	public int selectId();
	
	// 파일 수정
	public void updateFile(MemberUploadImagesVO fvo);
	
	// 파일 삭제
	public void deleteFile(int boardId);
}

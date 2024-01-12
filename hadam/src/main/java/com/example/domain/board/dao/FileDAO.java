package com.example.domain.board.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.images.vo.MemberUploadImagesVO;

@Mapper
public interface FileDAO {
	
	public void saveFile(MemberUploadImagesVO vo);
	
	public int selectId();
}

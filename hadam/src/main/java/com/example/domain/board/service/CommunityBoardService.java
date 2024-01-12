package com.example.domain.board.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.images.vo.MemberUploadImagesVO;

public interface CommunityBoardService {
	
	// 파일과 같이 insert
	void saveBoard(BoardVO vo, MemberUploadImagesVO fvo);
	
	// 자유게시판 목록 출력
	List<BoardVO> getBoardList();
	
	// 자유게시판 상세정보 조회
	BoardVO getBoard(BoardVO vo);
	
	// file저장할때 담을 boardId
	public int seletId();
	
	
	// 게시글 수정
	void updateBoard(BoardVO vo);

	

	
	
}

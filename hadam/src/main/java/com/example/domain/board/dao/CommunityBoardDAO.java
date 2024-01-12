package com.example.domain.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.board.vo.BoardVO;


@Mapper
public interface CommunityBoardDAO {
	
	// 자유게시판 목록 조회
	public List<BoardVO> getBoardList();

	// 자유게시판 insert
	public void saveBoard(BoardVO vo);

	// 자유게시판 상세 조회
	public BoardVO getBoard(BoardVO vo);
	
	// boardId select
	public int selectId();
	
	public void updateBoard(BoardVO vo);


	
}

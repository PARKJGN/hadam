package com.example.domain.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.board.dao.CommunityBoardDAO;
import com.example.domain.board.dao.FileDAO;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.images.vo.MemberUploadImagesVO;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {
	
	@Autowired
	private CommunityBoardDAO communityBoardDAO;
	
	@Autowired
	private FileDAO fileDAO;
	
	// 파일, 글정보 insert
	@Transactional
	public void saveBoard(BoardVO bvo, MemberUploadImagesVO fvo) {
		if ( fvo != null) {
			// 파일첨부가 있는 경우
			
			communityBoardDAO.saveBoard(bvo);
			fvo.setBoardId(communityBoardDAO.selectId()); 
			fileDAO.saveFile(fvo);
			System.out.println("boardServiceImpl -> ");
		}
//		communityBoardDAO.saveBoard(bvo);
//		System.out.println("boardServiceImpl -> ");
	}
	

	// 자유게시판 목록
	public List<BoardVO> getBoardList() {
	
		return communityBoardDAO.getBoardList();
	}


	// 자유게시판 상세
	public BoardVO getBoard(BoardVO vo) {
		
		return communityBoardDAO.getBoard(vo);
	}


	// boardId 찾기
	public int seletId() {

		return communityBoardDAO.selectId();
	}


	// 게시글 수정
	public void updateBoard(BoardVO vo) {

		
	}





}

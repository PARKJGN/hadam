package com.example.domain.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.board.dao.CommunityBoardDAO;
import com.example.domain.board.dao.FileDAO;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

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
		} else {
			communityBoardDAO.saveBoard(bvo);
		}
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

	// 해당 boardId에 있는 정보 가져오기
	public BoardVO findByboardId(int boardId) {

		return communityBoardDAO.findByboardId(boardId);
	}


	// 조회수 처리
	public void boardHits(int boardId) {
		
		communityBoardDAO.boardHits(boardId);
	}

	 //게시글과 파일 수정
	@Transactional
	public void updateBoardAndFile(BoardVO vo, MemberUploadImagesVO fvo) {
		
		communityBoardDAO.updateBoard(vo);
		if (fvo != null) {
			// 파일이 있는 경우 파일 정보 저장
			fvo.setBoardId(vo.getBoardId());
			fileDAO.updateFile(fvo);
		}
	}

	public void updateBoard(BoardVO vo) {
		
		communityBoardDAO.updateBoard(vo);
	}

	// 게시글, 파일 삭제
	public void deleteBoard(int boardId) {
		
		fileDAO.deleteFile(boardId);
		
		communityBoardDAO.deleteBoard(boardId);
	}

	// 댓글 저장
	public void commentSave(CommentVO vo) {
		
		communityBoardDAO.commentSave(vo);
	}

	// 해당 게시글에 작성한 댓글 리스트 가져오기
	public List<CommentVO> commentList(Integer boardId) {
		
		return communityBoardDAO.commentList(boardId);
	}

	// 신고 정보 저장
	public void commentReportSave(BoardAndCommentReportVO vo) {
		
		communityBoardDAO.commentReportSave(vo);
	}

	// 해당 게시글의 댓글 id 가져오기
//	public CommentVO getCommentId(int boardId) {
//		
//		return communityBoardDAO.getCommentId(boardId);
//	}


	// 해당 게시글의 댓글 id 가져오기
	public CommentVO selectCommentId(int boardId) {
		
		return communityBoardDAO.selectCommentId(boardId);
	}

	// 해당 게시글에 작성한 댓글 신고 리스트 가져오기
	public List<BoardAndCommentReportVO> reportList(Integer boardId) {
	
		return communityBoardDAO.reportList(boardId);
	}

	// 게시판 삭제시 해당 댓글도 삭제
	public void deleteComment(int boardId) {
		
		
		communityBoardDAO.deleteComment(boardId);
	}


	// 스케줄 저장
	public void scheduleTableSave(BoardVO vo) {
		

		communityBoardDAO.scheduleTableSave(vo);
		
	}







	







}

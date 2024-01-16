package com.example.domain.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;


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
	
	// 게시글 수정 
	public void updateBoard(BoardVO vo);
	
	// boardId에 해당하는 게시글 정보 select
	public BoardVO findByboardId(int boardId);

	// 게시글 조회수 처리
	public void boardHits(int boardId);

	// 게시글 삭제
	public void deleteBoard(int boardId);
	
	// 첨부파일 저장
	public void saveFile(MemberUploadImagesVO fileVO);
	
	// 작성한 댓글 저장
	public void commentSave(CommentVO vo);
	
	// 해당 게시글에 해당하는 댓글 목록 가져오기
	public List<CommentVO> commentList(Integer boardId);
	
	// 신고된 정보 저장
	public void commentReportSave(BoardAndCommentReportVO vo);
	
	// 해당 게시글 댓글 id 가져오기
	public CommentVO selectCommentId(int boardId);
	
	// 해당 게시글에 작성한 댓글 신고 리스트 가져오기
	public List<BoardAndCommentReportVO> reportList(Integer boardId);
	
	// 해당 게시글 삭제시 댓글도 삭제
	public void deleteComment(int boardId);
	
}

package com.example.domain.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.entry.vo.EntryApplicationVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;


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
	
	// 스케줄 저장
	public void scheduleTableSave(BoardVO vo);
	
	// 스케줄 목록조회
	public List<BoardVO> getScheduleShareList();

	// 스케줄표 목록조회
	public List<BoardVO> getScheduleTableShareList();
	
	// 스케줄 상세 모달 댓글 작성
	public void scheduleCommentWrite(CommentVO vo);
	
	// 스케줄 상세 댓글 리스트
	public List<CommentVO> scheduleCommentList(Integer boardId);
	
	// 스케줄 수정
	public void scheduleTableUpdate(BoardVO vo);
	
	// boardList
	public List<BoardVO> boardList(Integer boardId);
	
	// 내 게시물 가져오기 [최성익]
	List<BoardVO> mypageBoard(Integer memberIndex);

	// 참가자 명단 확인
	public EntryApplicationVO checkEntry(Integer boardId);
	
	// boardId 값 얻어오기
	public BoardVO getBoardId(Integer boardId);
	
	// boardList 검색
	public List<BoardVO> searchBoards(BoardVO vo);
	
}

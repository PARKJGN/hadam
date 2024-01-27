package com.example.domain.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.chat.chatjoin.vo.ChatRoomJoinVO;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.entry.vo.EntryApplicationVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

public interface CommunityBoardService {
	
	// 첨부파일과 게시글 정보 저장
	void saveBoard(BoardVO vo,  MemberUploadImagesVO fvo);
	
	// 자유게시판 목록 출력
	List<BoardVO> getBoardList();
	
	// 자유게시판 상세정보 조회
	BoardVO getBoard(BoardVO vo);
	
	// file저장할때 담을 boardId
	public int seletId();
	
	// boardUpdate 페이지 boardId에 해당하는 정보 가져오기
	BoardVO findByboardId(int boardId);
	
	// 조회수 처리
	void boardHits(int boardId);
	
	// board와 파일 둘다 수정
	void updateBoardAndFile(BoardVO vo, MemberUploadImagesVO fvo);
	
	// 파일이 업로드 되지않는경우 게시글 수정
	void updateBoard(BoardVO vo);
	
	// 게시글, 파일 삭제
	void deleteBoard(int boardId);

	// 댓글 저장
	void commentSave(CommentVO vo);
	
	// 해당 게시글에 작성한 댓글 리스트
	List<CommentVO> commentList(Integer boardId);
	
	// 신고 정보 저장
	void commentReportSave(BoardAndCommentReportVO vo);
	
	// 해당게시글의 댓글 id 가져오기
	CommentVO selectCommentId(int boardId);
	
	// 해당 게시글에 작성한 댓글 신고 리스트 가져오기
	List<BoardAndCommentReportVO> reportList(Integer boardId);
	
	// 게시판 삭제시 댓글도 삭제
	void deleteComment(int boardId);
	
	// 공유스케줄 저장
	void scheduleTableSave(BoardVO vo,  ChatRoomVO cvo, ScheduleTableVO svo, ChatRoomJoinVO cjvo);
	
	// 스케줄 목록조회
	List<BoardVO> getScheduleShareList();
	
	// 스케줄표 목록조회
	List<BoardVO> getScheduleTableShareList();
	
	// 스케줄 상세 모달 댓글 작성
	void scheduleCommentWrite(CommentVO vo);
	
	// 스케줄 상세페이지 댓글리스트
	List<CommentVO> scheduleCommentList(Integer boardId);
	
	// 스케줄 수정
	void scheduleTableUpdate(BoardVO vo);

	// boardList
	List<BoardVO> boardList(Integer boardId);
	
	// 내 게시물 가져오기 [최성익]
	List<BoardVO> mypageBoard(Integer memberIndex);

	// 참가명단 확인
	EntryApplicationVO checkEntry(Integer boardId);
	
	// boardId값 얻어오기
	BoardVO getBoardId(Integer boardId);
	
	// boardList 검색
	List<BoardVO> searchBoards(BoardVO vo);
	
}

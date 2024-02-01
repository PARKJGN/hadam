package com.example.domain.report.service;

import java.util.List;

import com.example.domain.report.vo.BoardAndCommentReportVO;


public interface ReportService {
	
	// 읽지 않은 신고 리스트 5개만 출력
	List<BoardAndCommentReportVO> unProcessedReportList();
	
	// 신고 리스트 출력
	List<BoardAndCommentReportVO> reportList();
	
	// 회원 정지
	Integer suspendMember(BoardAndCommentReportVO vo);
	
	// 정지 해제
	Integer releaseMember(BoardAndCommentReportVO vo);
}

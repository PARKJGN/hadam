package com.example.domain.report.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.report.vo.BoardAndCommentReportVO;

@Mapper
public interface ReportDAO {
	
	// 신고 리스트 출력
	List<BoardAndCommentReportVO> reportSelect();
	
	// 회원 정지
	Integer suspendMember(BoardAndCommentReportVO vo);
	
	// 정지 해제
	Integer releaseMember(BoardAndCommentReportVO vo);

}

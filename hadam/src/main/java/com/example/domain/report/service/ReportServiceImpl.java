package com.example.domain.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.admin.dao.AdminDAO;
import com.example.domain.admin.vo.AdminVO;
import com.example.domain.report.dao.ReportDAO;
import com.example.domain.report.vo.BoardAndCommentReportVO;


@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDAO reportDAO;
	
	// 읽지 않은 신고 리스트 5개만 출력
	@Override
	public List<BoardAndCommentReportVO> unProcessedReportList() {
		// TODO Auto-generated method stub
		return reportDAO.unProcessedReportList();
	};

	// 신고 리스트 출력
	@Override
	public List<BoardAndCommentReportVO> reportList() {

		return reportDAO.reportList();
	}
	
	// 회원 정지
	@Override
	public Integer suspendMember(BoardAndCommentReportVO vo) {
		
		return reportDAO.suspendMember(vo);
	};
	
	// 정지 해제
	@Override
	public Integer releaseMember(BoardAndCommentReportVO vo) {
		
		System.out.println(vo);
		
		return reportDAO.releaseMember(vo);
	}
	
}

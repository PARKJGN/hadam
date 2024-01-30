package com.example.domain.report.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardAndCommentReportVO {

	private Integer boardCommentReportId;
	
	private Integer boardId;
	
	private Integer commentId;
	
	private Integer boardCommentReporter;
	
	private Date boardCommentReportRegisteDate;
	
	private Integer boardCommentReportStatus;
	
	// 신고된 내용
	private String commentContent;
	// 신고된 회원
	private String reportedMember;
	
}

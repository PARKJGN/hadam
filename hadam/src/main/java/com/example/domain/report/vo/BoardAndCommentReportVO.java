package com.example.domain.report.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardAndCommentReportVO {

	private Integer boardAndCommentReportId;
	
	private Integer boardId;
	
	private Integer commentId;
	
	private Integer boardAndCommentReporter;
	
	private Date boardAndCommentReportRegisteDate;
	
	private Integer boardAndCommentReportStatus;
}

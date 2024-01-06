package com.example.domain.report.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageReportVO {
	
	private Integer messageReportId;
	
	private Integer messageId;
	
	private Integer messageReporter;
	
	private Date messageReportDate;
}

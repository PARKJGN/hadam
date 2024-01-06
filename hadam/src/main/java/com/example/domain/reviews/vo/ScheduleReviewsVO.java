package com.example.domain.reviews.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleReviewsVO {

	private Integer scheduleTableReviewId;
	
	private String scheduleTableReviewContent;
	
	private Date scheduleTableReviewDate;
	
	private Integer scheduleTableId;
	
	private Integer memberIndex;
}

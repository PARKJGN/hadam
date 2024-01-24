package com.example.domain.schedule.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {

	private Integer scheduleId;
	
	private Integer locationId;
	
	private Integer scheduleTableId;
	
	private Integer memberIndex;
	
	private String scheduleStartTime;
	
	private String scheduleEndTime;
	
	// 스케줄 목록 조회시 사용
	private String averageTime;
	
	// 스케줄 목록 조회시 사용
	private String locationName;
	
	private String scheduleTableName;
	
	private String boardTitle;
}

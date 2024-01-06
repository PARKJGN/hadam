package com.example.domain.schedule.vo;

import java.util.Date;

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
	
	private Date scheduleStartTime;
	
	private Date scheduleEndTime;
}

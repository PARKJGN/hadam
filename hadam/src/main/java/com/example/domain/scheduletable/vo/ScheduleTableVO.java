package com.example.domain.scheduletable.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleTableVO {

	private Integer scheduleTableId;
	
	private Integer memberIndex;
	
	private String scheduleTableName;
	
	private Date scheduleTableRegisteDate;
	
	private Date scheduleTableUpdateDate;
	
	private Date scheduleTableStartDate;
	
	private String scheduleTableStartMember;
	
	private String scheduleTableStatus;
}

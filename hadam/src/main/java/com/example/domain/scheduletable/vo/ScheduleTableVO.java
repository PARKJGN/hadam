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
	
	// 스케줄 목록 조회하려고 추가
	private String scheduleStartTime;
	
	// 스케줄 목록 조회하려고 추가
	private String scheduleEndTime;
	
	// 스케줄 목록 조회하려고 추가
	private String averageTime;
	
	// 스케줄 목록 조회하려고 추가
	private String locationName;
	
	private String memberNickname;
	
	private Integer boardId;
	
	private String boardTitle;
	
	private String boardContent;
}

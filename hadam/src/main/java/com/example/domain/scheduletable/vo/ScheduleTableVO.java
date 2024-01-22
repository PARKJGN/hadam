package com.example.domain.scheduletable.vo;

import java.util.List;

import com.example.domain.schedule.vo.ScheduleVO;

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
	
	private String scheduleTableRegisteDate;
	
	private String scheduleTableUpdateDate;
	
	private String scheduleTableStartDate;
	
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
	
	// 스케줄표 insert할때 가져갈 schedule 리스트
	private List<ScheduleVO> scheduleList;
}

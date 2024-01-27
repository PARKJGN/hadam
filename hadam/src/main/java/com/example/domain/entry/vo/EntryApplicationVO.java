package com.example.domain.entry.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EntryApplicationVO {
	
	private Integer entryApplicationId;
	 
	private Integer memberIndex;
	
	private Integer boardId;
	
	private String entryApplicationContent;
	
	private Date entryApplicationDate;
	
	// 참가신청시 스케줄테이블아이디 들고오기
	private Integer scheduleTableId;
}

package com.example.domain.admin.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminVO {
	
	// 대시보드 출력용
	
	private Integer memberCnt;
	
	private Integer scheduleCnt;

	private Integer todayMemberCnt;
	
	private Integer todayBoardCnt;
	
	private Integer todayReportCnt;
	
}

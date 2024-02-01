package com.example.domain.entry.vo;

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
	
	private String entryApplicationDate;
	
	// 추가 - 신청서 확인시 nickname 필요 [최성익]
	private String memberNickname;
	
	// 참가신청시 스케줄테이블아이디 들고오기
	private Integer scheduleTableId;
	
	// 신청 현황 0대기 1수락 2거절 [최성익]
	private Integer entryStatus;
	
	// 신청한 유저 프로필 사진 [최성익]
	private String memberUploadImageName;
}

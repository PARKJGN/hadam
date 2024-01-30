package com.example.domain.scheduletable.vo;

import java.util.Date;
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
	
	private Date scheduleTableRegisteDate;
	
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
	
	// 스케줄 상세모달창 정보 출력시 필요
	private String memberNickname;
	
	private Integer boardId;
	
	// 스케줄 목록 조회시 필요
	private String boardTitle;
	
	// 스케줄 상세모달창 정보 출력시 필요
	private String boardContent;
	
	// 스케줄표 insert할때 가져갈 schedule 리스트
	private List<ScheduleVO> scheduleList;
	
	// 스케줄 공유 게시판 목록조회시 필요
	private String boardSex;
	
	// 스케줄 공유 게시판 목록조회시 필요
	private String boardAge;
	
	// 스케줄 공유 게시판 목록조회시 필요
	private Integer chatRoomMax;
	
	// 스케줄 참가시 필요
	private Integer chatRoomId;
	
	// 스케줄 공유 게시판 목록조회시 필요
	private Integer chatRoomCount;
	
	// 스케줄 공유 게시판 검색시 필요
	private String searchType;
	
	// 스케줄 공유 게시판 검색시 필요
	private String keyword;
	
	private Integer locationId;
	
	// 스케줄 공유게시판 목록 조회시 필요
	private  Date boardRegisterDate;
}

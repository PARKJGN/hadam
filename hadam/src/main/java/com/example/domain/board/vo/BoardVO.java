package com.example.domain.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {

	private Integer boardId;
	
	private Integer memberIndex;
	
	private  Integer scheduleTableId;
	
	private  String boardTitle;
	
	private  String boardContent;
	
	private  Date boardRegisterDate;
	
	private  Date boardUpdateDate;
	
	private  Integer boardViews;
	
	// 자유게시판목록에 작성자칸에 회원 닉네임 뜨게 할라고 추가
	private String memberNickname;
	
	// 자유게시판 상세페이지에 이미지 띄울라고 추가
	private String memberUploadImagePath;
	
	private String memberUploadImageId;
	
	// 자유게시판 상세페이지에 이미지 띄울라고 추가
	private String memberUploadImageName;
	
	// 자유게시판 상세페이지에서 회원아이디랑 게시판 아이디랑 같은지 확인할라고 추가함
	private String memberId;
	
	// 자유게시판 수정페이지에서 파일첨부 수정 하려고 넣음
	private String memberUploadImageOriginalname;
	
	// 스케줄 공유 게시판 목록조회
	private String locationName;
	
	// 스케줄 공유 게시판 목록조회
	private String scheduleTableName;
	
	// 스케줄 공유 게시판 목록조회
	private String scheduleStartTime;
	
	// 스케줄 공유 게시판 목록조회
	private String scheduleEndTime;
	
	// 스케줄 공유 게시판 목록조회
	private Date scheduleTableRegisteDate;
	
	// 스케줄 공유 게시판 목록조회
	private String averageTime;
	
	// 스케줄 작성시 희망 성별
	private String boardSex;
	
	private String boardAge;
	
	private Integer chatRoomId;
	
	private Integer chatRoomMax;
	
	private Integer chatRoomCount;
	
	// 검색시 유형
	private String searchType;
	
	// 게시판 검색시 검색어
	private String keyword;
}

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
	
	// 스케줄 작성시 희망 나이
	private String boardAge;
	
	// 스케줄 참가 신청시 필요
	private Integer chatRoomId;
	
	// 스케줄 작성시 필요
	private Integer chatRoomMax;
	
	// 스케줄 공유 게시판 찬가 인원수 확인
	private Integer chatRoomCount;
	
	// 검색시 유형
	private String searchType;
	
	// 게시판 검색시 검색어
	private String keyword;
	
	
	// 스케줄 공유 게시판 검색시 사용할 페이징 
	private int pageNum;
	private int pageSize = 10; // 한페이지에 정보 10개씩
	private int pageCount = 10; // 페이지버튼 10개씩
	private int currentBlock; // 현재 페이지가 속한 블록(일정 범위의 페이지) 
	private int totalCount; // 전체 데이터의 개수 이 값은 페이징 처리에서 전체 데이터의 개수를 파악하여 총 몇 페이지가 필요한지 계산하는 데 사용
	private int recordIndex; // 현재 페이지에서 첫 번째로 표시되는 데이터의 인덱스를 나타내어 해당 페이지의 데이터를 추출하는 데 사용
	private int totalpage; // 페이징 처리에서 필요한 전체 페이지의 수를 나타내며, 사용자에게 페이지 수를 보여주거나 특정 페이지로 이동할 때 사용
	private int startpage; // 현재 페이징 블록에서 시작하는 페이지 번호를 나타냄
	private int endpage; // 현재 페이징 블록에서 끝나는 페이지 번호를 나타냄
	private int lastPage; // 전체 데이터를 기준으로 마지막 페이지의 번호를 나타냄

	public int getTotalpage() {
		totalpage = totalCount % pageSize == 0 ? totalCount / pageSize : (totalCount / pageSize) + 1;
		return totalpage;
	}


	public int getStartpage() {
		startpage = (currentBlock - 1) * pageCount + 1;
		return startpage;
	}


	public int getEndpage() {
		endpage = startpage + pageCount - 1;
		if (endpage > totalpage)
			endpage = totalpage;
		return endpage;
	}


	public int getLastPage() {
		lastPage = totalCount % pageSize > 0 ? (totalCount / pageSize) + 1 : totalCount / pageSize;
		return lastPage;
	}


	public int getCurrentBlock() {
		currentBlock = pageNum % pageCount == 0 ? pageNum / pageCount : pageNum / pageCount + 1;
		return currentBlock;
	}
	
	public int getRecordIndex() {
		recordIndex = (pageNum-1) * pageSize;
		return recordIndex;
	}
	
	
	// 관리자
	// 날짜별 게시글 수
	private Integer dateBoardCount;
	
	
}

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
	
	private  Integer schduleTableId;
	
	private  String boardTitle;
	
	private  String boardContent;
	
	private  Date boardRegisterDate;
	
	private  Date boardUpdateDate;
	
	private  Integer boardViews;
	
	// 자유게시판목록에 작성자칸에 회원 닉네임 뜨게 할라고 추가
	private String memberNickname;
	
	// 자유게시판 상세페이지에 이미지 띄울라고 추가
	private String memberUploadImagePath;
	
	// 자유게시판 상세페이지에 이미지 띄울라고 추가
	private String memberUploadImageName;
	
	// 자유게시판 상세페이지에서 회원아이디랑 게시판 아이디랑 같은지 확인할라고 추가함
	private String memberId;
}

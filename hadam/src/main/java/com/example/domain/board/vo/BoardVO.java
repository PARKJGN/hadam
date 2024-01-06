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
}

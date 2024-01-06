package com.example.domain.comment.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private Integer commentId;
	
	private Integer boardId;
	
	private String commentContent;
	
	private Date commentRegisteDate;
	
	private Date commentUpdateDate;
	
	private Integer memberIndex;
}

package com.example.domain.reply.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

	private Integer keywordLogId;
	private String keyword;
	private Date keywordDate;
}

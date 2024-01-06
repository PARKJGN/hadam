package com.example.domain.log.keywordlog;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeywordLogVO {

	private Integer keywordLogId;
	
	private String keyword;
	
	private Date keywordDate;
	
}

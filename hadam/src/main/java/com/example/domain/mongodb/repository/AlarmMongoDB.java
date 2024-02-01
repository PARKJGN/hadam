package com.example.domain.mongodb.repository;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="alarm")
public class AlarmMongoDB {

	@Id
	private String id;
	private Integer memberIndex;
	private Integer boardId;
	private String boardName;
	private String alarmContent;
	

	
}

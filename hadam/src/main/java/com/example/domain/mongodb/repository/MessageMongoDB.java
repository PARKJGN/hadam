package com.example.domain.mongodb.repository;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="chattingdata")
public class MessageMongoDB {
	
	@Id
	private String id;
	private Integer chatRoomId; 
	private Integer memberIndex; 
	private String memberNickname;
	private String chatContent;
	private Date sendTime;
	private String memberUploadImageName;
}

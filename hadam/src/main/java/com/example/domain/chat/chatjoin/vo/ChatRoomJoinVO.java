package com.example.domain.chat.chatjoin.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomJoinVO {

	private Integer chatRoomId;
	
	private Integer memberIndex;
	
	private String chatRoomName;
	
	private Date chatRoomJoinTime;
}

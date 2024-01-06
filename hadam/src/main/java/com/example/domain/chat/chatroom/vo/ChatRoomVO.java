package com.example.domain.chat.chatroom.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomVO {

	private Integer chatRoomId;
	
	private String chatRoomLastMsg;
	
	private Date chatRoomLastSendTime;
	
	private Date chatRoomRegisteDate;
	
	private Integer chatRoomMax;
	
	private Integer boardId;
}

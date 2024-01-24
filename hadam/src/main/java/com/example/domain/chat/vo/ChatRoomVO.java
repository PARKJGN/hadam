package com.example.domain.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomVO {

	private Integer chatRoomId;
	
	private String chatRoomLastMsg;		// 채팅이 쳐질 때마다 초기화 ?
	
	private Date chatRoomLastSendTime;	// 채팅이 쳐질 때마다 초기화	?
	
	private Date chatRoomRegisteDate;	// 채팅방 생성시에 시간
	
	private Integer chatRoomMax;		// 스케줄참여 인원수만큼  (수정은 나중에)
	
	private Integer boardId;
	
	private Integer memberIndex;
	private String chatRoomName;
}

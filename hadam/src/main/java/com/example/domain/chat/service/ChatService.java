package com.example.domain.chat.service;

import java.util.List;

import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;

public interface ChatService {
	
	// 채팅방 생성하는 함수 -정건일
	void insertChatRoom(ChatRoomVO vo);
	
	// 채팅방에 참여하는 함수 -정건일
	void joinChatRoom(ChatRoomVO vo);
	
	// 내가속한 채팅방 목록을 불러오는 함수 - 정건일
	List<ChatRoomVO> getChatRoomList(ChatRoomVO vo);
	

	
}

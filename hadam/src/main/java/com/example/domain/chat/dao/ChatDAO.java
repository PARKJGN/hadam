package com.example.domain.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;

@Mapper
public interface ChatDAO {
	
	// 채팅방 생성하는 함수 -정건일
	public void insertChatRoom(ChatRoomVO vo);

	
	// 채팅방에 참여하는 함수 -정건일
	public void joinChatRoom(ChatRoomVO vo);
	
	
	// 내가속한 채팅방을 불러오는 함수 -정건일
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo);
	
	
}

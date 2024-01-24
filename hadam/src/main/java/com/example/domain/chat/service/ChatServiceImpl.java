package com.example.domain.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.chat.dao.ChatDAO;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	// 채팅방 생성하는 함수 -정건일
	public void insertChatRoom(ChatRoomVO vo) {
		System.out.println("chatserviceImpl vo 확인용"+vo);
		chatDAO.insertChatRoom(vo);
	}
	
	@Override
	// 채팅방에 참여하는 함수 -정건일
	public void joinChatRoom(ChatRoomVO vo) {
		chatDAO.joinChatRoom(vo);
	}
	
	
	// 내가속한 채팅방 목록을 불러오는 함수 -정건일 
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo) {
		return chatDAO.getChatRoomList(vo);
	}
	
	
	
	
}

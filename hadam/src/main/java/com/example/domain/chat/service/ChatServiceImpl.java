package com.example.domain.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.chat.chatjoin.vo.ChatRoomJoinVO;
import com.example.domain.chat.dao.ChatDAO;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;
import com.example.domain.entry.vo.EntryApplicationVO;

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

	// 스케줄 작성시 최대인원수 저장
	public void chatRoomSave(ChatRoomVO cvo) {
		chatDAO.chatRoomSave(cvo);
	}


	// 채팅 참가 인원 제거
	public void deleteChatRoom(Integer boardId) {
		
		chatDAO.deleteChatRoom(boardId);
	}

	// 최대 참가 인원 수 확인
	public List<ChatRoomVO> checkChatRoomMax(ChatRoomVO vo) {
		
		return chatDAO.checkChatRoomMax(vo);
	}

	// 스케줄 참가 인원 확인
	public ChatRoomJoinVO chatRoomJoinCount(ChatRoomJoinVO vo) {
		
		return chatDAO.chatRoomJoinCount(vo);
	}

	// chatRoomJoin 삭제
	public void deleteChatRoomJoin(Integer boardId) {
		
		chatDAO.deleteChatRoomJoin(boardId);
	}

	// board테이블과 조인된 chatRoomJoin 리스트 출력
	public List<ChatRoomJoinVO> getChatRoomJoinList() {
		
		return chatDAO.getChatRoomJoinList();
	}

	// chatRoomMax 업데이트
	public void updateChatRoomMax(BoardVO vo) {
		
		chatDAO.updateChatRoomMax(vo);
	}



	
	
}

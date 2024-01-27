package com.example.domain.chat.service;

import java.util.List;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.chat.chatjoin.vo.ChatRoomJoinVO;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;
import com.example.domain.entry.vo.EntryApplicationVO;

public interface ChatService {
	
	// 채팅방 생성하는 함수 -정건일
	void insertChatRoom(ChatRoomVO vo);
	
	// 채팅방에 참여하는 함수 -정건일
	void joinChatRoom(ChatRoomVO vo);
	
	// 내가속한 채팅방 목록을 불러오는 함수 - 정건일
	List<ChatRoomVO> getChatRoomList(ChatRoomVO vo);
	
	// 스케줄작성시 최대인원수 저장
	void chatRoomSave(ChatRoomVO cvo);
	
	// 채팅참가 인원 제거
	void deleteChatRoom(Integer boardId);
	
	// 최대참가 인원 수 확인
	List<ChatRoomVO> checkChatRoomMax(ChatRoomVO vo);
	
	// 스케줄 참가인원 확인
	ChatRoomJoinVO chatRoomJoinCount(ChatRoomJoinVO vo);
	
	// chatRoomJoin 삭제
	void deleteChatRoomJoin(Integer boardId);
	
	// board테이블과 조인된 chatRoomJoin list 출력
	List<ChatRoomJoinVO> getChatRoomJoinList();
	
	// chatRoomMax 업데이트
	void updateChatRoomMax(BoardVO vo);
	


	
}

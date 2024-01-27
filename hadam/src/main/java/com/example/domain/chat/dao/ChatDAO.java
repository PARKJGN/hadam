package com.example.domain.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.chat.chatjoin.vo.ChatRoomJoinVO;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.chat.vo.MessageVO;
import com.example.domain.entry.vo.EntryApplicationVO;

@Mapper
public interface ChatDAO {
	
	// 채팅방 생성하는 함수 -정건일
	public void insertChatRoom(ChatRoomVO vo);
	
	// 채팅방에 참여하는 함수 -정건일
	public void joinChatRoom(ChatRoomVO vo);
	
	// 내가속한 채팅방을 불러오는 함수 -정건일
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo);

	// 스케줄 작성시 최대인원수 저장
	public void chatRoomSave(ChatRoomVO vo);

	// 채팅참가인원 제거
	public void deleteChatRoom(Integer boardId);

	// 최대 참가 인원 수 확인 
	public List<ChatRoomVO> checkChatRoomMax(ChatRoomVO vo);

	// 스케줄 참가 인원 확인
	public ChatRoomJoinVO chatRoomJoinCount(ChatRoomJoinVO vo);
	
	// chatRoomJoin 삭제
	public void deleteChatRoomJoin(Integer boardId);
	
	// board테이블에 조인된 chatRoomJoin 목록 출력
	public List<ChatRoomJoinVO> getChatRoomJoinList();
	
	// chatRoomMax 업데이트
	public void updateChatRoomMax(BoardVO vo);
	
	// chatRoomJoin 테이블 insert
	public void chatRoomJoinSave(ChatRoomJoinVO cjvo);

	
}

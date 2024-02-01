package com.example.domain.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	// 마지막채팅내용/ 마지막 전달시간 update함수 -정건일
	void lastChatLastSendTimeUpdate(ChatRoomVO vo);


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

	// 동행신청에서 수락 눌렀을 때 1 채팅방 번호랑 최대인원수 확인 [최성익]
	ChatRoomVO entryAcceptCheck(@Param("boardId")Integer boardId, @Param("memberIndex") Integer guestMemberIndex);
	// 동행신청에서 수락 눌렀을 때 2 참석 가능한 채팅방인지 확인 [최성익]
	Integer entryAcceptMaxCheck(Integer chatRoomId);
	// 동행신청에서 수락 눌렀을 때 3 참석하기 [최성익]
	Integer entryAccept(@Param("chatRoomId") Integer chatRoomId, @Param("guestMemberIndex") Integer guestMemberIndex, @Param("boardId") Integer boardId);
	
}

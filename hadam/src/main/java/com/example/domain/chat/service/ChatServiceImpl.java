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

	// 동행신청에서 수락 눌렀을 때 [최성익]
	public String entryAcceptCheck(Integer boardId, Integer guestMemberIndex) {
		// 채팅방 번호랑 최대인원수 확인
		System.out.println("보드ID"+boardId+"/"+guestMemberIndex);
		ChatRoomVO result = chatDAO.entryAcceptCheck(boardId, guestMemberIndex);
		System.out.println(result.getChatRoomId()+"/"+result.getChatRoomMax());
		Integer chatRoomId = result.getChatRoomId();
		// 참석 가능한 채팅방인지 확인
		Integer count = chatDAO.entryAcceptMaxCheck(chatRoomId);

		if(count >= result.getChatRoomMax() ) {
			return "정원이 마감된 스케줄 입니다";
		}else {
			Integer entryAcceptResult =  chatDAO.entryAccept(chatRoomId, guestMemberIndex, boardId);
			if(entryAcceptResult==1) {
				
				return "수락 되었습니다"; 
			}else {
				return "네트워크에 문제가 있습니다 잠시후 시도해 주세요";
			}
		}
	}

	
	
}

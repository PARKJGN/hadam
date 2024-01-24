package com.example.domain.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.chat.service.ChatService;
import com.example.domain.chat.vo.ChatRoomVO;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	
	//채팅관련 service -정건일
	@Autowired
	private ChatService chatService;
	
	
	
	/*함수명	: insertChatRoom
	 *인자	: ChatRoomVO vo :boardId,chatRoomMax
	 *기능	: 채팅방 만들기 버튼을 눌렀을 때 새로운 채팅방이 생성됨.
	 *제작	: 정건일 
	 * */
	@GetMapping("/insert")
	public void insertChatRoom(ChatRoomVO vo) {
		System.out.println("채팅방 생성및 성공여부 판단"+vo);
		chatService.insertChatRoom(vo);
		System.out.println("채팅방 생성및 성공여부 판단");
	}
	
	
	/*함수명	: joinChatRoom
	 *인자	: ChatRoomVO vo : chatRoomId,memberIndex
	 *기능	: 만들어진 채팅방에 등록(구독)할 수 있게 해주는 함수
	 *제작	: 정건일
	 * */
	@GetMapping("/join")
	public void joinChatRoom(ChatRoomVO vo) {
		
		chatService.joinChatRoom(vo);

	}
	
	
	
	/*함수명	: getChatRoomList
	 *인자	: ChatRoomVO vo : chatRoomId,memberIndex
	 *기능	: 내가속한 채팅방을 불러오는 함수
	 *제작	: 정건일
	 * */
	@ResponseBody
    @PostMapping("/getchatroomlist")
	
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo) {
		System.out.println(vo);
		List<ChatRoomVO> list = chatService.getChatRoomList(vo);
		System.out.println(list);
		
		return list;
	}
	
	
	/*함수명	: getChatRoomInfo
	 *인자	: ChatRoomVO vo : chatRoomId,memberIndex
	 *기능	: 내가속한 채팅방내용을 불러오는 함수
	 *제작	: 정건일
	 *안쓸거같아요 ㅎ-ㅎ
	 * */
	@GetMapping("/getchatroominfo")
	public void getChatRoomInfo(ChatRoomVO vo) {
		
	}
		
}

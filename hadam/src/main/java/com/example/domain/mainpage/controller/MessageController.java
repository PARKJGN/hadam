package com.example.domain.mainpage.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.chat.service.ChatService;
import com.example.domain.chat.vo.ChatRoomVO;


@Controller
@RequestMapping("app")
public class MessageController {
	@Autowired
	private ChatService chatService;
	
    @MessageMapping("/chat/{RoomId}")
    @SendTo("/topic/greetings/{RoomId}")
    public Greeting handleChatMessage(Message message , @DestinationVariable Integer RoomId) {
       
    	//마지막 채팅내용과 날짜를 갱신하기위해서 만든 없데이트 함수
    	ChatRoomVO vo = new ChatRoomVO();
    	vo.setChatRoomId(RoomId);
    	vo.setChatRoomLastMsg(message.getUserMessage());
    	chatService.lastChatLastSendTimeUpdate(vo);
    	
    	 // 클라이언트로부터 받은 메시지를 처리하고, 해당 채팅방으로 메시지를 전송
    	return new Greeting(message.getUserMessage(),message.getMemberNickname(),message.getSendTime(),message.getMemberUploadImageName());
    	
     }
}


//	/*messagingTemplate.convertAndSend("/topic/greetings/" + roomId, new Greeting(message.getUserMessage()));*/
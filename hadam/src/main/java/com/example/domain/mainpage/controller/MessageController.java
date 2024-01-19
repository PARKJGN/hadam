package com.example.domain.mainpage.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;


@Controller
public class MessageController {
	
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
	
    @MessageMapping("/chat/{roomId}")
    public void handleChatMessage(@DestinationVariable String roomId, Message message) {
        // 클라이언트로부터 받은 메시지를 처리하고, 해당 채팅방으로 메시지를 전송
    	System.out.println("greeting message?: "+ message.getName());
    	messagingTemplate.convertAndSend("/topic/greetings/" + roomId, new Greeting(message.getName()));
    }
}

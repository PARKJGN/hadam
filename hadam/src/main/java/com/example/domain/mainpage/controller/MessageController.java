package com.example.domain.mainpage.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;


@Controller
@RequestMapping("app")
public class MessageController {
	
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
	
    @MessageMapping("/chat/{roomId}")
    @SendTo("/topic/greetings/{roomId}")
    public Greeting handleChatMessage(@DestinationVariable String roomId, Message message) {
        // 클라이언트로부터 받은 메시지를 처리하고, 해당 채팅방으로 메시지를 전송
    	System.out.println("greeting message?: "+ message.getUserMessage());
    	System.out.println("roomId?: "+ roomId);
    	return new Greeting(message.getUserMessage());
    	
     }
}


//	/*messagingTemplate.convertAndSend("/topic/greetings/" + roomId, new Greeting(message.getUserMessage()));*/
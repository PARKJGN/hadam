package com.example.domain.mongodb.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mongodb")
public class MessageMongoDBController {
	
	private final MessageService messageservice;
	
    @Autowired
	public MessageMongoDBController(MessageService messageservice) {
		this.messageservice = messageservice;
	}
	
    
    
    @PostMapping
	public MessageMongoDB saveMessage(@RequestBody MessageMongoDB message) {
		return messageservice.saveMessage(message);
	}
    
    @GetMapping("/{chatRoomId}")
	public List<MessageMongoDB> getAllMessage(@PathVariable Integer chatRoomId) {
		return messageservice.getChatMessagesByRoomId(chatRoomId);
	}
    @DeleteMapping("/{Roomid}")
	public void deleteMessage(MessageMongoDB message) {		
	}
	
}

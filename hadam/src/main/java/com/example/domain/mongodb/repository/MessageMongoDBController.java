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

import com.example.domain.member.service.MemberService;

@RestController
@RequestMapping("/mongodb")
public class MessageMongoDBController {
	
	private final MessageService messageservice;
	//private final MemberService memberService;
    @Autowired
	public MessageMongoDBController(MessageService messageservice) {
		this.messageservice = messageservice;
	}
	
    
    //채팅 관련된 mapping
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
    
    //알림 관련된 mapping
    @PostMapping("/alarmsave")
 	public AlarmMongoDB saveAlarm(@RequestBody AlarmMongoDB alarm) {
 		return messageservice.saveAlarm(alarm);
 	}
     
     @GetMapping("/getalarm/{memberIndex}")
 	public List<AlarmMongoDB> getAllAlarmByMemberIndex(@PathVariable Integer memberIndex) {
    	 return messageservice.getAllAlarmByMemberIndex(memberIndex);
 	}
     @DeleteMapping("/deleteAlarm/{id}")
 	public void deleteAlarm(@PathVariable String id) {	
    	 messageservice.deleteAlarm(id);
 	}
	
}

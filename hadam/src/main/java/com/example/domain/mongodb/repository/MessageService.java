package com.example.domain.mongodb.repository;

import java.util.List;

public interface MessageService {
	MessageMongoDB saveMessage(MessageMongoDB message);
	List<MessageMongoDB> getAllMessage();
	void deleteMessage(String id);
	List<MessageMongoDB> getChatMessagesByRoomId(Integer chatRoomId);
	
	
	AlarmMongoDB saveAlarm(AlarmMongoDB alarm);
	List<AlarmMongoDB> getAllAlarmByMemberIndex(Integer memberIndex);
	void deleteAlarm(String id);
}

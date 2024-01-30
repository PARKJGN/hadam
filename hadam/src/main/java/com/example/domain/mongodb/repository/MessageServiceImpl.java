package com.example.domain.mongodb.repository;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{

	private final MessageMongoDBRepository messageRepository;
	private final AlarmMongoDBRepository alarmRepository;

	public MessageServiceImpl(MessageMongoDBRepository messageRepository, AlarmMongoDBRepository alarmRepository){
		this.messageRepository = messageRepository;
		this.alarmRepository = alarmRepository;
	}
	
	
	@Override
	public MessageMongoDB saveMessage(MessageMongoDB message) {

		return messageRepository.save(message);
	}

	@Override
	public List<MessageMongoDB> getAllMessage() {
		return messageRepository.findAll();
	}

	@Override
	public void deleteMessage(String id) {
		messageRepository.deleteById(id);
	}

	@Override
	public List<MessageMongoDB> getChatMessagesByRoomId(Integer chatRoomId) {
		return messageRepository.findByChatRoomId(chatRoomId);
	}
	
	
	//알림

	@Override
	public AlarmMongoDB saveAlarm(AlarmMongoDB alarm) {
		 
		return alarmRepository.save(alarm);
	}

	@Override
	public List<AlarmMongoDB> getAllAlarmByMemberIndex(Integer memberIndex) {
		 
		return alarmRepository.getAllAlarmByMemberIndex(memberIndex);
	}

	@Override
	public void deleteAlarm(String id) {
		alarmRepository.deleteById(id);
		
	}

}

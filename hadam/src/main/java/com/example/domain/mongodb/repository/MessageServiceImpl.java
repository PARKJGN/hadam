package com.example.domain.mongodb.repository;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{

	private final MessageMongoDBRepository messageRepository;
	
	public MessageServiceImpl(MessageMongoDBRepository messageRepository) {
		this.messageRepository = messageRepository;
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

}

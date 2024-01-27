package com.example.domain.mongodb.repository;
import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;


public interface MessageMongoDBRepository extends MongoRepository<MessageMongoDB,String>{
    List<MessageMongoDB> findByChatRoomId(Integer chatRoomId);

}

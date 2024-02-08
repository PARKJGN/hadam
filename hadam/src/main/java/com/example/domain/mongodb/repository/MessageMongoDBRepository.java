package com.example.domain.mongodb.repository;
import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.stereotype.Repository;

@Repository
@EnableMongoRepositories(basePackages = "com.example")
public interface MessageMongoDBRepository extends MongoRepository<MessageMongoDB,String>{
    List<MessageMongoDB> findByChatRoomId(Integer chatRoomId);

}

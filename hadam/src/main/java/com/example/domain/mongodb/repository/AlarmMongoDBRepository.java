package com.example.domain.mongodb.repository;
import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;


public interface AlarmMongoDBRepository extends MongoRepository<AlarmMongoDB,String>{
    List<AlarmMongoDB> getAllAlarmByMemberIndex(Integer memberIndex);

}
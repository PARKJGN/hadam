package com.example.domain.mypage.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MypageDAO {
	String passwordCheck(@Param("memberId") String memberId, @Param("password") String password);
	Integer passwordChange(String memberId, String newPassword);
}

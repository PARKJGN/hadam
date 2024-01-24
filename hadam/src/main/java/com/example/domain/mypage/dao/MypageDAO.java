package com.example.domain.mypage.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.member.vo.MemberVO;

@Mapper
public interface MypageDAO {
	String passwordCheck(@Param("memberId") String memberId, @Param("password") String password);
	Integer passwordChange(String memberId, String newPassword);
	String mypagePhoneNumber(Integer memberIndex);
	Integer phoneNumberChange(MemberVO vo);
}

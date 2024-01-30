package com.example.domain.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.favorites.vo.FavoritesVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;

@Mapper
public interface MypageDAO {
	String passwordCheck(@Param("memberId") String memberId, @Param("password") String password);
	Integer passwordChange(String memberId, String newPassword);
	String mypagePhoneNumber(Integer memberIndex);
	Integer phoneNumberChange(MemberVO vo);
	Integer scheduleNum(Integer memberIndex);
	Integer scheduleShareNum(Integer memberIndex);
	Integer boardNum(Integer memberIndex);
	Integer profileModify(MemberUploadImagesVO vo);
	Integer profileModifyNickname(MemberVO vo);
	
}

package com.example.domain.mypage.service;

import java.util.List;

import com.example.domain.favorites.vo.FavoritesVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;

public interface MypageService {

	String passwordCheck(String memberId, String password);					/*현재 비밀번호 확인하기*/
	Integer passwordChange(String memberId, String newPasswrod); 			/*비밀번호 변경하기*/
	String mypagePhoneNumber(Integer index); 								/*로그인한 사용자 전화번호 가져오기*/
	Integer phoneNumberChange(MemberVO vo);									/*전화번호 변경하기*/		
	List<Integer> mypageHeaderInfo(Integer memberIndex); 					/*마이페이지 헤더정보 가져오기*/

	Integer profileModify(MemberUploadImagesVO vo);							/*프로필 사진 변경*/
	Integer profileModifyNickname(MemberVO vo);								/*닉네임 변경*/
	
}

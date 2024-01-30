package com.example.domain.mypage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.favorites.vo.FavoritesVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;
	
	/*현재 비밀번호 확인하기*/
	public String passwordCheck(String memberId, String password) {
		return mypageDAO.passwordCheck(memberId, password);
	}
	
	public Integer passwordChange(String memberId, String newPassword) {
		return mypageDAO.passwordChange(memberId, newPassword);
	}
	
	public String mypagePhoneNumber(Integer index) {
		return mypageDAO.mypagePhoneNumber(index);
	}
	
	public Integer phoneNumberChange(MemberVO vo) {
		return mypageDAO.phoneNumberChange(vo);
	}
	
	public List<Integer> mypageHeaderInfo(Integer memberIndex){
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(0, mypageDAO.scheduleNum(memberIndex));
		list.add(1, mypageDAO.scheduleShareNum(memberIndex));
		list.add(2, mypageDAO.boardNum(memberIndex));
		
		return list;
	}
	
	public Integer profileModify(MemberUploadImagesVO vo) {
		return mypageDAO.profileModify(vo);
	}
	
	public Integer profileModifyNickname(MemberVO vo) {
		return mypageDAO.profileModifyNickname(vo);
	}
}

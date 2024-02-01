package com.example.domain.preference.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PreferenceDAO {

	public void SignupPreference(@Param("memberIndex") Integer memberIndex, @Param("checkedCategory") List<Integer> checkedCategory);
	
	// 유저 취향 소분류 카테고리로 들고오기
	public List<String> SelectPreferenceByMemberIndex(@Param ("memberIndex") Integer memberIndex, @Param("categoryList") List<String> categoryList);
	
	// 기존 취향 삭제
	public Integer preferenceDelete(Integer memberIndex);
}

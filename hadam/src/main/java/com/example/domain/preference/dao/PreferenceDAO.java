package com.example.domain.preference.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PreferenceDAO {

	public void SignupPreference(@Param("memberIndex") Integer memberIndex, @Param("checkedCategory") List<Integer> checkedCategory);
}

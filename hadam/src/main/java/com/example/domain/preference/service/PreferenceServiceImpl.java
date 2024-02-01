package com.example.domain.preference.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.preference.dao.PreferenceDAO;

@Service
public class PreferenceServiceImpl implements PreferenceService{

	@Autowired
	PreferenceDAO preferenceDAO;
	
	@Override
	public void SignupPreference(Integer memberIndex, List<Integer> checkedcCtegory) {
		preferenceDAO.SignupPreference(memberIndex, checkedcCtegory);
	}
	
	public Integer preferenceDelete(Integer memberIndex) {
		return preferenceDAO.preferenceDelete(memberIndex);
	}
	
}

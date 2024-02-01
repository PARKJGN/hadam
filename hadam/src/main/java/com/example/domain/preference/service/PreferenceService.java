package com.example.domain.preference.service;

import java.util.ArrayList;
import java.util.List;

public interface PreferenceService {

	public void SignupPreference(Integer memberIndex, List<Integer> checkedcCtegory);

	public Integer preferenceDelete(Integer memberIndex);									/* 기존 취향 삭제 */
}

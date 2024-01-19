package com.example.domain.category.service;

import java.util.ArrayList;
import java.util.List;

import com.example.domain.category.vo.CategoryVO;
import com.example.domain.location.vo.LocationVO;

public interface CategoryService {
	
	// 카테고리별 장소 목록 조회
	List<LocationVO> getCategoryLocList(CategoryVO vo);
//	회원가입시 입력한 카테고리리스트로 해당 categoryId 가져오기  [최성익]
	List<Integer> getCategoryId(List<String> checkedCategory);
}

package com.example.domain.category.service;

import java.util.List;

import com.example.domain.category.vo.CategoryVO;
import com.example.domain.location.vo.LocationVO;

public interface CategoryService {
	
	// 카테고리별 장소 목록 조회
	List<LocationVO> getCategoryLocList(CategoryVO vo);

}

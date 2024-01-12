package com.example.domain.category.service;

import java.util.List;

import com.example.domain.category.vo.CategoryVO;
import com.example.domain.location.vo.LocationVO;

public interface CategoryService {
	
	// 모든 장소 목록 출력
	List<LocationVO> locationList(LocationVO vo);
	
	// 카테고리별 장소 목록 조회
	List<LocationVO> getCategoryLocList(CategoryVO vo);
	
	// 장소 상세 조회
	LocationVO getCategoryLoc(CategoryVO vo);
	

}

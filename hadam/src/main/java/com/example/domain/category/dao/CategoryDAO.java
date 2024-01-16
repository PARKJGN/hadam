package com.example.domain.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.category.vo.CategoryVO;
import com.example.domain.images.vo.LocationImagesVO;
import com.example.domain.location.vo.LocationVO;

@Mapper
public interface CategoryDAO {
	
	// 카테고리별 장소 목록 조회
	public List<LocationVO> getCategoryLocList(CategoryVO vo);
	
}

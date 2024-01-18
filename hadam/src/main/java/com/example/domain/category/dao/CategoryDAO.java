package com.example.domain.category.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.category.vo.CategoryVO;
import com.example.domain.images.vo.LocationImagesVO;
import com.example.domain.location.vo.LocationVO;

@Mapper
public interface CategoryDAO {
	
	// 카테고리별 장소 목록 조회
	public List<LocationVO> getCategoryLocList(CategoryVO vo);
//	회원가입시 입력한 카테고리리스트로 해당 categoryId 가져오기  [최성익]
	public List<Integer> getCategoryId(@Param("list") List<String> checkedCategory);
}

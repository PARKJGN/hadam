package com.example.domain.category.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.category.dao.CategoryDAO;
import com.example.domain.category.vo.CategoryVO;
import com.example.domain.location.vo.LocationVO;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;
	

	// 카테고리별 장소 목록 조회
	@Override
	public List<LocationVO> getCategoryLocList(CategoryVO vo) {
		
		List<LocationVO> LocList = categoryDAO.getCategoryLocList(vo);
//		System.out.println("선택된 Category에 해당하는 장소 목록 조회" + LocList);
		
		// LocationVO 리스트 값을 리턴
		return LocList;
		
	}
//	회원가입시 입력한 카테고리리스트로 해당 categoryId 가져오기  [최성익]	
	public List<Integer> getCategoryId(List<String> checkedCategory){
//		System.out.println("카테고리 mapper 직전");
		return categoryDAO.getCategoryId(checkedCategory);
	}
	
}

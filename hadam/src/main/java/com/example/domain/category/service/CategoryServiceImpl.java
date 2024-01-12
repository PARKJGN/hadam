package com.example.domain.category.service;

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
	
	// 모든 장소 목록 조회
	@Override
	public List<LocationVO> locationList(LocationVO vo) {
		
		List<LocationVO> list = categoryDAO.locationList(vo);
		
		System.out.println("모든 장소 목록 조회 " + list);		//DB값 오는지만 확인용
		
		return list;
	}
	
	// 카테고리별 장소 목록 조회
	@Override
	public List<LocationVO> getCategoryLocList(CategoryVO vo) {
		
		List<LocationVO> LocList = categoryDAO.getCategoryLocList(vo);
		System.out.println("선택된 Category에 해당하는 장소 목록 조회" + LocList);
		
		// LocationVO 리스트 값을 리턴
		return LocList;
		
	}

	// 장소 상세 조회
	@Override
	public LocationVO getCategoryLoc(CategoryVO vo) {
		
		return categoryDAO.getCategoryLoc(vo);
	}
	
}

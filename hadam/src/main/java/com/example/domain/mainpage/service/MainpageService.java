package com.example.domain.mainpage.service;

import java.util.List;

import com.example.domain.location.vo.LocationVO;
import com.example.domain.mainpage.vo.LocationInfoVO;

public interface MainpageService {
	
	//메인페이지 핫한장소 정보 긁어오는 함수
	public List<LocationInfoVO> getLocationList();
	
	// 장소 검색
	public List<LocationVO> searchLoc(LocationVO vo);

}

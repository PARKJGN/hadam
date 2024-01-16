package com.example.domain.location.service;

import java.util.List;

import com.example.domain.location.vo.LocationVO;

public interface LocationService {
	
	// 모든 장소 목록 출력
	List<LocationVO> locationList(LocationVO vo);
	
	// 장소 상세 조회
	LocationVO getLocationDetail(LocationVO vo);
	

}

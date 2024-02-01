package com.example.domain.location.service;

import java.util.List;

import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;

public interface LocationService {
	
	// 모든 장소 목록 출력
	List<LocationVO> locationList();
	
	// 장소 상세 조회
	LocationVO getLocationDetail(LocationVO vo);
	
	// 장소 카테고리,지역별로 출력
	List<LocationVO> locationScheduleList(PagingVO pvo);
	
	// 찜한 장소 목록 출력
	List<LocationVO> mypageFavoritesList(List<Integer> locationIds);
	
}

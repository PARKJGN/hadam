package com.example.domain.location.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.location.dao.LocationDAO;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;

@Service
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	private LocationDAO locationDAO;
	
	
	// 모든 장소 목록 조회
	@Override
	public List<LocationVO> locationList(PagingVO vo) {

		List<LocationVO> list = locationDAO.locationList(vo);
//		System.out.println("모든 장소 목록 조회 " + list);		//DB값 오는지만 확인용
	    
	    return list;
	}

	// 장소 상세 조회
	@Override
	public LocationVO getLocationDetail(LocationVO vo) {
		
		return locationDAO.getLocationDetail(vo);
	}

	
	// 장소 카테고리,지역별로 출력
	@Override
	public List<LocationVO> locationScheduleList(PagingVO pvo) {
		
		
		pvo.setTotalCount(locationDAO.locationscheduleListSize(pvo));
		System.out.println(pvo);
		
		return locationDAO.locationscheduleList(pvo);
	}

	// 찜한 장소 목록 출력
	public List<LocationVO> mypageFavoritesList(List<Integer> locationIds){
		if(locationIds.isEmpty()) {
			return null;
		}
		return locationDAO.mypageFavoritesList(locationIds);
	}
	
}

package com.example.domain.location.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.location.dao.LocationDAO;
import com.example.domain.location.vo.LocationVO;

@Service
public class LocationServiceImpl implements LocationService{
	
	@Autowired
	private LocationDAO locationDAO;
	
	
	// 모든 장소 목록 조회
	@Override
	public List<LocationVO> locationList(LocationVO vo) {

		List<LocationVO> list = locationDAO.locationList(vo);
//		System.out.println("모든 장소 목록 조회 " + list);		//DB값 오는지만 확인용
	    
	    return list;
	}

	// 장소 상세 조회
	@Override
	public LocationVO getLocationDetail(LocationVO vo) {
		
		return locationDAO.getLocationDetail(vo);
	}

}

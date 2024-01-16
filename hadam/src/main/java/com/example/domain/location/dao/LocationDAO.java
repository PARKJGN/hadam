package com.example.domain.location.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.location.vo.LocationVO;

@Mapper
public interface LocationDAO {
	
	// 모든 장소 목록 출력
	public List<LocationVO> locationList(LocationVO vo);
	
	// 장소 상세 조회
	public LocationVO getLocationDetail(LocationVO vo);
	
}
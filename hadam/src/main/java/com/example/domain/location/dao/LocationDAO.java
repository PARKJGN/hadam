package com.example.domain.location.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;

@Mapper
public interface LocationDAO {
	
	// 모든 장소 목록 출력
	public List<LocationVO> locationList();
	
	// 장소 상세 조회
	public LocationVO getLocationDetail(LocationVO vo);
	
	public List<LocationVO> locationscheduleList(PagingVO pvo);
	
	public int locationscheduleListSize(PagingVO pvo);
	
	public List<LocationVO> mypageFavoritesList(@Param("list") List<Integer> locationIds);
	 
}

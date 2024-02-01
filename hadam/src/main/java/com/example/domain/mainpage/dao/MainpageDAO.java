package com.example.domain.mainpage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.location.vo.LocationVO;
import com.example.domain.mainpage.vo.LocationInfoVO;


@Mapper
public interface MainpageDAO {

	public List<LocationInfoVO> getLocationList();
	
	// 장소 검색
	public List<LocationVO> searchLoc(LocationVO vo);

}

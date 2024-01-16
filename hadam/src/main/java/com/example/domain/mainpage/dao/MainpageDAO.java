package com.example.domain.mainpage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.mainpage.vo.LocationInfoVO;


@Mapper
public interface MainpageDAO {

	public List<LocationInfoVO> getLocationList();

}

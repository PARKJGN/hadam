package com.example.domain.mainpage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.location.vo.LocationVO;
import com.example.domain.mainpage.dao.MainpageDAO;
import com.example.domain.mainpage.vo.LocationInfoVO;

@Service
public class MainpageServiceImpl implements MainpageService{
	
	@Autowired
	private MainpageDAO mainpageDAO;
	
	public List<LocationInfoVO> getLocationList(){
		
		List<LocationInfoVO> list = mainpageDAO.getLocationList();
		return mainpageDAO.getLocationList();
	}

	@Override
	public List<LocationVO> searchLoc(LocationVO vo) {
		
		return mainpageDAO.searchLoc(vo);
	}
	
	

}

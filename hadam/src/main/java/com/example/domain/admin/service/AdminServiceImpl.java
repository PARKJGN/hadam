package com.example.domain.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.admin.dao.AdminDAO;
import com.example.domain.admin.vo.AdminVO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public AdminVO adminSelect() {

		return adminDAO.adminSelect();
	}
	
	

}

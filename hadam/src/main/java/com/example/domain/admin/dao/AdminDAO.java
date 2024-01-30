package com.example.domain.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.admin.vo.AdminVO;

@Mapper
public interface AdminDAO {
	
	AdminVO adminSelect();

}

package com.example.domain.favorites.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.favorites.vo.FavoritesVO;

@Mapper
public interface FavoritesDAO {
	
	// 찜하기 
	public void addFavorites(FavoritesVO vo);
	// 찜 삭제 
	public void deleteFavorites(FavoritesVO vo);

	// 찜 목록 조회
	public List<FavoritesVO> listFavorites(int memberIndex);
}
 


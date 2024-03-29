package com.example.domain.favorites.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.favorites.vo.FavoritesVO;

@Mapper
public interface FavoritesDAO {
	
	// 찜 여부 확인
	public FavoritesVO getFavorites(FavoritesVO vo);
	
	// 찜하기 
	public Integer addFavorites(FavoritesVO vo);
	// 찜 삭제 
	public Integer deleteFavorites(FavoritesVO vo);

	// 찜 목록 조회
	public List<FavoritesVO> listFavorites(int memberIndex);
	
	// 찜 목록 삭제하기
	public Integer favoritesDelete(Integer locationId, Integer memberIndex);
}
 


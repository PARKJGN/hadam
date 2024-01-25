package com.example.domain.favorites.service;

import java.util.List;

import com.example.domain.favorites.vo.FavoritesVO;

public interface FavoritesService {

	// 찜 여부 확인
	FavoritesVO getFavorites(FavoritesVO vo);
	
	// 찜하기 
	Integer addFavorites(FavoritesVO vo);
 
	// 찜 삭제 
	Integer deleteFavorites(FavoritesVO vo);
	
	// 찜 목록 조회
	List<FavoritesVO> listFavorites(int memberIndex);

	// 찜 목록 삭제하기
	Integer favoritesDelete(Integer locationId, Integer memberIndex);
	
}
 
package com.example.domain.favorites.service;

import java.util.List;

import com.example.domain.favorites.vo.FavoritesVO;

public interface FavoritesService {

	// 찜하기 
	void addFavorites(FavoritesVO vo);
 
	// 찜 삭제 
	void deleteFavorites(FavoritesVO vo);
	
	// 찜 목록 조회
	List<FavoritesVO> listFavorites(int memberIndex);

}
 
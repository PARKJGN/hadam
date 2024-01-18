package com.example.domain.favorites.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;
import com.example.domain.favorites.dao.FavoritesDAO; 
import com.example.domain.favorites.vo.FavoritesVO;

@Service public class FavoritesServiceImpl implements FavoritesService {
	
	@Autowired FavoritesDAO favoritesDAO;

	// 찜하기
	@Override 
	public void addFavorites(FavoritesVO vo) {
		favoritesDAO.addFavorites(vo); 
	}

	// 찜 삭제
	@Override
	public void deleteFavorites(FavoritesVO vo) {
		favoritesDAO.deleteFavorites(vo); 	
	
	}

	// 찜 목록 조회
	@Override
	public List<FavoritesVO> listFavorites(int memberIndex) {
		
		return favoritesDAO.listFavorites(memberIndex);
	}
	

}




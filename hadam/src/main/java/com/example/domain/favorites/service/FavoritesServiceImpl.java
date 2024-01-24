package com.example.domain.favorites.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;
import com.example.domain.favorites.dao.FavoritesDAO; 
import com.example.domain.favorites.vo.FavoritesVO;

@Service public class FavoritesServiceImpl implements FavoritesService {
	
	@Autowired FavoritesDAO favoritesDAO;

	// 찜 여부 확인
	public FavoritesVO getFavorites(FavoritesVO vo) {
		
		return favoritesDAO.getFavorites(vo);
	};
	
	// 찜하기
	@Override 
	public Integer addFavorites(FavoritesVO vo) {
		Integer result = favoritesDAO.addFavorites(vo);
		
		return result;
	}

	// 찜 삭제
	@Override
	public Integer deleteFavorites(FavoritesVO vo) {
		Integer result = favoritesDAO.deleteFavorites(vo);
		
		return result;
	}

	// 찜 목록 조회
	@Override
	public List<FavoritesVO> listFavorites(int memberIndex) {
		
		return favoritesDAO.listFavorites(memberIndex);
	}
	

}




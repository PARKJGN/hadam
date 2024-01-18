package com.example.domain.favorites.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.favorites.service.FavoritesService;
import com.example.domain.favorites.vo.FavoritesVO;

@Controller
@RequestMapping("favorites") public class FavoritesController {
	
	@Autowired
	FavoritesService favoritesService;
	
	// 찜하기
	@PostMapping("/addFavorites")
	public void addFavorites(Model m, FavoritesVO vo) {
		
		favoritesService.addFavorites(vo);
		
		
	}
	
	// 찜 삭제
	@DeleteMapping("/deleteFavorites")
	public ResponseEntity<String> deleteFavorites(Model m, FavoritesVO vo) {
		
		favoritesService.deleteFavorites(vo);
		
		return ResponseEntity.ok("찜 제거");
		
	}
	
	// 찜 목록 조회
	@GetMapping("/{memberIndex}")
	public List<FavoritesVO> listFavorites(@PathVariable int memberIndex){
		
		return favoritesService.listFavorites(memberIndex);
	}
}


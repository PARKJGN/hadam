package com.example.domain.favorites.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.favorites.service.FavoritesService;
import com.example.domain.favorites.vo.FavoritesVO;

@Controller
@RequestMapping("favorites") public class FavoritesController {
	
	@Autowired
	FavoritesService favoritesService;
	
	// 찜하기
	@PostMapping("/addFavorites")
	public @ResponseBody Integer addFavorites(Model m, FavoritesVO vo) {
		
		System.out.println("아작스 찍히는지 아닌지 확인"+vo);
		
		Integer result = favoritesService.addFavorites(vo);
		
		return result;
	
	}
	
	// 찜 삭제
	@PostMapping("/deleteFavorites")
	public @ResponseBody Integer deleteFavorites(Model m, FavoritesVO vo) {
		
		Integer result = favoritesService.deleteFavorites(vo);
		return result;
	}
	
	// 찜 목록 조회
	@GetMapping("/{memberIndex}")
	public List<FavoritesVO> listFavorites(@PathVariable int memberIndex){
		
		return favoritesService.listFavorites(memberIndex);
	}
}


package com.example.domain.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.board.service.CommunityBoardService;
import com.example.domain.board.vo.BoardVO;

@Controller
@RequestMapping("community")
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/community/"+step;
		// /templates + board + xxxxx +.html
	}
	
	@RequestMapping("/boardList")
	public void boardList(BoardVO vo) {
//		communityBoardService.inserBoard(vo);
	}
	
	@RequestMapping("/boardUpdate")
	public void boardUpdate() {
		
	}
	
	@RequestMapping("/boardView")
	public void boardView() {
		
	}
	
	
	@RequestMapping("/boardWrite")
	public void boardWrite() {
		
	}
	
	@RequestMapping("/scheduleShareBoard")
	public void scheduleShareBoard() {
		
	}
	
	@RequestMapping("/scheduleShareList")
	public void scheduleShareView() {
		
	}
}

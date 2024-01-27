package com.example.domain.mainpage.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.mainpage.service.MainpageService;
import com.example.domain.mainpage.vo.LocationInfoVO;

@Controller
public class MainpageController {
	
	@Autowired
	private MainpageService  mainpageService;
	

	
	
	/*
	 * @RequestMapping("/{step}") public String viewPage(@PathVariable String step)
	 * { return ""+step; // /templates + board + xxxxx +.html }
	 */
	
	
	@GetMapping("/index")
	public void index(Model m) {
		List<LocationInfoVO> list = mainpageService .getLocationList();
		m.addAttribute("infoList",list);
	}

}

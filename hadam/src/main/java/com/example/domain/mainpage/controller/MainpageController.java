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
		// hotLocation에는 list의 0~10 인덱스까지의 요소를 할당

		List<LocationInfoVO> hotLocation = list.subList(0, Math.min(11, list.size()));

		// simiierLocation에는 list의 11~20 인덱스까지의 요소를 할당
		List<LocationInfoVO> simiierLocation = list.subList(11, Math.min(21, list.size()));

		// 20_30_pop에는 list의 21~23 인덱스까지의 요소를 할당
		List<LocationInfoVO> twentyThirtyPop = list.subList(21, Math.min(24, list.size()));
		
		m.addAttribute("infoList",hotLocation);
		m.addAttribute("simiierLocation",simiierLocation);
		m.addAttribute("twentyThirtyPop",twentyThirtyPop);

	}

}

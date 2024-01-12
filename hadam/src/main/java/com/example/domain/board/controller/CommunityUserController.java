
package com.example.domain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.board.service.CommunityUserService;

@Controller
public class CommunityUserController {
	
	@Autowired
	private CommunityUserService communityUserService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/community/"+step;
		// /templates + board + xxxxx +.html
	}
	
}

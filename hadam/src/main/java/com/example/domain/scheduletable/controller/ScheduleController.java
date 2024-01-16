package com.example.domain.scheduletable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	/*
	 * private final
	 * 
	 * @Autowired public ScheduleController() {
	 * 
	 * }
	 */
	

	@GetMapping("{path}")
	public String requestMethodName(@PathVariable String path) {
		return "schedule/"+path;
	}
	
	
	@ResponseBody
	@PostMapping("locationsearch")
	public String locationSearch(@RequestParam String locationname, @RequestParam String middlecate, @RequestParam String largecate ) {
		
		System.out.println(locationname);
		System.out.println(middlecate);
		System.out.println(largecate);
		
		return "aa";
	}
	
}

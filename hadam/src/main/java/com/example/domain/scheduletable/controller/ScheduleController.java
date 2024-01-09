package com.example.domain.scheduletable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("schedule")
public class ScheduleController {

	@GetMapping("{path}")
	public String requestMethodName(@PathVariable String path) {
		return "schedule/"+path;
	}
	
}

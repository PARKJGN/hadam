package com.example.domain.scheduletable.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.scheduletable.service.ScheduleTableService;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("schedule")
public class ScheduleController {

	 
	 private final LocationService locser;
	 private final ScheduleTableService stser;
	 
	 @Autowired
	 public ScheduleController(LocationService locser, ScheduleTableService stser) {
		 this.locser = locser;
		 this.stser = stser;
	 }
	 
	 // 경로 이동
	@GetMapping("{path}")
	public String requestMethodName(@PathVariable String path) {
		return "schedule/" + path;
	}

	// 모달창에 장소목록 불러오기
	@ResponseBody
	@PostMapping("locationsearch")
	public Map<String,Object> locationSearch(PagingVO pvo) {
		List<LocationVO> list = locser.locationScheduleList(pvo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("paging", pvo);
		return map;
	}
	
	@PostMapping("insertscheduletable")
	public String insertScheduleTable(ScheduleTableVO stvo, HttpSession session) {
		
		stvo.setMemberIndex(1); 
		stser.insertscheduletable(stvo);
		
		return "redirect:/index";
		
	}

}

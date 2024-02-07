package com.example.domain.scheduletable.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.scheduletable.service.ScheduleTableService;
import com.example.domain.scheduletable.vo.AiCreateVO;
import com.example.domain.scheduletable.vo.ScheduleTableVO;
import com.google.gson.Gson;

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
	
	@GetMapping("schedulepage")
	public String scheduleMakePage(HttpSession session, RedirectAttributes rttr) {
		
		if(session.getAttribute("memberIndex")==null || session.getAttribute("memberIndex").equals("")) {
			rttr.addFlashAttribute("scheMsg", "로그인이 필요한 서비스입니다.");
			return "redirect:/index";
		}
		
		return "/schedule/schedulepage";
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
	public String insertScheduleTable(ScheduleTableVO stvo, HttpSession session, RedirectAttributes rttr) {
		if(session.getAttribute("memberIndex")==null || session.getAttribute("memberIndex").equals("")) {
			rttr.addFlashAttribute("scheMsg", "오류가 발생했습니다. 다시 로그인해주세요.");
			return "redirect:/index";
		}
		
		stvo.setMemberIndex((Integer)session.getAttribute("memberIndex")); 
		stser.insertScheduleTable(stvo);
		
		return "redirect:/index";
		
	}
	
	@PostMapping("createaischeduletable")
	public String createScheduleTable(AiCreateVO aivo, HttpSession session, RedirectAttributes rttr) {
		
		ArrayList<String> categories = (ArrayList<String>) (aivo.getCategoryList());
		ArrayList<String> orginalCategories = (ArrayList<String>) categories.clone();
		
		Integer memberIndex = (Integer)session.getAttribute("memberIndex");
		
		List<LocationVO> list =  stser.aiCreateScheduleTable(aivo, memberIndex);
		if(list.size()==0) {
			rttr.addFlashAttribute("scheMsg", "추천 장소가 없습니다.");
			return "redirect:/index";
		}
		
		aivo.setCategoryList(orginalCategories);
		Gson jsonParser = new Gson();
		
		rttr.addFlashAttribute("locationList", jsonParser.toJson(list));
		rttr.addFlashAttribute("aiInformation",jsonParser.toJson(aivo));
		
		return "redirect:/schedule/schedulepage";
	}

}

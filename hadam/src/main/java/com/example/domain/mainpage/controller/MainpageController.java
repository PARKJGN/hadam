package com.example.domain.mainpage.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.board.vo.BoardVO;
import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.mainpage.service.MainpageService;
import com.example.domain.mainpage.vo.LocationInfoVO;

@Controller
public class MainpageController {
	
	@Autowired
	private MainpageService  mainpageService;
	@Autowired
	private LocationService locationService;

	
	
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
	
	@RequestMapping("/searchLoc")
	public String searchLoc(Model m, @RequestParam("locKeyword") String locKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page){
		
		List<LocationVO> list;
		
		// 검색 조건이 존재하면 검색 결과를 가져옴
		if (locKeyword != null) {			
			// LocationVO에 검색어 set
			LocationVO vo = new LocationVO();
			vo.setLocKeyword(locKeyword);
			
			// 장소 검색
			list = mainpageService.searchLoc(vo);				
		}
		// 검색 조건이 없으면 전체 목록을 가져옴
		else {						
			list = locationService.locationList();
		}
		
		// 자유게시판 5개씩 페이징 처리
		int pagingSize = 12;

		// 5개의 블럭만 보여준다.
		int sectorSize = 5;

		// 현재 블럭이 몇번 블럭인지
		int currentBlock = page % sectorSize == 0 ? page / sectorSize : page / sectorSize + 1;

		// 총 페이지 수
		int totalpage = list.size() % pagingSize == 0 ? list.size() / pagingSize : (list.size() / pagingSize) + 1;

		// 현재 블럭의 시작 페이지수
		int startpage = (currentBlock - 1) * sectorSize + 1;

		// 현재 블럭의 끝나는 페이지 수
		int endpage = startpage + sectorSize - 1;

		// 현재 블럭의 끝나는 페이지 수가 전체 페이지수보다 클때 끝나는 페이지 수 전체 페이지 수로 바꾸기
		if (endpage > totalpage)
			endpage = totalpage;

		List<Integer> numList = new ArrayList<Integer>();
		List<LocationVO> pagingList = new ArrayList<LocationVO>();

		int length = (page * pagingSize > list.size()) ? list.size() : page * pagingSize;

		for (int i = (page - 1) * pagingSize; i < length; i++) {
			pagingList.add(list.get(i));
		}
		if (pagingList.size() != 0) {

		} else {
		}

		int lastPage = list.size() % pagingSize > 0 ? list.size() / pagingSize + 1 : list.size() / pagingSize;

		for (int i = startpage; i <= endpage; i++) {
			numList.add(i);
		}

		m.addAttribute("locationList", pagingList);
		m.addAttribute("numList", numList);
		m.addAttribute("prevMax", page - 1 < 1 ? 1 : page - 1);
		m.addAttribute("nextMin", page + 1 > lastPage ? lastPage : page + 1);
		m.addAttribute("lastPage", lastPage);
		m.addAttribute("locKeyword", locKeyword);

		return "/location/locationList";
	}

}

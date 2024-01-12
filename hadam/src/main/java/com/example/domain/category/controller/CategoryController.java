 package com.example.domain.category.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.category.service.CategoryService;
import com.example.domain.category.vo.CategoryVO;
import com.example.domain.location.vo.LocationVO;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/category/"+step;
	}
	
	
	// 모든 장소 목록 띄우는 페이지
	
	@RequestMapping("/category")	
	public String category(Model m, LocationVO vo, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		List<LocationVO> list = categoryService.locationList(vo);
		
		int pagingSize = 9;
	    int sectorSize = 5;
	    List<Integer> numList = new ArrayList<Integer>();
	    List<LocationVO> pagingList = new ArrayList<LocationVO>();
	    int length = (page*pagingSize > list.size()) ? list.size() : page*pagingSize ;
	    for(int i=(page-1)*pagingSize; i<length ;i++) {
	    	pagingList.add(list.get(i));
	    }
	    if(pagingList.size() != 0) {
	    	System.out.println("locationList.size = "+ pagingList.size()); 
	    	
	    } else {
	    	System.out.println("locationList.size = 0 입니다");	
	    }
	    
	    int prevMax = ((page-1)/pagingSize)*pagingSize;
	    int nextMin = ((page-1)/pagingSize+1)*pagingSize+1;
	    int lastPage = list.size()%pagingSize > 0 ?  list.size()/pagingSize + 1 : list.size()/pagingSize;
	    
	    for(int i=prevMax+1;i<=prevMax+sectorSize;i++) {
	    	numList.add(i);
	    }

		System.out.println("locationList 컨트롤러 도착");
		m.addAttribute("locationList",pagingList);
		m.addAttribute("numList", numList);
        m.addAttribute("prevMax", prevMax < 1 ? 1 : prevMax);
        m.addAttribute("nextMin", nextMin > lastPage ? lastPage : nextMin);
        m.addAttribute("lastPage", lastPage);
        m.addAttribute("currentPage", page);
        
        return "/category/category";
	}
	
	// 카테고리별 장소 목록 조회
	@RequestMapping("/categoryLocList")
	public String categoryLocList(Model m, CategoryVO vo) {
		System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"+vo.getMiddleCategory());
		List<LocationVO> list = categoryService.getCategoryLocList(vo);
		System.out.println("categoryLocList 컨트롤러 도~~~~~~~~~~~착");
		m.addAttribute("categoryLocList",list);
		
		return "redirect:categoryLocList";
		
	}
	
	// 장소 상세 조회
	@RequestMapping("/categoryLoc")
	public String categoryLoc(Model m, CategoryVO vo) {
		m.addAttribute("categoryLoc", categoryService.getCategoryLoc(vo));
		
		return "redirect:getCategoryLocList";
	}

}

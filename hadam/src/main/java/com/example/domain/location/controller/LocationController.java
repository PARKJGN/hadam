 package com.example.domain.location.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.category.service.CategoryService;
import com.example.domain.category.vo.CategoryVO;
import com.example.domain.favorites.service.FavoritesService;
import com.example.domain.favorites.vo.FavoritesVO;
import com.example.domain.images.vo.LocationImagesVO;
import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.schedule.vo.PagingVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("location")
public class LocationController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private FavoritesService favoritesService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/location/"+step;
	}
	
	
	// 모든 장소 목록 띄우는 페이지
	@RequestMapping("/locationList")
	public String locationList(Model m, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
	    
	    List<LocationVO> list = locationService.locationList();
	    
	    // 장소게시판 12개씩 페이징 처리
	    int pagingSize = 12;
	    
	    // 5개의 블럭만 보여준다.
	    int sectorSize = 5;
	      
	    // 현재 블럭이 몇번 블럭인지
	    int currentBlock = page % sectorSize == 0 ? page/sectorSize : page/sectorSize +1 ;
	      
	    // 총 페이지 수
	    int totalpage = list.size() % pagingSize == 0 ? list.size()/pagingSize : (list.size()/pagingSize)+1;
	      
	    // 현재 블럭의 시작 페이지수
	    int startpage = (currentBlock -1) * sectorSize +1;
	      
	    // 현재 블럭의 끝나는 페이지 수
	    int endpage = startpage + sectorSize - 1;
	      
	    // 현재 블럭의 끝나는 페이지 수가 전체 페이지수보다 클때 끝나는 페이지 수 전체 페이지 수로 바꾸기
	    if(endpage > totalpage) endpage = totalpage;
	      
	    List<Integer> numList = new ArrayList<Integer>();
	    List<LocationVO> pagingList = new ArrayList<LocationVO>();
	    int length = (page*pagingSize > list.size()) ? list.size() : page*pagingSize ;
	    for(int i=(page-1)*pagingSize; i<length ;i++) {
	       pagingList.add(list.get(i));
	    }
	    if(pagingList.size() != 0) {
	         
	    } else {
	  

	    }
	      
	    int lastPage = list.size()%pagingSize > 0 ?  list.size()/pagingSize + 1 : list.size()/pagingSize;
	     
	    for(int i=startpage;i<=endpage;i++) {
	       numList.add(i);
	    }
	      
	      
	    m.addAttribute("locationList", pagingList);
	    m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
	      
	    return "/location/locationList";
	 }
	
	// 장소 상세 조회
	@RequestMapping(value = "/locationDetail", method = RequestMethod.GET)
	public void locationDetail(Model m, LocationVO lvo, FavoritesVO fvo, HttpSession session) {
		
		// 로그인한 회원인지 확인하기 위해 session에 저장
		Integer memberIndex = (Integer)session.getAttribute("memberIndex");
		
		LocationVO locationDetail = locationService.getLocationDetail(lvo);
		
		// 받아온 세션값을 찜목록에 있는 memberIndex에 세팅
		fvo.setMemberIndex(memberIndex);
		
		// favorites 테이블에 저장돼있는 정보(favoritesId, memberIndex, locationId) 들고오기
		FavoritesVO getFavorites = favoritesService.getFavorites(fvo);
		
		// 메뉴 정보를 파싱하여 리스트로 설정
		// 가져온 메뉴 레코드를 "/" 로 나누기
		List<String> menus 	= Arrays.asList(locationDetail.getLocationMenusName().split("/"));
		System.out.println(locationDetail.getLocationMenusName());
	    List<String> prices = Arrays.asList(locationDetail.getLocationMenusPrice().split("/"));
	    System.out.println(locationDetail.getLocationMenusPrice());
	               
		// 메뉴와 가격을 짝 지어주기
	    List<Map<String, String>> menuList = new ArrayList<>();
	    for (int i = 0; i < Math.min(menus.size(), prices.size()); i++) {
	        Map<String, String> menuInfo = new HashMap<>();
	        menuInfo.put("menuName", menus.get(i));
	        menuInfo.put("menuPrice", prices.get(i));
	        menuList.add(menuInfo);
	    }

	    m.addAttribute("favorites", getFavorites);
		m.addAttribute("locationDetail", locationDetail);
		m.addAttribute("memberIndex", memberIndex);
		// 메뉴 정보를 모델에 추가
		m.addAttribute("menuList", menuList);
		
	}
	
	
	// 카테고리별 장소 목록 조회
	@RequestMapping("/categoryLocList")
	public void categoryLocList(Model m, CategoryVO vo, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page
			, @RequestParam(name="middleCategory", required = false) String middleCategory
			, @RequestParam(name="largeCategory") String largeCategory) {
		
		// 카테고리에 해당하는 장소 리스트 출력
		List<LocationVO> list = categoryService.getCategoryLocList(vo);
		
		// 장소 12개씩 페이징 처리
	    int pagingSize = 12;
	    
	    // 5개의 블럭만 보여준다.
	    int sectorSize = 5;
	      
	    // 현재 블럭이 몇번 블럭인지
	    int currentBlock = page % sectorSize == 0 ? page/sectorSize : page/sectorSize +1 ;
	      
	    // 총 페이지 수
	    int totalpage = list.size() % pagingSize == 0 ? list.size()/pagingSize : (list.size()/pagingSize)+1;
	      
	    // 현재 블럭의 시작 페이지수
	    int startpage = (currentBlock -1) * sectorSize +1;
	      
	    // 현재 블럭의 끝나는 페이지 수
	    int endpage = startpage + sectorSize - 1;
	      
	    // 현재 블럭의 끝나는 페이지 수가 전체 페이지수보다 클때 끝나는 페이지 수 전체 페이지 수로 바꾸기
	    if(endpage > totalpage) endpage = totalpage;
	      
	    List<Integer> numList = new ArrayList<Integer>();
	    List<LocationVO> pagingList = new ArrayList<LocationVO>();
	    int length = (page*pagingSize > list.size()) ? list.size() : page*pagingSize ;
	    for(int i=(page-1)*pagingSize; i<length ;i++) {
	       pagingList.add(list.get(i));
	    }
	    if(pagingList.size() != 0) {
	         
	    } else {

	    }
	      
	    int lastPage = list.size()%pagingSize > 0 ?  list.size()/pagingSize + 1 : list.size()/pagingSize;
	     
	    for(int i=startpage;i<=endpage;i++) {
	       numList.add(i);
	    }
	      
	    m.addAttribute("largeCategory", largeCategory);
	    m.addAttribute("middleCategory", middleCategory);
	    m.addAttribute("categoryLocList", pagingList);
	    m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
		
	}
	
	
	
}


package com.example.domain.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.board.service.CommunityBoardService;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.entry.service.EntryService;
import com.example.domain.entry.vo.EntryApplicationVO;
import com.example.domain.favorites.service.FavoritesService;
import com.example.domain.favorites.vo.FavoritesVO;
import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.mypage.service.MypageService;
import com.example.domain.schedule.service.ScheduleService;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.service.ScheduleTableService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ScheduleTableService scheduleTableService;
	
	@Autowired
	private CommunityBoardService communityBoardService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		
		return "mypage/"+step ;
	}
	
	
	@RequestMapping("/mypageHeaderInfo")
	@ResponseBody
	public List<Integer> mypageHeaderInfo(HttpSession session) {
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
		return mypageService.mypageHeaderInfo(memberIndex);
	}
	
	/*비밀번호 변경하기*/
	@RequestMapping("/passwordChange")
	public String passwordChange(String password, String newPassword, HttpSession session, Model model) {
//		비밀번호 유효성 검사가 다 되어있다는 가정에서 시작
//		현재비밀번호 확인
		System.out.println(password+"/"+newPassword);
		String memberId = (String) session.getAttribute("memberId");
		String result1 = mypageService.passwordCheck(memberId, password);
		System.out.println("비밀번호 확인하는 컨트롤러 : "+result1);
//		현재 비밀번호가 맞을 때
		if(result1 != null) {
			Integer result2 = mypageService.passwordChange(memberId, newPassword);
			System.out.println("비밀번호 변경하는 컨드롤러 : "+result2);
//			비밀번호변경 성공 했을 때
			if(result2 != null){
				model.addAttribute("msg", "비밀번호 변경이 완료되었습니다.");  
				return "/mypage/mypagePassword";
			}else {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 네트워크를 확인해주세요");
				return "/mypage/mypagePassword";
			}
			
//		현재 비밀번호가 맞지 않을 때
		}else {
			model.addAttribute("msg", "현재 비밀번호를 확인해주세요");
			return "/mypage/mypagePassword";
		}
	}
	
	
	/* 전화번호 변경 홈페이지 불러올때 원래 전화번호 띄어주기 */
	@RequestMapping("/mypagePhoneNumber")
	public void mypagePhoneNumber(Model model, HttpSession session) {
//		세션에서 로그인한 회원 index 가져오기
		Integer index = (Integer) session.getAttribute("memberIndex");
//		회원 index로 전화번호 가져오기
		String memberPhoneNumber = mypageService.mypagePhoneNumber(index);
//		model 객체에 전화번호 담아서 view에 보내기
		model.addAttribute("memberPhoneNumber", memberPhoneNumber);
	}
	
	/*전화번호 변경하기*/ 
	@RequestMapping("/phoneNumberChange")
	public String phoneNumberChange(String phoneNumber, HttpSession session, Model model) {
//		세션에서 로그인한 회원 index 가져오기
		Integer index = (Integer) session.getAttribute("memberIndex");
		MemberVO vo = new MemberVO();
		vo.setMemberIndex(index);
		vo.setMemberPhoneNumber(phoneNumber);
		Integer result = mypageService.phoneNumberChange(vo);
		if(result>0) {
			model.addAttribute("msg", "전화번호 변경이 완료되었습니다");
			model.addAttribute("memberPhoneNumber", phoneNumber);
		}else {
			model.addAttribute("msg", "네트워크 문제로 실패하였습니다. 잠시 후 다시 시도해주세요");
		}

		return "/mypage/mypagePhoneNumber";
	}
	
	/*찜목록 불러오기*/
	@RequestMapping("/mypageFavorites")
	public void mypageFavorites(HttpSession session, Model model) {
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
//		로그인 사용자 찜 목록 가져오기 
		List<FavoritesVO> result = favoritesService.listFavorites(memberIndex);
//		찜목록에서 locationId만 추출
		List<Integer> lacationIds = new ArrayList<Integer>();
		for(FavoritesVO favoritesVO : result) {
			lacationIds.add(favoritesVO.getLocationId());
		}
		List<LocationVO> favoritesList = new ArrayList<LocationVO>();
		favoritesList = locationService.mypageFavoritesList(lacationIds);

		model.addAttribute("favoritesList",favoritesList);
		
	}
	
	/*찜목록 삭제하기*/
	@GetMapping("/favoritesDelete/{locationId}")
	public String favoritesDelete(@PathVariable("locationId") Integer locationId, HttpSession session) {
		System.out.println("delete controller : " + locationId);
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
		favoritesService.favoritesDelete(locationId, memberIndex);
		return "redirect:/mypage/mypageFavorites";
	}
	
	
	/*동생신청 받은 목록 불러오기*/
	@RequestMapping("/mypageEntry")
	public void mypageEntry(HttpSession session, Model model) {
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
		
		List<EntryApplicationVO> result = entryService.mypageEntry(memberIndex);
		System.out.println(result);
		
		model.addAttribute("entryList", result);
	}
	
	
	/*내 스케줄 목록 불러오기*/
	@RequestMapping("/mypageSchedule")
	public void mypageSchedule(HttpSession session, Model model) {
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
		List<ScheduleVO> result = scheduleService.mypageSchedule(memberIndex);
		
//		System.out.println(scheduleTable);
		
//		한개의 스케줄에 들어갈 장소 List 선언 
		List<ScheduleVO> schedule = new ArrayList<ScheduleVO>();
//		장소 리스트가 scheduleId기준으로 들어갈 Map 선언
		Map<Integer, List<ScheduleVO>> scheduleTable = new HashMap<Integer, List<ScheduleVO>>();

		
		
		for(int i=0; i<result.size(); i++) {
//			0번째 vo는 그냥 리스트에 넣음
			if(i>0) {
//				0번째 vo랑 다음 vo랑 tableId 같은지 확인. 다르면?
				if(result.get(i).getScheduleTableId()!=result.get(i-1).getScheduleTableId()) {
//					지금까지 모은리스트 map에 넣어
					List<ScheduleVO> temp = new ArrayList<>(schedule);
					scheduleTable.put(result.get(i-1).getScheduleTableId(), temp);
//					그리고 리스트 초기화시켜
					schedule.clear();
				}
			}
//			새로운 tableId는 초기화시킨 리스트에 넣어
			schedule.add(result.get(i));
		}
		
		// 마지막 부분에서도 map에 넣어주어야 함
		if (!schedule.isEmpty()) {
		    scheduleTable.put(result.get(result.size() - 1).getScheduleTableId(), new ArrayList<>(schedule));
		}
		
		
//		키값이 들어갈 list 선언
		List<Integer> keyList = new ArrayList<Integer>(scheduleTable.keySet());
		System.out.println(scheduleTable);
		model.addAttribute("scheduleTableMap", scheduleTable);
		model.addAttribute("keyList", keyList);
	}
	
	
	/*내 스케줄 삭제*/
	@RequestMapping(value = "/scheduleDelete", method = RequestMethod.GET)
	public String scheduleDelete(Integer scheduleTableId) {
	
		scheduleTableService.scheduleDelete(scheduleTableId);
		
		return "redirect:/mypage/mypageSchedule";
	}
	
	
	/*내 게시물 가져오기*/
	@RequestMapping("/mypageBoard")
	public void mypageBoard(HttpSession session, Model model) {
		Integer memberIndex = (Integer) session.getAttribute("memberIndex");
		List<BoardVO> result = communityBoardService.mypageBoard(memberIndex);
		model.addAttribute("boardList", result);
		System.out.println(result);
	}
	
	
	
	
	
}

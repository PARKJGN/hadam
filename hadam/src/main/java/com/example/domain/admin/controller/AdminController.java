package com.example.domain.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.admin.service.AdminService;
import com.example.domain.admin.vo.AdminVO;
import com.example.domain.board.service.CommunityBoardService;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.location.service.LocationService;
import com.example.domain.location.vo.LocationVO;
import com.example.domain.member.service.MemberService;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.report.service.ReportService;
import com.example.domain.report.vo.BoardAndCommentReportVO;
import com.example.domain.schedule.service.ScheduleService;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.service.ScheduleTableService;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

import jakarta.servlet.http.HttpSession;

import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.schedule.vo.ScheduleVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommunityBoardService boardService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private ScheduleTableService scheduleTableService;
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("/{step}")
	public String admin(@PathVariable String step) {
		return "/admin/"+step;
	}

	// ==========================================================
	
	// 대시보드
	@RequestMapping("/adminDashboard")
	public void adminDashBoard(Model m, AdminVO vo) {
		
		// 대시보드 출력용
		AdminVO dashboard = adminService.adminSelect();
		
		// 미처리 신고 5건 리스트
		List<BoardAndCommentReportVO> list = reportService.unProcessedReportList();
		
		m.addAttribute("dashboard", dashboard);
		m.addAttribute("uReportList", list);
	}
	
	// 게시글 차트 구현
	@ResponseBody
	@RequestMapping("/boardChart")
	public List<BoardVO> boardChart(BoardVO vo) {
		
		// 일주일동안 작성된 일별 게시글 수 가져오기 
		return adminService.boardChart(vo);
	}
	
	// 남녀 성비 차트 구현
	@ResponseBody
	@RequestMapping("/sexChart")
	public MemberVO sexChart(MemberVO vo) {
		
		// 남성, 여성 회원 수 가져오기
		return adminService.sexChart(vo);
	}
	
	// 스케줄별 선호 카테고리 차트
	@ResponseBody
	@RequestMapping("/cateChart")
	public List<ScheduleVO> cateChart(ScheduleVO vo) {
		
		// 스케줄 작성 시 선택한 소분류에 해당하는 장소 수 가져오기
		return adminService.cateChart(vo);
	}
	
	// 미확인 신고 건
	@RequestMapping("/uneadReportList")
	public void unProcessedReportList(Model m) {
		
		// 신고 리스트 출력
		List<BoardAndCommentReportVO> list = reportService.unProcessedReportList();
		
		m.addAttribute("uReportList", list);
	}
	
	// ==========================================================
	
	// 계정 관리
	@RequestMapping("/adminAccountManagement")
	public void adminAccountManagement(Model m, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
		
		// 전체 회원 정보 불러오는 리스트		
		List<MemberVO> list = memberService.allMemberList();
		
		 // 게시판 12개씩 페이징 처리
	    int pagingSize = 15;
	    
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
	    List<MemberVO> pagingList = new ArrayList<MemberVO>();
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
	    
		m.addAttribute("memberList",pagingList);
		m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
	}
	
	// 계정 정보 조회
	@ResponseBody
	@RequestMapping("/getAccountInfo")
	public MemberVO getAccountInfo(String memberId) {
		
		MemberVO account = memberService.getAccountInfo(memberId);
		return account;
	}

	// 계정에서 작성한 게시글 조회
	@ResponseBody
	@RequestMapping("/getAccountBoardList")
	public List<BoardVO> getAccountBoardList(Integer memberIndex) {
		List<BoardVO> list = boardService.getAccountBoardList(memberIndex);
		return list;
	}
	
	// 계정에서 작성한 댓글 조회
	@ResponseBody
	@RequestMapping("/getAccountCommentList")
	public List<CommentVO> getAccountCommentList(Integer memberIndex){
		List<CommentVO> list = boardService.getAccountCommentList(memberIndex);
		return list;
	}
		
	
	// 계정 정보 수정
	@ResponseBody
	@RequestMapping("/adminAccountU")
	public Integer adminAccountU(MemberVO vo, String modifyAccountNickname 
		,Boolean modifyAccountAdminStatus, String modifyAccountStatus) {
		
		// 관리자가 수정할 닉네임, 계정 권한, 계정 상태
		vo.setMemberNickname(modifyAccountNickname);
		vo.setAdminStatus(modifyAccountAdminStatus);
		vo.setMemberStatus(modifyAccountStatus);
		
		Integer updateA = memberService.accountU(vo);
		
		System.out.println("cccccccccc" + updateA);
		return updateA;
	}
	
	// ==========================================================
	
	// 장소 관리
	@RequestMapping("/adminLocationManagement")
	public void adminLocationManagement(Model m, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
		
		List<LocationVO> list = locationService.locationList();
		
		// 게시판 12개씩 페이징 처리
	    int pagingSize = 15;
	    
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
	    
		m.addAttribute("aLocationList",pagingList);
		m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
		
	}

	
	// ==========================================================
	
	// 게시판 관리
	@RequestMapping("/adminBoardManagement")
	public void adminBoardManagement(Model m, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
		
		// 게시글 목록 출력
		List<BoardVO> list = boardService.getBoardList();
		
		// 게시판 12개씩 페이징 처리
	    int pagingSize = 15;
	    
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
	    List<BoardVO> pagingList = new ArrayList<BoardVO>();
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
	    
		m.addAttribute("boardList",pagingList);
		m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
	    
	}
	
	// 자유게시글 모달창용
	@RequestMapping("/boardViewModal")
	public void boardView(@RequestParam("boardId") int boardId, Model m) {
		
		
		// 해당 게시글 댓글 개수
		CommentVO count = boardService.commentCount(boardId);
		
		// 해당게시글 정보 출력
		BoardVO data = boardService.findByboardId(boardId);

		// 상세페이지 댓글 목록 출력
		List<CommentVO> list = boardService.commentList(boardId);
		
		m.addAttribute("commentList", list);
		m.addAttribute("board", data);
		m.addAttribute("commentCount", count);
	}
	
	// 게시글 삭제
	@RequestMapping("/adminBoardD")
	public void adminBoardD(BoardVO vo) {
		
		boardService.boardD(vo);
	}
	
	// ==========================================================
	
	// 스케줄 공유 게시판 관리
//	@RequestMapping("/adminScheduleTableManagement")
//	public void adminScheduleTableManagement(Model m, @RequestParam(
//			value = "page", required = false, defaultValue = "1") int page) {
//		
//		List<BoardVO> list = boardService.getSTShareList();
//		
//		// 게시판 12개씩 페이징 처리
//	    int pagingSize = 15;
//	    
//	    // 5개의 블럭만 보여준다.
//	    int sectorSize = 5;
//	      
//	    // 현재 블럭이 몇번 블럭인지
//	    int currentBlock = page % sectorSize == 0 ? page/sectorSize : page/sectorSize +1 ;
//	      
//	    // 총 페이지 수
//	    int totalpage = list.size() % pagingSize == 0 ? list.size()/pagingSize : (list.size()/pagingSize)+1;
//	      
//	    // 현재 블럭의 시작 페이지수
//	    int startpage = (currentBlock -1) * sectorSize +1;
//	      
//	    // 현재 블럭의 끝나는 페이지 수
//	    int endpage = startpage + sectorSize - 1;
//	      
//	    // 현재 블럭의 끝나는 페이지 수가 전체 페이지수보다 클때 끝나는 페이지 수 전체 페이지 수로 바꾸기
//	    if(endpage > totalpage) endpage = totalpage;
//	      
//	    List<Integer> numList = new ArrayList<Integer>();
//	    List<BoardVO> pagingList = new ArrayList<BoardVO>();
//	    int length = (page*pagingSize > list.size()) ? list.size() : page*pagingSize ;
//	    for(int i=(page-1)*pagingSize; i<length ;i++) {
//	       pagingList.add(list.get(i));
//	    }
//	    if(pagingList.size() != 0) {
//	         
//	    } else {
//	  
//	    }
//	      
//	    int lastPage = list.size()%pagingSize > 0 ?  list.size()/pagingSize + 1 : list.size()/pagingSize;
//	     
//	    for(int i=startpage;i<=endpage;i++) {
//	       numList.add(i);
//	    }
//	    
//		m.addAttribute("sTableList",pagingList);
//		m.addAttribute("numList", numList);
//	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
//	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
//	    m.addAttribute("lastPage", lastPage);
//	    
//	}
	
	// 스케줄 공유 게시판 관리
	@RequestMapping("/adminScheduleTableManagement/{id}")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public String adminScheduleTableManagement(@PathVariable(name="id") Integer id,Model m, MemberVO mvo, HttpSession session, BoardVO vo) {
		
		// PagingVO에 pageNum, pageSize 놓기
		PagingVO pvo = new PagingVO();
		pvo.setPageNum(id);
		pvo.setPageSize(4);
		
		// 스케줄테이블vo에서 보드테이블에 작성한 조회
		List<ScheduleTableVO> getScheduleTableBoardList = scheduleTableService.getScheduleTableBoardList(pvo);
		System.out.println(getScheduleTableBoardList);
		
		// 스케줄vo에서 보드테이블에 작성한 리스트 조회
		List<ScheduleVO> getScheduleBoardList = scheduleService.getScheduleBoardList(getScheduleTableBoardList);

		Map<ScheduleTableVO, List<ScheduleVO>> map = new HashMap<ScheduleTableVO, List<ScheduleVO>>();

		// 스케줄 참가하기 모달창-> boardId, memberIndex, scheduleTableId 가져오기

		// getScheduleTableBoardList에서 scheduleTableId를 얻어서 map에 추가
		for (ScheduleTableVO scheduleTable : getScheduleTableBoardList) {
			int scheduleTableId = scheduleTable.getScheduleTableId();

			// 해당 scheduleTableId에 대응하는 ScheduleVO 리스트 찾기
			List<ScheduleVO> schedules = new ArrayList<>();
			for (ScheduleVO schedule : getScheduleBoardList) {
				if (schedule.getScheduleTableId() == scheduleTableId) {
					schedules.add(schedule);
				}
			}

			map.put(scheduleTable, schedules);
		}
		
		m.addAttribute("pvo",pvo);
		m.addAttribute("map", map);

		return "/admin/adminScheduleTableManagement";
	}
	
	
	// ==========================================================
	
	// 신고 관리
	@RequestMapping("/adminReportManagement")
	public void adminReportManagement(Model m, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
		
		// 신고 리스트 출력
		List<BoardAndCommentReportVO> list = reportService.reportList();
		
		// 게시판 12개씩 페이징 처리
	    int pagingSize = 15;
	    
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
	    List<BoardAndCommentReportVO> pagingList = new ArrayList<BoardAndCommentReportVO>();
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
	    
		m.addAttribute("reportList",pagingList);
		m.addAttribute("numList", numList);
	    m.addAttribute("prevMax", page-1 < 1 ? 1 : page-1);
	    m.addAttribute("nextMin", page+1 > lastPage ? lastPage : page+1);
	    m.addAttribute("lastPage", lastPage);
		
	}
	
	// 회원 정지
	@ResponseBody
	@RequestMapping("/memberSuspend")
	public Integer memberSuspend(BoardAndCommentReportVO vo) {
		// 계정 상태를 정지로 바꾸고 성공 시 int값을 리턴
		Integer suspendM = reportService.suspendMember(vo);
		return suspendM;
	}
	
	// 정지 해제
	@ResponseBody
	@RequestMapping("/memberRelease")
	public Integer memberRelease(BoardAndCommentReportVO vo) {
		// 계정 상태를 정상으로 바꾸고 성공 시 int값을 리턴
		Integer releaseM = reportService.releaseMember(vo);
		return releaseM;
	}
	
	// ==========================================================

}

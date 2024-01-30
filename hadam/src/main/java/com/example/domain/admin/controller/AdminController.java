package com.example.domain.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.domain.schedule.vo.PagingVO;

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
	
	@RequestMapping("/{step}")
	public String admin(@PathVariable String step) {
		return "/admin/"+step;
	}

	// ==========================================================
	
	// 대시보드
	@RequestMapping("/adminDashboard")
	public void adminDashBoard(Model m, AdminVO vo) {
		
		AdminVO dashboard = adminService.adminSelect();
		
		m.addAttribute("dashboard", dashboard);
	}
	
	
	// ==========================================================
	
	// 계정 관리
	@RequestMapping("/adminAccountManagement")
	public void adminAccountManagement(Model m) {
		
		List<MemberVO> list = memberService.allMemberList();
		
		m.addAttribute("memberList",list);
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
		
		vo.setMemberNickname(modifyAccountNickname);
		vo.setAdminStatus(modifyAccountAdminStatus);
		vo.setMemberStatus(modifyAccountStatus);
		
		Integer updateA = memberService.accountU(vo);
		
		System.out.println("cccccccccc" + updateA);
		return updateA;
	}
	
	// 계정 삭제
	@RequestMapping("/adminAccountD")
	public void adminAccountD(MemberVO vo) {
		
		memberService.accountD(vo);
	}
	
	// ==========================================================
	
	// 장소 관리
	@RequestMapping("/adminLocationManagement")
	public Map<String,Object> adminLocationManagement(Model m, PagingVO vo, @RequestParam(
			value = "page", required = false, defaultValue = "1") int page) {
		
		List<LocationVO> list = locationService.locationList(vo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("paging", vo);
		return map;
	}

	
	// ==========================================================
	
	// 게시판 관리
	@RequestMapping("/adminBoardManagement")
	public void adminBoardManagement(Model m) {
		
		List<BoardVO> list = boardService.getBoardList();
		m.addAttribute("boardList",list);
	}
	
	// 게시글 삭제
	@RequestMapping("/adminBoardD")
	public void adminBoardD(BoardVO vo) {
		
		boardService.boardD(vo);
	}
	
	// ==========================================================
	
	// 스케줄 공유 게시판 관리
	@RequestMapping("/adminScheduleTableManagement")
	public void adminScheduleTableManagement(Model m) {
		
		List<BoardVO> list = boardService.getScheduleTableShareList();
		m.addAttribute("scheduleTableList",list);
	}
	
	// ==========================================================
	
	// 신고 관리
	@RequestMapping("/adminReportManagement")
	public void adminReportManagement(Model m) {
		
		// 신고 리스트 출력
		List<BoardAndCommentReportVO> list = reportService.reportSelect();
		
		m.addAttribute("reportList", list);
	}
	
	// 회원 정지
	@ResponseBody
	@RequestMapping("/memberSuspend")
	public Integer memberSuspend(BoardAndCommentReportVO vo) {
		System.out.println("컨트롤러 들어오는지 확인"+vo);
		Integer suspendM = reportService.suspendMember(vo);
		System.out.println("컨트롤러 들어오는 값 ㅇ확인"+vo);
		return suspendM;
	}
	
	// 정지 해제
	@ResponseBody
	@RequestMapping("/memberRelease")
	public Integer memberRelease(BoardAndCommentReportVO vo) {
		System.out.println("컨트롤러 들어오는지 확인"+vo);
		Integer releaseM = reportService.releaseMember(vo);
		System.out.println("컨트롤러 들어오는 값 ㅇ확인"+vo);
		return releaseM;
	}
	
	// ==========================================================

}

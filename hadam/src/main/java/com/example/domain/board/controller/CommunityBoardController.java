package com.example.domain.board.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.board.service.CommunityBoardService;

import com.example.domain.board.util.MD5Generator;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.chat.chatjoin.vo.ChatRoomJoinVO;
import com.example.domain.chat.service.ChatService;
import com.example.domain.chat.vo.ChatRoomVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.entry.service.EntryService;
import com.example.domain.entry.vo.EntryApplicationVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.mainpage.service.NotificationService;
import com.example.domain.member.service.MemberService;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;
import com.example.domain.schedule.service.ScheduleService;
import com.example.domain.schedule.vo.PagingVO;
import com.example.domain.schedule.vo.ScheduleVO;
import com.example.domain.scheduletable.service.ScheduleTableService;
import com.example.domain.scheduletable.vo.ScheduleTableVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("community")
public class CommunityBoardController {

	@Autowired
	private CommunityBoardService communityBoardService;

	@Autowired
	private ScheduleTableService scheduleTableService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private EntryService entryService;

	@Autowired
	private ChatService chatService;

	/* 게시물 작성자에게 알림을 보내기위한 service -건일 */
	@Autowired
	private NotificationService notificationService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/community/" + step;
		// /templates + board + xxxxx +.html
	}

	// 수정 버튼 클릭시 나오는 페이지 (페이지에 해당게시글 정보, 첨부한 사진 출력)
	@RequestMapping("/boardUpdate")
	public void boardUpdate(@RequestParam("boardId") int boardId, Model m) {
		// 해당게시글 정보,첨부한 사진 출력
		BoardVO result = communityBoardService.findByboardId(boardId);
		m.addAttribute("board", result);
	}

	// 자유게시판 상세 페이지 (해당게시글 정보, 첨부한 사진 출력)
	@RequestMapping("/boardView")
	public void boardView(@RequestParam("boardId") int boardId, Model m, MemberVO mvo, BoardVO vo) {

		// 해당 게시글 상세페이지 클릭시 조회수 처리
		communityBoardService.boardHits(boardId);

		// 해당 게시글 댓글 개수
		CommentVO count = communityBoardService.commentCount(boardId);

		// 해당게시글 정보, 첨부한 사진 출력
		BoardVO data = communityBoardService.findByboardId(boardId);

		// 해당게시글을 올린 사용자의 프로필사진 출력
		vo.setMemberIndex(data.getMemberIndex());
		BoardVO profile = communityBoardService.findProfileByBoardId(vo);

		// 상세페이지 댓글 목록 출력
		List<CommentVO> list = communityBoardService.commentList(boardId);

		// 각 댓글의 회원 이미지 정보 가져오기
		List<MemberUploadImagesVO> memberImages = new ArrayList<>();
		for (CommentVO comment : list) {
			MemberUploadImagesVO memberImage = communityBoardService
					.getMemberImageByMemberIndex(comment.getMemberIndex());
			memberImages.add(memberImage);
		}

		// 해당게시글 댓글 신고 시 ajax 데이터에 commentId 추가
		CommentVO commentId = communityBoardService.selectCommentId(boardId);

		m.addAttribute("commentId", commentId);
		m.addAttribute("commentList", list);
		m.addAttribute("board", data);
		// 알림때문에 추가됬습니다. -건일
		m.addAttribute("boardMemberIndex", mvo);
		m.addAttribute("commentCount", count);
		m.addAttribute("profile", profile);
		m.addAttribute("memberImages", memberImages);

	}

	// 게시글,파일 정보 수정하기
	@RequestMapping("/updateBoard")
	public String updateBoard(@RequestParam("file") MultipartFile file, BoardVO vo) {

		try {

			// 파일이 있을 경우에만 처리
			if (!file.isEmpty()) {
				String originFilename = file.getOriginalFilename();
				String filename = new MD5Generator(originFilename).toString();
				
				// 게시글 작성할 때 파일 첨부시 이미지가 저장될 경로
				String savePath = System.getProperty("user.dir") + "/src/main/resources/static/communityBoardFile";
				
				// 경로가 저장되있지않으면 새로 만들기
				if (!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}
				
				// 파일 이미지 경로
				String filepath = savePath + "/" + filename;
				
				// 파일 저장
				file.transferTo(new File(filepath)); 

				// 기존에 첨부된 파일이 있다면 삭제
				if (vo.getMemberUploadImageName() != null && !vo.getMemberUploadImageName().isEmpty()) {
					String existingFilePath = vo.getMemberUploadImagePath() + "/" + vo.getMemberUploadImageName();
					Files.deleteIfExists(Paths.get(existingFilePath));
				}

				// 업로드된 파일 정보로 MemberUploadImagesVO 객체 생성
				MemberUploadImagesVO fvo = new MemberUploadImagesVO();
				fvo.setMemberUploadImageOriginalname(originFilename);
				fvo.setMemberUploadImageName(filename);
				fvo.setMemberUploadImagePath(filepath);

				// 게시글 정보와 새로 업로드된 파일 정보를 함께 수정
				communityBoardService.updateBoardAndFile(vo, fvo);

			} else {

				// 파일이 업로드되지 않은 경우는 게시글 정보만 수정
				communityBoardService.updateBoard(vo);
			}
		} catch (Exception e) {
			System.out.println("파일 업로드 및 게시글 수정 실패:" + e.getMessage());
		}
		// 수정 후 해당 게시글 boardId와, 게시글을 올린 사용자의 memberIndex를 가지고 게시글 상세 페이지로이동 
		return "redirect:boardView?boardId=" + vo.getBoardId() + "&memberIndex=" + vo.getMemberIndex();
	}

	// 게시글 , 파일첨부 삭제
	@RequestMapping("/boardDelete")
	public String deleteBoard(@RequestParam("boardId") int boardId) {

		// 해당 게시글 댓글 신고정보 삭제
		communityBoardService.deleteCommentReport(boardId);

		// 해당 게시글 댓글정보 삭제
		communityBoardService.deleteComment(boardId);

		// 해당 게시판 삭제
		communityBoardService.deleteBoard(boardId);

		return "redirect:boardList";
	}

	// 글 작성 , 파일첨부 페이지
	@RequestMapping("/saveBoard")
	public String saveBoard(@RequestParam("file") MultipartFile file, BoardVO vo, HttpSession session) {

		String originFilename = file.getOriginalFilename();
		System.out.println("originFilename:" + originFilename);

		// 파일첨부가 있는 경우
		if (originFilename != null && !originFilename.equals("")) {

			try {
				// MD5Generator import경로 : board/util/MD5Generator.java
				String filename = new MD5Generator(originFilename).toString();
				System.out.println("filename=" + filename);

				// 파일 경로 설정
				String savePath = System.getProperty("user.dir") + "/src/main/resources/static/communityBoardFile";
				if (!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}

				String filepath = savePath + "\\" + filename;
				file.transferTo(new File(filepath)); // 파일저장

				// MemberUploadImagesVO에 파일첨부정보 놓기
				MemberUploadImagesVO fvo = new MemberUploadImagesVO();
				fvo.setMemberUploadImageOriginalname(originFilename);
				fvo.setMemberUploadImageName(filename);
				fvo.setMemberUploadImagePath(filepath);
				fvo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

				// 게시글 및 파일첨부 저장시 session값 처리
				vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

				// 게시글 및 파일첨부 저장
				communityBoardService.saveBoard(vo, fvo);

			} catch (Exception e) {
				System.out.println("파일 업로드 실패:" + e.getMessage());
			}
		} else {

			// 게시글 저장시 session값 처리
			vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));
			communityBoardService.saveBoard(vo, null);
		}

		return "redirect:boardList";
	}

	// 커뮤니티 상세페이지 댓글 신고
	@RequestMapping("/commentReportSave")
	public @ResponseBody List<BoardAndCommentReportVO> commentReportSave(BoardAndCommentReportVO vo, CommentVO cvo) {

		// 해당 게시글의 댓글 신고시 신고테이블에 insert
		communityBoardService.commentReportSave(vo);

		// 댓글이 신고된 리스트 출력
		List<BoardAndCommentReportVO> list = communityBoardService.reportList(cvo.getCommentId());

		return list;
	}

	// 자유게시판 목록 조회
	@RequestMapping("/boardList")
	public String getboardList(Model m, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		List<BoardVO> list = communityBoardService.getBoardList();
		// 자유게시판 5개씩 페이징 처리
		int pagingSize = 10;

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
		List<BoardVO> pagingList = new ArrayList<BoardVO>();

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

		m.addAttribute("boardList", pagingList);
		m.addAttribute("numList", numList);
		m.addAttribute("prevMax", page - 1 < 1 ? 1 : page - 1);
		m.addAttribute("nextMin", page + 1 > lastPage ? lastPage : page + 1);
		m.addAttribute("lastPage", lastPage);

		return "/community/boardList";
	}

	// boardList 검색
	@RequestMapping("/searchBoards")
	public String searchBoards(Model m, @RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		List<BoardVO> list;

		// 검색 조건이 존재하면 검색 결과를 가져옴
		if (searchType != null && keyword != null) {
			// BoardVO에 검색어, 검색유형 set
			BoardVO vo = new BoardVO();
			vo.setSearchType(searchType);
			vo.setKeyword(keyword);

			// 자유게시판 검색
			list = communityBoardService.searchBoards(vo);
		}

		// 검색 조건이 없으면 전체 목록을 가져옴
		else {
			list = communityBoardService.getBoardList();
		}

		// 자유게시판 5개씩 페이징 처리
		int pagingSize = 10;

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
		List<BoardVO> pagingList = new ArrayList<BoardVO>();

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

		m.addAttribute("boardList", pagingList);
		m.addAttribute("numList", numList);
		m.addAttribute("prevMax", page - 1 < 1 ? 1 : page - 1);
		m.addAttribute("nextMin", page + 1 > lastPage ? lastPage : page + 1);
		m.addAttribute("lastPage", lastPage);
		m.addAttribute("searchType", searchType);
		m.addAttribute("keyword", keyword);

		return "/community/boardList";
	}

	// 커뮤니티 상세페이지에서 댓글 작성 (ajax) save
	@RequestMapping("/commentSave")
	public @ResponseBody List<CommentVO> commentSave(CommentVO vo, Model m, HttpSession session) {

		// 알림기능 넣을려고 게시물등록자의 memberindex를 받아오기 위해 확인하려고 쓴코드입니다. - 건일
		// 댓글을 달았을 때 댓글 주인memberindex를 Long으로 바꿔주는 코드. - 건일
		long id = (long) vo.getMemberIndex();

		// 댓글을 달았을 때 댓글 주인에게 알림이 가게하는 함수. - 건일
		notificationService.notify(id, vo.getBoardId()+"/"+"새로운 댓글이 달렸습니다.");
				
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));
		communityBoardService.commentSave(vo);
		// 해당 게시글에 작성한 댓글 리스트 가져오기
		List<CommentVO> list = communityBoardService.commentList(vo.getBoardId());

		return list;
	}

	// 스케줄 공유 작성 페이지
	@RequestMapping("scheduleShareWrite")
	public void scheduleShareWrite(Model m, ScheduleTableVO svo, HttpSession session) {

		// session 값 저장
		svo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

		// 로그인한 사용자가 불러온 스케줄표 리스트 출력
		List<ScheduleTableVO> scheduleTableList = scheduleTableService.getScheduleTableList(svo);

		m.addAttribute("scheduleTableList", scheduleTableList);
	}

	// 스케줄 작성페이지 -> 스케줄 불러오기
	@RequestMapping("/scheduleSelect")
	public @ResponseBody List<ScheduleTableVO> scheduleSelect(ScheduleTableVO vo, HttpSession session) {

		// memberIndex session값 처리
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

		// 로그인한 사용자가 만든 스케줄테이블 목록 가져오기
		List<ScheduleTableVO> schedule = scheduleTableService.getScheduleTable(vo);

		return schedule;
	}

	// 스케줄 작성
	@RequestMapping("/scheduleTableSave")
	public String scheduleTableSave(BoardVO vo, ScheduleTableVO svo, HttpSession session, ChatRoomVO cvo,
			ChatRoomJoinVO cjvo) {
		
 
		
		// memberIndex session값 저장
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));
		cjvo.setMemberIndex((Integer) session.getAttribute("memberIndex"));
		//채팅창 이름을 스케줄 이름울 주기위해서 set해줌 -건일
		cjvo.setChatRoomName(svo.getScheduleTableName());
		
		// chat_room_join 테이블의 chat_room_id 지정하기
		// 스케줄 작성시 chat_room 최대인원수, insert 스케줄상태 공유중으로 update
		communityBoardService.scheduleTableSave(vo, cvo, svo, cjvo);

		return "redirect:scheduleShareList/1";
	}

	// 공유 스케줄 리스트
	@RequestMapping("/scheduleShareList/{id}")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public String scheduleShareList(@PathVariable(name = "id") Integer id, Model m, MemberVO mvo, HttpSession session,
			BoardVO vo) {

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

		m.addAttribute("pvo", pvo);
		m.addAttribute("map", map);

		return "/community/scheduleShareList";
	}

	// 스케줄게시판 검색
	@RequestMapping("/searchScheduleBoards/{id}")
	public String searchScheduleBoards(Model m, @RequestParam("searchType") String searchType,
			@PathVariable(name = "id") Integer id) {

		// 검색유형이 없을 경우
		if (searchType != null) {

			// BoardVO에 pageNum, pagesize, searchType 놓기
			BoardVO vo = new BoardVO();
			vo.setPageNum(id);
			vo.setPageSize(4);
			vo.setSearchType(searchType);
			System.out.println("vovovovo" + vo);
			// 스케줄공유게시판 검색
			List<ScheduleTableVO> getScheduleTableBoardList = scheduleTableService.searchScheduleBoards(vo);

			// 스케줄VO에서 board테이블에 작성한 리스트 출력
			List<ScheduleVO> getScheduleBoardList = scheduleService.getScheduleBoardList(getScheduleTableBoardList);

			Map<ScheduleTableVO, List<ScheduleVO>> map = new HashMap<ScheduleTableVO, List<ScheduleVO>>();

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

			m.addAttribute("pvo", vo);
			m.addAttribute("map", map);
		}

		return "/community/scheduleShareList";
	}

	// 스케줄 상세 모달
	@RequestMapping("/scheduleShareDetail")
	public @ResponseBody Map<String, List<ScheduleTableVO>> getScheduleShareDetail(@RequestParam("boardId") Integer boardId,
		HttpSession session, EntryApplicationVO evo) {

		// 해당게시글에 해당하는 정보 출력
		List<ScheduleTableVO> list = scheduleTableService.getScheduleDataByBoardId(boardId);
		
		// 해당게시글의 주인 프로필 사진 출력
		MemberUploadImagesVO profile = communityBoardService.getMemberImageByMemberIndex(list.get(0).getMemberIndex());
		
		

		Map<String, List<ScheduleTableVO>> map = new HashMap<String, List<ScheduleTableVO>>();
		
		map.put(profile.getMemberUploadImageName(), list);
		
		return map;
	}

	// 스케줄 참가신청 확인
	@RequestMapping("/checkEntry")
	public @ResponseBody EntryApplicationVO checkEntry(HttpSession session, EntryApplicationVO vo,
			@RequestParam("boardId") Integer boardId) {

		// EntryApplicationVO에 session값, boardId 놓기
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));
		vo.setBoardId(boardId);

		// 참가자 명단 확인(EntryApplicationVO에 memberIndex로 확인)
		EntryApplicationVO result = entryService.checkEntry(vo);

		return result;
	}

	// 참가자 최대인원 확인
	@RequestMapping("/checkChatRoomMax")
	public @ResponseBody List<ChatRoomVO> checkChatRoomMax(ChatRoomVO vo, @RequestParam("boardId") Integer boardId) {

		// ChatRoomVO에 boardId 놓기
		vo.setBoardId(boardId);

		// 참가자 최대인원 확인
		List<ChatRoomVO> result = chatService.checkChatRoomMax(vo);

		return result;
	}

	// 스케줄 공유 게시판 모달 상세페이지 댓글 작성
	@RequestMapping("/scheduleCommentWrite")
	public @ResponseBody List<CommentVO> scheduleCommentWrite(CommentVO vo, Model m, HttpSession session) {

		// CommentVO vo에 session값 놓기
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

		// 스케줄 공유상세 모달창 댓글 작성
		communityBoardService.scheduleCommentWrite(vo);

		// 모달창에 작성한 댓글 리스트 출력
		List<CommentVO> list = communityBoardService.scheduleCommentList(vo.getBoardId());
		
		return list;
	}

	// 스케줄 공유 상세페이지 댓글 목록 출력
	@RequestMapping("/getScheduleCommentList")
	public @ResponseBody  List<CommentVO> getScheduleCommentList(CommentVO vo) {

		// 해당게시글 댓글 목록 출력
		List<CommentVO> list = communityBoardService.scheduleCommentList(vo.getBoardId());
		
		return list;
	}

	// 스케줄 공유게시판 수정 페이지
	@RequestMapping("/scheduleShareUpdate")
	public void scheduleShareMyWrite(@RequestParam("boardId") Integer boardId, Model m, ScheduleTableVO svo,
			HttpSession session) {

		// session값 얻어오기
		svo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

		// 내 스케줄 불러오기
		List<ScheduleTableVO> scheduleTableList = scheduleTableService.getScheduleTableList(svo);

		// 수정할 스케줄 boardId 가져오기
		ScheduleTableVO result = scheduleTableService.getBoardIdByScheduleTable(boardId);

		m.addAttribute("scheduleTableList", scheduleTableList);
		m.addAttribute("schedule", result);
	}

	// 게시판 수정
	@RequestMapping("/scheduleTableUpdate")
	public String scheduleTableUpdate(@RequestParam("boardId") int boardId, BoardVO vo, ScheduleTableVO svo) {

		// BoardVO에 해당 게시글 boardId 놓기
		vo.setBoardId(boardId);

		// 글 수정시 기존에 게시판에 올린 글 대기로 바꾸기
		scheduleTableService.updateScheduleTableStatusToWait(vo);

		// ScheduleTableVO의 id 가져오기
		communityBoardService.scheduleTableUpdate(vo);

		// chatRoomTable 참가인원수 update
		chatService.updateChatRoomMax(vo);

		// 글 수정시 schedule 공유중으로 바꾸기
		scheduleTableService.updateScheduleTableStatus(svo);

		return "redirect:scheduleShareList/1";
	}

	// 스케줄 공유 게시판 삭제
	@RequestMapping("/scheduleShareDelete")
	public String scheduleShareDelete(@RequestParam("boardId") Integer boardId, BoardVO vo) {

		// BoardVO에 해당 게시글 boardId 놓기
		vo.setBoardId(boardId);

		// 글 삭제시 기존에 게시판에 올린 글 대기로 바꾸기
		scheduleTableService.updateScheduleTableStatusToWait(vo);
		// 참가신청명단 삭제
		entryService.deleteEntry(boardId);

		// chatRoomJoin 인원 삭제
		chatService.deleteChatRoomJoin(boardId);

		// 참가인원 삭제
		chatService.deleteChatRoom(boardId);

		// 공유게시판 댓글 삭제
		communityBoardService.deleteComment(boardId);

		// 공유게시판삭제
		communityBoardService.deleteBoard(boardId);

		return "redirect:scheduleShareList/1";
	}

	// 스케줄 참가하기
	@RequestMapping("/scheduleAttendWrite")
	public String scheduleAttendWrite(ChatRoomVO cvo, EntryApplicationVO vo, @RequestParam("boardId") Integer boardId,
			HttpSession session) {

		// [알림] - 건일
		// 코드 구조상 EntryApplicationVO에 ScheduleShareList주인의 memberidx를 담아왔습니다. 참고해주세요.
		// 댓글을 달았을 때 댓글 주인memberindex를 Long으로 바꿔주는 코드. - 건일
		long id = (long) vo.getMemberIndex();
		// 참가신청을 했을 때 게시글 주인에게 알림이 가게하는 함수. - 건일
		notificationService.notify(id, "스케줄 공유 게시판에/새로운 참가 신청이 들어왔습니다.");
		//end of [알림] - 건일
		
		// EntryApplicationVO에 memberIndex값 session으로 설정
		vo.setMemberIndex((Integer) session.getAttribute("memberIndex"));

		// EntryApplicationVO에 참가하려는 게시글의 boardId 놓기
		vo.setBoardId(boardId);

		// entry테이블에 저장
		entryService.scheduleAttendSave(vo);

		return "redirect:scheduleShareList/1";
	}

	// 스케줄 상세 모달창 댓글 삭제
	@RequestMapping("/deleteScheduleComment")
	public String deleteComment(@RequestParam("boardId") Integer boardId) {

		// 해당게시글 댓글 삭제
		communityBoardService.deleteComment(boardId);

		return "redirect:scheduleShareList/1";

	}

	// 스케줄 참가하기 버튼 클릭시 ajax로 boardId,memberIndex, shceduleTableId값 스케줄 작성 form태그안에
	// 넣어주기
	@RequestMapping("/getBoardId")
	public @ResponseBody List<ScheduleTableVO> getBoardId(@RequestParam("boardId") Integer boardId,
			HttpSession session) {

		// 해당 게시글의 boardId,memberIndex, shceduleTableId값 얻어오기
		List<ScheduleTableVO> list = scheduleTableService.getScheduleDataByBoardId(boardId);

		return list;
	}

}

package com.example.domain.board.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.board.service.CommunityBoardService;
import com.example.domain.board.service.CommunityUserService;
import com.example.domain.board.service.FileService;
import com.example.domain.board.util.MD5Generator;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("community")
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;
	
	@Autowired
	private CommunityUserService communityUserService;
	
	@Autowired 
	private FileService fileService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/community/"+step;
		// /templates + board + xxxxx +.html
	}
	
	// 수정 페이지로 이동
	@RequestMapping("/boardUpdate")
	public void boardUpdate(BoardVO vo, Model m) {
		
		BoardVO result = communityBoardService.getBoard(vo);
		m.addAttribute("board", result);
	}
	
	// 게시글 수정
	@RequestMapping("/updateBoard")
	public String updateBoard( BoardVO vo) {
		

		communityBoardService.updateBoard(vo);
		System.out.println("글 수정 컨트롤러 확인"+ vo.toString());
		return "redirect:boardView?boardId="+vo.getBoardId();
	}
	
	// 나중에 로그인할 때? 몰라
//	@RequestMapping("/login")
//	public String login(HttpSession session, MemberVO mvo) {
//		MemberVO member = communityUserService.getMemberByMemberIndex(mvo);
//		session.setAttribute("member", member);
//		
//		return "redirect:index";
//	}
	
	// 자유게시판 상세 페이지 내 페이지랑 내페이지 아닐 때 구분해서 수정 삭제 버튼 보이게하기
	@RequestMapping("/boardView")
	public void boardView(BoardVO vo, Model m, HttpSession session,MemberVO mvo) {

		MemberVO result = communityUserService.getMemberByMemberIndex(mvo);
		session.setAttribute("member", result);
	
		
		m.addAttribute("member", session.getAttribute(String.valueOf(result.getMemberIndex())));
	
		
		BoardVO data = communityBoardService.getBoard(vo);
		m.addAttribute("board", data);

	}
	
	
	
	// 자유게시판 목록 조회
	@RequestMapping("/boardList")
	public void getboardList(Model m, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		List<BoardVO> list = communityBoardService.getBoardList();
		System.out.println("controller-> " +  list);
		m.addAttribute("boardList",list);
		
		// 자유게시판 5개씩 페이징 처리
		int pagingSize = 5;
        int sectorSize = 5;
        List<Integer> numList = new ArrayList<Integer>();
        List<BoardVO> pagingList = new ArrayList<BoardVO>();
        int length = (page*pagingSize > list.size()) ? list.size() : page*pagingSize ;
        for(int i=(page-1)*pagingSize; i<length ;i++) {
           pagingList.add(list.get(i));
        }
        if(pagingList.size() != 0) {
           
        } else {

        }
        
        int prevMax = ((page-1)/pagingSize)*pagingSize;
        int nextMin = ((page-1)/pagingSize+1)*pagingSize+1;
        int lastPage = list.size()%pagingSize > 0 ?  list.size()/pagingSize + 1 : list.size()/pagingSize;
        for(int i=prevMax+1;i<=prevMax+sectorSize;i++) {
           numList.add(i);
        }
        
        
        m.addAttribute("boardList",pagingList);
        m.addAttribute("numList", numList);
        m.addAttribute("prevMax", prevMax < 1 ? 1 : prevMax);
        m.addAttribute("nextMin", nextMin > lastPage ? lastPage : nextMin);
        m.addAttribute("lastPage", lastPage);
	}
	
	// 글 작성 페이지 띄우기

	
	// 글 작성 
	@RequestMapping("/saveBoard")
	public String saveBoard(@RequestParam("file") MultipartFile file, BoardVO vo) {
		
		String originFilename = file.getOriginalFilename();
		System.out.println("originFilename:" + originFilename);
		
		if( originFilename != null && !originFilename.equals("")) {
			// 파일첨부가 있는 경우
			try {
				// MD5Generator import경로 : board/util/MD5Generator.java
				String filename = new MD5Generator(originFilename).toString();
				System.out.println("filename=" + filename);
				// 파일 경로 설정
				String savePath = System.getProperty("user.dir")+"/src/main/resources/static/communityBoardFile";
				if( !new File(savePath).exists()) {
					new File(savePath).mkdir();
				}	
				String filepath = savePath + "\\" + filename;				
				file.transferTo(new File(filepath)); // 파일저장

				MemberUploadImagesVO fvo = new MemberUploadImagesVO();
				fvo.setMemberUploadImageOriginalname(originFilename);
				fvo.setMemberUploadImageName(filename);
				fvo.setMemberUploadImagePath(filepath);
		
				communityBoardService.saveBoard(vo, fvo);
				
			}
			catch (Exception e) {
				System.out.println("파일 업로드 실패:" + e.getMessage());
			}
		}
		else {
			communityBoardService.saveBoard(vo, null);
		}
		
		return "redirect:boardList";
	}
	

	@RequestMapping("/scheduleShareView")
	public void scheduleShareBoard() {
		
	}
	
	@RequestMapping("/scheduleShareList")
	public void scheduleShareView() {
		
	}
	
	@RequestMapping("scheduleShareWrite") 
	public void scheduleShareWrite() {
		
	}
	
	@RequestMapping("scheduleShareMyWrite")
	public void scheduleShareMyWrite() {
		
	}
}

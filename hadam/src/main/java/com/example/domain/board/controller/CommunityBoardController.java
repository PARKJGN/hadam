package com.example.domain.board.controller;


import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.board.service.CommunityBoardService;
import com.example.domain.board.service.CommunityUserService;
import com.example.domain.board.service.FileService;
import com.example.domain.board.util.MD5Generator;
import com.example.domain.board.vo.BoardVO;
import com.example.domain.comment.vo.CommentVO;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.report.vo.BoardAndCommentReportVO;

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
	
	// 수정 페이지로 이동 후 게시글정보,사진 출력
	@RequestMapping("/boardUpdate")
	public void boardUpdate(@RequestParam("boardId") int boardId, Model m) {
		
		BoardVO result = communityBoardService.findByboardId(boardId);
		m.addAttribute("board", result);
	}
	
	
	@RequestMapping("/single")
	public void boardView2() {
		
	}
	
	
	// 자유게시판 상세 페이지 내 페이지랑 내페이지 아닐 때 구분해서 수정 삭제 버튼 보이게하기
	@RequestMapping("/boardView")
	public void boardView(@RequestParam("boardId") int boardId, Model m, HttpSession session, MemberVO mvo) {
		
		// 회원의 memberIndex 조회에서 가져온후 session에 저장
		MemberVO result = communityUserService.getMemberByMemberIndex(mvo);
		session.setAttribute("memberIndex", result.getMemberIndex());
	
		// 회원의 memberIndex 조회에서 가져오기 현재는 memberIndex 1로 session 받아옴
//		m.addAttribute("member", session.getAttribute(String.valueOf(result.getMemberIndex())));
		
		// 조회수 처리
		communityBoardService.boardHits(boardId);
		BoardVO data = communityBoardService.findByboardId(boardId);
		System.out.println("data확인" + data);
		// 상세페이지에 댓글 목록 보이기
		List<CommentVO> list = communityBoardService.commentList(boardId);
		
		// 해당게시글 댓글 신고 시 ajax 데이터에 commentId 추가하려고 넣음
		CommentVO commentId = communityBoardService.selectCommentId(boardId);
		
		System.out.println("해당 게시글 commentId" + commentId);
		// 댓글 신고자 session으로 가져오기
		session.setAttribute("memberIndex", result.getMemberIndex());
		
		m.addAttribute("commentId",commentId);
		m.addAttribute("commentList",list);
		m.addAttribute("board", data);
		
	}
	
	// 자유게시판 목록 조회
	
	   @RequestMapping("/boardList")
	   public void getboardList(Model m, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
	      
	      List<BoardVO> list = communityBoardService.getBoardList();
	      System.out.println("controller-> " +  list);
	      m.addAttribute("boardList",list);
	      
	      	// 자유게시판 5개씩 페이징 처리
	      	int pagingSize = 10;
	      
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

	

	// 게시글,파일 정보 수정하기
		@RequestMapping("/updateBoard")
		public String updateBoard( @RequestParam("file") MultipartFile file, BoardVO vo) {
			System.out.println("file:" + file);
		try {
			
			// 파일이 있을 경우에만 처리
			if(!file.isEmpty()) {
				String originFilename = file.getOriginalFilename();
	            String filename = new MD5Generator(originFilename).toString();
	            String savePath = System.getProperty("user.dir")+ "/src/main/resources/static/communityBoardFile";
	            
	            if (!new File(savePath).exists()) {
	                new File(savePath).mkdir();
	            }
	            
	            String filepath = savePath + "/" + filename;
	            
	            file.transferTo(new File(filepath)); // 파일 저장
	            
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
			}
			else {
				// 파일이 업로드되지 않은 경우는 게시글 정보만 수정
				
				communityBoardService.updateBoard(vo);
			}
		}
		catch (Exception e) {
			System.out.println("파일 업로드 및 게시글 수정 실패:" + e.getMessage());
		}
		return "redirect:boardView?boardId=" + vo.getBoardId();
		}
	
	// 게시글 , 파일첨부 삭제
	@RequestMapping("/boardDelete")
	public String deleteBoard(@RequestParam("boardId") int boardId) {
		communityBoardService.deleteBoard(boardId);
		communityBoardService.deleteComment(boardId);
		return "redirect:boardList";
	}
	// 글 작성 , 파일첨부 페이지
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
	
	// 커뮤니티 상세페이지에서 댓글 작성 (ajax) save
	@RequestMapping("/commentSave")
	public @ResponseBody List<CommentVO> commentSave(CommentVO vo, Model m) {
	
		communityBoardService.commentSave(vo);
		System.out.println("댓글 vo 정보" + vo.toString());
		// 해당 게시글에 작성한 댓글 리스트 가져오기
		List<CommentVO> list = communityBoardService.commentList(vo.getBoardId());
		 
		System.out.println("commentvo" + list);
		 return list;
	}
	
	// 커뮤니티 상세페이지에서 댓글 신고 (ajax) save
	@RequestMapping("/commentReportSave")
	public @ResponseBody List<BoardAndCommentReportVO> commentReportSave(BoardAndCommentReportVO vo) {
		// 신고자 저장
		communityBoardService.commentReportSave(vo);
		List<BoardAndCommentReportVO> list = communityBoardService.reportList(vo.getCommentId());
		System.out.println("정보ㄴㅇㄹㄴㅇㄴㅇㄹ" + vo);
		return list;
	}
	
	// 스케줄 공유 상세 페이지
			@RequestMapping("/scheduleShareView")
			public void scheduleShareBoard() {
				
			}
			
			// 스케줄 공유 리스트 페이지
			@RequestMapping("/scheduleShareList")
			public void scheduleShareView() {
				
			}
			
			// 스케줄 공유 작성 페이지
			@RequestMapping("scheduleShareWrite") 
			public void scheduleShareWrite() {
				
			}
			// 내가 쓴 스케줄 공유 작성 페이지
			@RequestMapping("scheduleShareMyWrite")
			public void scheduleShareMyWrite() {
				
			}
			
			@RequestMapping("Modal")
			public void Modal() {
				
			}
}

package com.example.domain.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.mypage.service.MypageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		
		return "mypage/"+step ;
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
				return "/mypage/mypageProfile";
			}else {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 네트워크를 확인해주세요");
				return "/mypage/mypageProfile";
			}
			
//		현재 비밀번호가 맞지 않을 때
		}else {
			model.addAttribute("msg", "현재 비밀번호를 확인해주세요");
			return "/mypage/mypageProfile";
		}
	}
}

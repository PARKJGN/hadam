package com.example.domain.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.member.service.SigninService;
import com.example.domain.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/signin")
public class SigninController {

	@Autowired
	SigninService signinService;
	
	
//	로그인 정보 확인 후 로그인 페이지 이동
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	@ResponseBody
	public Integer loginCheck(String memberId, String memberPassword, HttpSession session, HttpServletRequest request ) {
//		로그인 정보 확인
		MemberVO vo = signinService.loginCheck(memberId, memberPassword);
//		System.out.println(vo);
		
//		로그인 정보가 있고, 관리자가 아닌 경우
		if(vo != null && vo.getAdminStatus() == false) {
//			로그인 세션 저장
			session.setAttribute("memberId", vo.getMemberId());
			session.setAttribute("memberNickname", vo.getMemberNickname());
//			세션 1시간 유지
			session.setMaxInactiveInterval(60*60);
			
			
			return 1;

//		관리자			
		}else if(vo != null && vo.getAdminStatus() == true) {
			return 2;
//		회원정보 없음
		}else {
			return 0;
		}
	}
	
//	로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		 return "redirect:/index"; 
		/* return "logout"; */
	}
	
//	네이버 로그인
	@RequestMapping(value="/naverLogin", method=RequestMethod.POST)
	@ResponseBody
	public void naverLogin(String memberId, String memberPassword, @RequestParam("accessToken") String accessToken,
			HttpSession session, HttpServletRequest request ) {
		MemberVO vo = signinService.loginCheck(memberId, memberPassword);
		System.out.println("네이버 로그인 들어오기");
		System.out.println(accessToken);
		/* session.setAttribute("accessToken", accessToken); */
		session.setAttribute("memberId", vo.getMemberId());
		session.setAttribute("memberNickname", vo.getMemberNickname());
//		세션 1시간 유지
		session.setMaxInactiveInterval(60*60);
		
	}
}

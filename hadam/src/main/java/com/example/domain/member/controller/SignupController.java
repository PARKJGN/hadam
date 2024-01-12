package com.example.domain.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.member.service.SignupService;



@Controller
@RequestMapping("/signup")
public class SignupController {

	@Autowired
	private SignupService signupService;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		
		return "signup/"+step ;
	}
	
	
	/* 아이디 중복확인 */
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean memberIdCheck(@RequestParam("id") String id) {
//		System.out.println(id);
		String result = signupService.memberIdCheck(id);
		if (result!=null) return false;
		else return true;
	}
	
	/* 닉네임 중복확인 */
	@RequestMapping(value="/memberNicknameCheck", method=RequestMethod.POST)
	@ResponseBody
	public boolean memberNicknameCheck(@RequestParam("nickname") String nickname) {
//		System.out.println(nickname);
		String result = signupService.memberNicknameCheck(nickname);
		if (result!=null) return false;
		else return true;
	}
	
	
	/* 핸드폰 인증 */
//	@RequestMapping(value = "/memberPhoneCheck", method = RequestMethod.POST)
//	@ResponseBody
//	public boolean memberNickNameCheck(@RequestParam("phone") String phone) {
//		System.out.println(phone);
//		return false;
//	}
	
	
}

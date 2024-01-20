package com.example.domain.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.category.service.CategoryService;
import com.example.domain.member.service.SignupService;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.preference.service.PreferenceService;



@Controller
@RequestMapping("/signup")
public class SignupController {

	@Autowired
	private SignupService signupService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PreferenceService preferenceService;
	
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
	@RequestMapping(value = "/memberPhoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberPhoneCheck(@RequestParam("phone") String phone) {
//		System.out.println(phone);
		
//		6자리 인증번호 생성 
		Random random = new Random();
		int randomNum = 0;
		String randomSum = "";
		for(int i=0; i<5; i++) {
			randomNum = random.nextInt(9);
			randomSum += Integer.toString(randomNum);
		}
//		String result = signupService.phoneCheckSMS(phone, randomSum);
		
//		return result;
		return "1234";
	}
	
	
	/*회원가입 정보입력*/
	@RequestMapping(value="/signupCompletion", method=RequestMethod.POST)
	@ResponseBody
	public boolean signupCompletion(MemberVO vo, @RequestParam("checkedCategory[]" )List<String> checkedCategory) {
//		개인정보 입력 
		Integer result = signupService.signupCompletion(vo);

//		memberIndex 가져오기
		Integer memberIndex = signupService.getMemberIndex(vo.getMemberId());

//		checkedCategory로 categoryId 가져오기
		List<Integer> categoryIdlist = categoryService.getCategoryId(checkedCategory);

//		취향tb에 memberId랑 categoryId 넣기
		preferenceService.SignupPreference(memberIndex, categoryIdlist);
		
//		회원가입 성공하면 
		if(result==1) {
			return true;
//		회원가입 실패하면
		}else {
			return false;
		}
	}	
	
	/* 네이버 회원가입 시도하기 - 가입이력이 있는지 확인. */
	@RequestMapping(value="/naverSignup", method=RequestMethod.POST)
	@ResponseBody
	public Integer naverSignup(MemberVO vo) {
		System.out.println("네이버 회원가입 시도"+vo);
		return signupService.naverSignup(vo);
	}
	
	/* 카카오 회원가입 */
	@RequestMapping(value="/kakaoCallback", method=RequestMethod.GET)
	public String kakaoSignup(@RequestParam(value="code", required=false) String code) {
//		인가 코드 받아오기
		System.out.println("code : " + code);
//		토큰 받기
		String accessToken = signupService.getKakaoAccessToken(code);
//		System.out.println(accessToken);
		
//		사용자 정보 받기
		MemberVO vo = signupService.getKakaoUserInfo(accessToken);
		System.err.println("정보 다 가져옴 " + vo);
		return  "redirect:/index";
	}
	
	
}

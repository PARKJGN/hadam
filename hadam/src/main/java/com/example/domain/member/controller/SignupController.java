package com.example.domain.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import com.example.domain.category.service.CategoryService;
import com.example.domain.images.vo.MemberUploadImagesVO;
import com.example.domain.member.service.SigninService;
import com.example.domain.member.service.SignupService;
import com.example.domain.member.vo.MemberVO;
import com.example.domain.preference.service.PreferenceService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/signup")
public class SignupController {

	@Autowired
	private SignupService signupService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PreferenceService preferenceService;
	@Autowired
	private SigninService signinService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {

		return "signup/" + step;
	}

	/* 아이디 중복확인 */
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean memberIdCheck(@RequestParam("id") String id) {
//		System.out.println(id);
		String result = signupService.memberIdCheck(id);
		if (result != null)
			return false;
		else
			return true;
	}

	/* 닉네임 중복확인 */
	@RequestMapping(value = "/memberNicknameCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean memberNicknameCheck(@RequestParam("nickname") String nickname) {
//		System.out.println(nickname);
		String result = signupService.memberNicknameCheck(nickname);
		if (result != null)
			return false;
		else
			return true;
	}

	/* 핸드폰 인증 */
	@RequestMapping(value = "/memberPhoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberPhoneCheck(@RequestParam("phone") String phone, @RequestParam("findInfo") Integer findInfo) {
//		System.out.println(phone);

//		6자리 인증번호 생성 
		Random random = new Random();
		int randomNum = 0;
		String randomSum = "";
		for (int i = 0; i < 5; i++) {
			randomNum = random.nextInt(9);
			randomSum += Integer.toString(randomNum);
		}
//		String result = signupService.phoneCheckSMS(phone, randomSum);

//		return result;
		
		return "1234";
	}
	
	

	/* 회원가입 정보입력 */
	@RequestMapping(value = "/signupCompletion", method = RequestMethod.POST)
	@ResponseBody
	public boolean signupCompletion(MemberVO vo, @RequestParam("checkedCategory[]") List<String> checkedCategory,
			HttpSession session) {
//		개인정보 입력 
		Integer result = signupService.signupCompletion(vo);

//		memberIndex 가져오기
		Integer memberIndex = signupService.getMemberIndex(vo.getMemberId());

//		checkedCategory로 categoryId 가져오기
		List<Integer> categoryIdlist = categoryService.getCategoryId(checkedCategory);

//		취향tb에 memberId랑 categoryId 넣기
		preferenceService.SignupPreference(memberIndex, categoryIdlist);

//		회원가입 성공하면 
		if (result == 1) {
			if (vo.getMemberType() == 1 || vo.getMemberType() == 2) {
//				로그인 세션 저장
				session.setAttribute("memberId", vo.getMemberId());
				session.setAttribute("memberNickname", vo.getMemberNickname());
				session.setAttribute("memberIndex", vo.getMemberIndex());
//				프로필 사진 가져오기
				MemberUploadImagesVO i_vo = signinService.profileCheck(vo.getMemberIndex());
				if (i_vo != null) {
					session.setAttribute("memberUploadImageName", i_vo.getMemberUploadImageName());
					session.setAttribute("memberUploadImageId", i_vo.getMemberUploadImageId());
				}
//				세션 1시간 유지
				session.setMaxInactiveInterval(60 * 60);
			}
			return true;
//		회원가입 실패하면
		} else {
			return false;
		}
	}

	/* 네이버 회원가입 - 1.네이버정보얻어오기 2.가입이력 있는지 확인 3-1.없으면 약관동의 카테고리 설정 후 가입진행 3-2.있으면 로그인 */
//	@ResponseBody
	@RequestMapping(value = "/naverSignup", method = RequestMethod.POST)
	public String naverSignup(MemberVO vo, @RequestParam("accesstoken") String accesstoken,  Model model, HttpSession session ) {
//		1.네이버정보얻어오기 => signin.js에서 얻어온 값이 vo에 들어옴
		// System.out.println("네이버 회원가입 시도"+vo);

//		2.가입이력 있는지 확인 (result = memberId)
		String imsimemberId = signupService.memberIdCheck(vo.getMemberId());
		// System.out.println("카카오 사용자 확인" + result);

//		3-1.없으면 약관동의 카테고리 설정 후 가입진행
		if (imsimemberId == null) {
			// 약관동의 취향정보 받아야해서 개인정보 디비에 정보 임시저장
			vo.setMemberType(1);
			model.addAttribute("imsiMemberVO", vo);
			System.out.println("여기까지 온거니?");
			// 약관동의 취향설정 받으러 가야함
			return "/signup/preference";

//		3-2.있으면 로그인
		} else {
			// 로그인 정보 확인
			MemberVO m_vo = signinService.loginCheck(imsimemberId, imsimemberId);

			// 로그인 정보가 있고, 관리자가 아닌 경우
			if (m_vo != null && m_vo.getAdminStatus() == false) {
				// 로그인 세션 저장
				 session.setAttribute("naverToken", accesstoken); 
				session.setAttribute("memberId", m_vo.getMemberId());
				session.setAttribute("memberNickname", m_vo.getMemberNickname());
				session.setAttribute("memberIndex", m_vo.getMemberIndex());
				// 프로필 사진 가져오기
				MemberUploadImagesVO i_vo = signinService.profileCheck(m_vo.getMemberIndex());
				if (i_vo != null) {
					session.setAttribute("memberUploadImageName", i_vo.getMemberUploadImageName());
					session.setAttribute("memberUploadImageId", i_vo.getMemberUploadImageId());
				}
				// 세션 1시간 유지
				session.setMaxInactiveInterval(60 * 60);

				return "redirect:/index";

				// 관리자
			} else if (vo != null && vo.getAdminStatus() == true) {
				// 여기 관리자url 설정해야 함
				return null;
				// 회원정보 없음
			} else {
				return "redirect:/index";
			}
		}
	}

	/* 카카오 회원가입 - 1.카카오정보얻어오기 2.가입이력 있는지 확인 3-1.없으면 약관동의 카테고리 설정 후 가입진행 3-2.있으면 로그인 */
	@RequestMapping(value = "/kakaoCallback", method = RequestMethod.GET)
	public String kakaoSignup(@RequestParam(value = "code", required = false) String code, HttpSession session,
			HttpServletRequest request, Model model) {
		// 이전 url 저장하기
//		String previousUrl = request.getHeader("referer");

//		1.카카오정보얻어오기
		// 인가 코드 받아오기
		// System.out.println("code : " + code);

		// 토큰 받기
		String accessToken = signupService.getKakaoAccessToken(code);
		// System.out.println(accessToken);

		// 사용자 정보 받기
		MemberVO vo = signupService.getKakaoUserInfo(accessToken);
		// System.err.println("정보 다 가져옴 " + vo);

//		2.가입이력 있는지 확인 (result = memberId)
		String imsimemberId = signupService.memberIdCheck(vo.getMemberId());
		// System.out.println("카카오 사용자 확인" + result);

//		3-1.없으면 약관동의 카테고리 설정 후 가입진행
		if (imsimemberId == null) {
			// 약관동의 취향정보 받아야해서 개인정보 디비에 정보 임시저장
			vo.setMemberType(2);
			model.addAttribute("imsiMemberVO", vo);
			// System.out.println("카카오 정보 임시저장하고 selectkey 가져옴 : "+vo.getMemberIndex());
			// 약관동의 취향설정 받으러 가야함
			return "/signup/preference";

//		3-2.있으면 로그인
		} else {
			// 로그인 정보 확인
			MemberVO m_vo = signinService.loginCheck(imsimemberId, imsimemberId);

			// 로그인 정보가 있고, 관리자가 아닌 경우
			if (m_vo != null && m_vo.getAdminStatus() == false) {
				// 로그인 세션 저장
				session.setAttribute("kakaoToken",accessToken);
				session.setAttribute("memberId", m_vo.getMemberId());
				session.setAttribute("memberNickname", m_vo.getMemberNickname());
				session.setAttribute("memberIndex", m_vo.getMemberIndex());
				// 프로필 사진 가져오기
				MemberUploadImagesVO i_vo = signinService.profileCheck(m_vo.getMemberIndex());
				if (i_vo != null) {
					session.setAttribute("memberUploadImageName", i_vo.getMemberUploadImageName());
					session.setAttribute("memberUploadImageId", i_vo.getMemberUploadImageId());
				}
				// 세션 1시간 유지
				session.setMaxInactiveInterval(60 * 60);

				return "redirect:/index";

				// 관리자
			} else if (vo != null && vo.getAdminStatus() == true) {
				// 여기 관리자url 설정해야 함
				return null;
				// 회원정보 없음
			} else {
				return "redirect:/index";
			}
		}
	}

}

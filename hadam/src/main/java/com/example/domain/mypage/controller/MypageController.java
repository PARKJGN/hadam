package com.example.domain.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.member.vo.MemberVO;
import com.example.domain.mypage.service.MypageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
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
				return "/mypage/mypagePassword";
			}else {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 네트워크를 확인해주세요");
				return "/mypage/mypagePassword";
			}
			
//		현재 비밀번호가 맞지 않을 때
		}else {
			model.addAttribute("msg", "현재 비밀번호를 확인해주세요");
			return "/mypage/mypagePassword";
		}
	}
	
	
	/* 전화번호 변경 홈페이지 불러올때 원래 전화번호 띄어주기 */
	@RequestMapping("/mypagePhoneNumber")
	public void mypagePhoneNumber(Model model, HttpSession session) {
//		세션에서 로그인한 회원 index 가져오기
		Integer index = (Integer) session.getAttribute("memberIndex");
//		회원 index로 전화번호 가져오기
		String memberPhoneNumber = mypageService.mypagePhoneNumber(index);
//		model 객체에 전화번호 담아서 view에 보내기
		model.addAttribute("memberPhoneNumber", memberPhoneNumber);
	}
	
	@RequestMapping("/phoneNumberChange")
	public String phoneNumberChange(String phoneNumber, HttpSession session, Model model) {
//		세션에서 로그인한 회원 index 가져오기
		Integer index = (Integer) session.getAttribute("memberIndex");
		MemberVO vo = new MemberVO();
		vo.setMemberIndex(index);
		vo.setMemberPhoneNumber(phoneNumber);
		Integer result = mypageService.phoneNumberChange(vo);
		if(result>0) {
			model.addAttribute("msg", "전화번호 변경이 완료되었습니다");
			model.addAttribute("memberPhoneNumber", phoneNumber);
		}else {
			model.addAttribute("msg", "네트워크 문제로 실패하였습니다. 잠시 후 다시 시도해주세요");
		}

		return "/mypage/mypagePhoneNumber";
	}
	
	
}

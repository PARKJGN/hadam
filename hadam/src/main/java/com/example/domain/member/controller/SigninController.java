package com.example.domain.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.images.vo.MemberUploadImagesVO;
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
	private SigninService signinService;

//	로그인 정보 확인 후 로그인 페이지 이동
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public Integer loginCheck(String memberId, String memberPassword, HttpSession session, HttpServletRequest request) {
//		로그인 정보 확인
		MemberVO vo = signinService.loginCheck(memberId, memberPassword);
//		System.out.println(vo);

//		로그인 정보가 있고, 관리자가 아닌 경우
		if (vo != null && vo.getAdminStatus() == false) {
//			로그인 세션 저장
			session.setAttribute("memberId", vo.getMemberId());
			session.setAttribute("memberNickname", vo.getMemberNickname());
			session.setAttribute("memberIndex", vo.getMemberIndex());
//			프로필 사진 가져오기
			MemberUploadImagesVO i_vo = signinService.profileCheck(vo.getMemberIndex());
			if (i_vo != null) {
				session.setAttribute("memberUploadImageName", i_vo.getMemberUploadImageName());
				session.setAttribute("memberUploadImageId", i_vo.getMemberUploadImageId());
			}
//			세션 1시간 유지
			session.setMaxInactiveInterval(60 * 60);

			return 1;

//		관리자			
		} else if (vo != null && vo.getAdminStatus() == true) {
			session.setAttribute("memberId", vo.getMemberId());
			session.setAttribute("memberNickname", vo.getMemberNickname());
			session.setAttribute("memberIndex", vo.getMemberIndex());
			return 2;
//		회원정보 없음
		} else {
			return 0;
		}
	}

//	로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		// 네이버 로그아웃
		if (session.getAttribute("naverToken") != null) {
			try {
				// HttpClient 객체 생성
				HttpClient httpClient = HttpClient.newHttpClient();
				String naverToken = (String) session.getAttribute("naverToken");
				// 요청을 보낼 URI
				URI uri = URI.create(
						"https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=sIGCFQ1qvJKFf37n_gIA&client_secret=Wq_cQNV4qs&access_token="
								+ naverToken + "&state=af2d41f3-e90c-4334-ba64-272b1c9e8daa&service_provider=NAVER");
				// HttpRequest 객체 생성
				HttpRequest request = HttpRequest.newBuilder().uri(uri).POST(HttpRequest.BodyPublishers.noBody()) // POST
																													// 요청
						.build();
				// 요청 보내고 응답 받기
				HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (session.getAttribute("kakaoToken") != null) {

			try {
				String reqUrl = "https://kapi.kakao.com/v1/user/logout";
				String kakaoToken = (String) session.getAttribute("kakaoToken");

				URL url = new URL(reqUrl);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer " + kakaoToken);

				int responseCode = conn.getResponseCode();

				BufferedReader br;
				if (responseCode >= 200 && responseCode <= 300) {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}

				String line = "";
				StringBuilder responseSb = new StringBuilder();
				while ((line = br.readLine()) != null) {
					responseSb.append(line);
				}
				String result = responseSb.toString();
				System.out.println("커카오 로그아웃 되는겨 안되는겨" + result);

//				String reqUrl = "https://kauth.kakao.com/oauth/logout?
//				client_id=1bce4a6cad3104a2d5cc6134e1af3958&logout_redirect_uri=http://localhost:8080/index";

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		session.invalidate();
		return "redirect:/index";
		/* return "logout"; */
	}

	/* 아이디 비밀번호 찾기 */
	@RequestMapping(value = "/getMemberId", method = RequestMethod.POST)
	@ResponseBody
	public String memberPhoneCheck(@RequestParam("phone") String phone) {

		MemberVO vo = new MemberVO();
		vo.setMemberPhoneNumber(phone);
		vo = signinService.getMemberId(phone);

		if (vo.getMemberType() == 1) {
			return "네이버로 가입하셨습니다";
		} else if (vo.getMemberType() == 2) {
			return "카카오로 가입하셨습니다";

		} else {
			return vo.getMemberId();
		}

	}

}

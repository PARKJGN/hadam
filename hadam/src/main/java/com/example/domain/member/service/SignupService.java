package com.example.domain.member.service;

import org.springframework.web.bind.annotation.RequestParam;

public interface SignupService {

	String memberIdCheck(String id);
	String memberNicknameCheck(String nickname);
}

package com.example.domain.member.service;

import org.springframework.web.bind.annotation.RequestParam;

public interface SignupServiceImpl {

	public boolean memberIdCheck(String id);
}

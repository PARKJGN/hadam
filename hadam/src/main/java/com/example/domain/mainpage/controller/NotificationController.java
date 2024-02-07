package com.example.domain.mainpage.controller;



import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.example.domain.mainpage.service.NotificationService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/notifications")
@RequiredArgsConstructor
public class NotificationController {
	private final NotificationService notificationService;
	
	/*
	 * 함수 : emitter를 새로 등록하고 해당 emitter를 반환하는 함수
	 */
	 @GetMapping(value = "/subscribe/{id}", produces ="text/event-stream")
	    public SseEmitter subscribe(@PathVariable Long id) {
		 
	        return notificationService.subscribe(id);
	    }

	 
	 
	 
	 
	    @GetMapping("/send-data/{id}")
	    public void sendData(@PathVariable Long id) {
	        notificationService.notify(id, "새로운알림이 도착했습니다.");
	    }
	    @GetMapping("/send-reviewdata/{id}")
	    public void sendData1(@PathVariable Long id) {
	        notificationService.notify(id, "새로운 리뷰가 작성되었습니다.");
	    }
	    @GetMapping("/send-agreedata/{id}")
	    public void sendData2(@PathVariable Long id) {
	        notificationService.notify(id, "새로운 동행수락 요청이들어왔습니다.");
	    }
}

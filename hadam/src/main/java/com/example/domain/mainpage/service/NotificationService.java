package com.example.domain.mainpage.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {
	public SseEmitter subscribe(Long userId);
	public void notify(Long userId, Object event);
	public void sendToClient(Long id, Object data);
	public SseEmitter createEmitter(Long id);
}

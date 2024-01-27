package com.example.domain.scheduletable.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class PythonController {

	@MessageMapping("/sendMessage")
	@SendTo("/topic/receiveMessage")
	public String processMessageFromClient(String message) {
		return "Server: " + message;
	}
}

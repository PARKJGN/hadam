package com.example.domain.mainpage.controller;

import lombok.Data;

@Data
public class Greeting {
	private String content;
	private String memberNickname;
	private String sendTime;
	
    public Greeting(String content, String memberNickname,String sendTime) {
        this.content = content;
        this.memberNickname = memberNickname;
        this.sendTime = sendTime;
    }

  

}

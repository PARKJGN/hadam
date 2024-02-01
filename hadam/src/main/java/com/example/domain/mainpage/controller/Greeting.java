package com.example.domain.mainpage.controller;

import lombok.Data;

@Data
public class Greeting {
	private String content;
	private String memberNickname;
	private String sendTime;
	private String memberUploadImageName;
	
    public Greeting(String content, String memberNickname,String sendTime,String memberUploadImageName) {
        this.content = content;
        this.memberNickname = memberNickname;
        this.sendTime = sendTime;
        this.memberUploadImageName=memberUploadImageName;
    }

  

}

package com.example.domain.mainpage.repository;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{

	  @Override
	    public void configureMessageBroker(MessageBrokerRegistry config) {
		//클라이언트에서 보낸 메세지를 받을 prefix
	        config.setApplicationDestinationPrefixes("/app");
	    //해당 주소를 구독하고 있는 클라이언트들에게 메세지 전달
	        config.enableSimpleBroker("/topic");
 
	    }

	    @Override
	    // 클라이언트와 웹 소켓을 연결할 수 있게 해주는 경로를 설정하는 함수
	    public void registerStompEndpoints(StompEndpointRegistry registry) {
	       
	        registry.addEndpoint("/websocket-example").withSockJS();
	    }
	
}

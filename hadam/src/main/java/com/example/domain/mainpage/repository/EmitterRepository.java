package com.example.domain.mainpage.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EmitterRepository {
    private final Map<Long, SseEmitter> emitters = new ConcurrentHashMap<>();
    
    /*
     * 함수 : emitters에 전달받은 emitter를 사용자 id를 key로 저장해주는 함수
     * 인자 : 사용자 id값 , service 단에서 생성된 emitter
     */
    public void save(Long id, SseEmitter emitter) {
        emitters.put(id, emitter);
		 System.out.println("emitter맵에 등록 성공");

    }
    
    /**
     * 함수 : 주어진 아이디의 Emitter를 제거
     *
     * 인자 : @param id - 사용자 아이디.
     */
    public void deleteById(Long id) {
         emitters.remove(id);
     	System.out.println("emitter가 삭제되었습니다.");

    }
    
    /**
     * 주어진 아이디의 Emitter를 가져옴.
     *
     * @param id - 사용자 아이디.
     * @return SseEmitter - 이벤트 Emitter.
     */
    public SseEmitter get(Long id) {
        return emitters.get(id);
    }
    		
}

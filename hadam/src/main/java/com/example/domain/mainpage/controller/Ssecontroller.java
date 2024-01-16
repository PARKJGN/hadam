/*
 * package com.example.domain.mainpage.controller;
 * 
 * import java.io.IOException; import java.util.Map; import
 * java.util.concurrent.ConcurrentHashMap;
 * 
 * import org.springframework.http.HttpStatus; import
 * org.springframework.http.MediaType; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RestController; import
 * org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
 * 
 * @RestController
 * 
 * @RequestMapping("/see") public class Ssecontroller {
 * 
 * 
 * private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
 * 
 * 
 * 
 * 함수명 : streamSSE 기능 : 새로운 sseemitter를 생성해서 클라이언트 식별자와 함께 map에 저장하는것.
 * 
 * @GetMapping("/stream") public SseEmitter streamSSE() {
 * System.out.println("streamSSE 도착"); //SseEmitter 객체 생성 , 타임아웃은 0L로 지정하여 연결을
 * 계속해서 유지시킨다. SseEmitter emitter = new SseEmitter(0L);
 * emitters.put("some-unique-id", emitter); // 클라이언트 식별자와 함께 저장소에 저장
 * 
 * emitter.onCompletion(() -> {emitters.remove("some-unique-id");
 * System.out.println("연결이 해제되었습니다.");});
 * 
 * 
 * return emitter; }
 * 
 * 
 * @GetMapping("/send-event") public ResponseEntity<String> sendEvent() {
 * System.out.println("sendEvent 도착"); String eventData =
 * "data: {\"message\": \"서버-센트 이벤트입니다.\"}";
 * 
 * // 저장소에서 "some-unique-id"값을 가진 SseEmitter를 가져와서 이벤트 전송 SseEmitter emitter =
 * emitters.get("some-unique-id");
 * 
 * try { //emitter.send를 통해 데이터가 클라이언트로 전송된다. emitter.send(eventData,
 * MediaType.TEXT_EVENT_STREAM); return
 * ResponseEntity.ok("Event sent successfully."); } catch (IOException e) {
 * e.printStackTrace(); return new ResponseEntity<>("Failed to send event.",
 * HttpStatus.INTERNAL_SERVER_ERROR); } } }
 */
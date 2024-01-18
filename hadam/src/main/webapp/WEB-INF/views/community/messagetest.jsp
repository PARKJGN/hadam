<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebSocket Example</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <form id="messageForm">
        <input type="text" id="name" placeholder="Your Name" required>
        <button type="submit">Send</button>
    </form>
    <div id="greetings"></div>

    <script>
    //클라이언트 변수
        var stompClient = null;

    //클라이언트를 웹소켓에 연결하고 그위에 stomClient를 생성해주는 함수.
        function connect() {
    	// SockJS를 사용하여 /websocket-example 엔드포인트에 연결할 WebSocket을 생성
            var socket = new SockJS('/websocket-example');
    	// WebSocket위에 STOMP 클라이언트를 생성
            stompClient = Stomp.over(socket);
    	
    	//STOMP 클라이언트를 서버에 연결합니다. 연결이 성공하면 콜백 함수가 호출되고, 연결 정보가 frame 매개변수로 전달됩니다.

            stompClient.connect({}, function (frame) {
                console.log('Connected?!: ' + frame);
                
                
        // stompClient.subscribe 함수
        // 첫번째 인자 : 구독할 주제를 지정한다.
        // 두번째 인자 : 해당 주제에 메세지가 send될때 마다 실행되는 콜백함수. 
                var roomId = "room123"; // 실제 채팅방 ID로 동적으로 설정
                stompClient.subscribe('/topic/greetings/' + roomId, function (greeting) {
                    showGreeting(JSON.parse(greeting.body).content);
                });
            });
        }

        function showGreeting(message) {
            $("#greetings").append("<p>" + message + "</p>");
        }

        $(function () {
            $("form").on('submit', function (e) {
                e.preventDefault();
                var name = $("#name").val();
                
                stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({ 'name': name }));
                $("#name").val('');
            });

            connect();
        });
    </script>
</body>
</html>

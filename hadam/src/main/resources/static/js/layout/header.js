// header.js
/*

채팅창 구축 -정건일

// stomp 소켓 서버 등록
var stompClient = null;
var socket = new SockJS('/websocket-example');
stompClient = Stomp.over(socket);


// 이미 구독한 채팅방 ID를 저장할 배열
var subscribedRoomIds = [];

	함수명	: getChatRoomList
	 *인자	: 
	 *기능	: 내가 join되어있는 채팅방의 데이터를 불러와서 리스트에 띄워준다.
	 *제작	: 정건일 
	 * 
function getChatRoomList() { 
    const data = { "memberIndex": `${sessionScope.memberIndex}` };
	const data = { "memberIndex": 1};


    $.ajax({
        type: "post",
        url: '/chat/getchatroomlist',
        data: data,
        dataType: "json",
        success: function (response) {
			채팅 목록 div
            var chatRoomListDiv = $('#chatRoomList');
            
            // 채팅방 목록을 돌면서 동적으로 목록 생성
            $.each(response, function (index, ChatRoomList) {

                var chatRoomItem = $('<div class="chatRoomItem"></div>');
                chatRoomItem.text(ChatRoomList.chatRoomName); // 또는 다른 필요한 속성을 표시
                chatRoomItem.attr('data-chatRoomId', ChatRoomList.chatRoomId);
                chatRoomItem.attr('onclick', 'addmodal(' + ChatRoomList.chatRoomId + ')');
                // 생성된 목록을 chatRoomListDiv에 추가
                chatRoomListDiv.append(chatRoomItem);

                // 구독
                // stompClient.subscribe 함수
                // 인자 : 구독할 주제.
                // 역할 : 내가 가진 채팅방의 내용을 웹소켓에 구독한다.
                // 현재 방 ID가 이미 구독한 방 ID에 포함되어 있지 않으면 구독
                if (!subscribedRoomIds.includes(ChatRoomList.chatRoomId)) {
                    // 구독
                    console.log("구독이 안되어있어서 추가함")
                    var roomId = ChatRoomList.chatRoomId;
                    stompClient.subscribe('/topic/greetings/' + roomId);
                    subscribedRoomIds.push(roomId); // 구독한 방 ID를 배열에 추가
                }
                    var roomId = ChatRoomList.chatRoomId;
                
            });
        },
        error: function (error) {
            console.error(error);
        }
    });
}


function addmodal(chatRoomId) {
    console.log("모달창 생성 되냐?" + chatRoomId);
    console.log('소켓클라이언트가 존재하나?: ' + stompClient);

    // chatRoomId를 이용하여 동적으로 모달 창을 생성
    var modalContent = $('<div class="chattingroommodal"></div>');
    var form = $('<form id="messageForm"></form>');
    var input = $('<input type="text" id="userMessage" required>');
    var input2 = $('<input type="hidden" id="modalChatRoomId">').val(chatRoomId);
    var button = $('<button type="submit">Send</button>');
    var greetingsDiv = $('<div id="greetings"></div>');

    // 모달 창에 컨텐츠 추가
    form.append(input);
    form.append(input2);
    form.append(button);
    modalContent.append(form);
    modalContent.append(greetingsDiv);

    // 생성된 모달 창을 body에 추가
    $('.chattingmodalplace').append(modalContent);

    // 폼 제출 이벤트 처리
      form.on('submit', function(event) {
        event.preventDefault();

        var roomId = $("#modalChatRoomId").val();
        console.log("룸ID 값이 잘넘어오는지확인:" + roomId);
         var userMessage = $("#userMessage").val();

        stompClient.send("/app/chat/" + roomId, {}, JSON.stringify({ 'userMessage': userMessage }));
		console.log(JSON.parse(body).content);
		
		stompClient.send("/app/chat/"+roomId, {}, JSON.stringify({ 'userMessage': userMessage }))
		connect()
		
});         
    // 모달 창을 표시하거나 필요한 동작 수행
    // 여기에서는 간단하게 show 메서드를 호출하는 예시를 보여줍니다.
    modalContent.show();
}

function showGreeting(message) {
    $("#greetings").append("<p>" + message + "</p>");
}

 function connect() {
	 var stompClient = null;
        var socket = new SockJS('/websocket-example');
        stompClient = Stomp.over(socket);
             console.log("d")
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/greetings/5', function (greeting) {
                    showGreeting(JSON.parse(greeting.body).content);
                });
            });
        }

 */
/*function getChatRoomList() { 
    //const data = { "memberIndex": `${sessionScope.memberIndex}` };
	const data = { "memberIndex": 1};


    $.ajax({
        type: "post",
        url: '/chat/getchatroomlist',
        data: data,
        dataType: "json",
        success: function (response) {
			//채팅 목록 div
            var chatRoomListDiv = $('#chatRoomList');
            
            // 채팅방 목록을 돌면서 동적으로 목록 생성
            $.each(response, function (index, ChatRoomList) {

                var chatRoomItem = $('<div class="chatRoomItem"></div>');
                chatRoomItem.text(ChatRoomList.chatRoomName); // 또는 다른 필요한 속성을 표시
                chatRoomItem.attr('data-chatRoomId', ChatRoomList.chatRoomId);
                chatRoomItem.attr('onclick', 'addmodal(' + ChatRoomList.chatRoomId + ')');
                // 생성된 목록을 chatRoomListDiv에 추가
                chatRoomListDiv.append(chatRoomItem);   
                
            });
        },
        error: function (error) {
            console.error(error);
        }
    });
}

function addmodal(chatRoomId) {

    // chatRoomId를 이용하여 동적으로 모달 창을 생성
    var modalContent = $('<div class="chattingroommodal"></div>');
    var form = $('<form id="messageForm"></form>');
    var input = $('<input type="text" id="userMessage" required>');
    var input2 = $('<input type="hidden" id="modalChatRoomId">').val(chatRoomId);
    var button = $('<button type="submit">Send</button>');
    var greetingsDiv = $('<div id="greetings"></div>');

    // 모달 창에 컨텐츠 추가
    form.append(input);
    form.append(input2);
    form.append(button);
    modalContent.append(form);
    modalContent.append(greetingsDiv);

    // 생성된 모달 창을 body에 추가
    $('.chattingmodalplace').append(modalContent);

    // 모달 창을 표시하거나 필요한 동작 수행
    // 여기에서는 간단하게 show 메서드를 호출하는 예시를 보여줍니다.
    modalContent.show();
}
 
var stompClient = null;

function connect() {
    var socket = new SockJS('/websocket-example');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function (greeting) {
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
        var userMessage = $("#userMessage").val();
        stompClient.send("/app/chat", {}, JSON.stringify({ 'userMessage': userMessage }));
        $("#userMessage").val('');
    });

    connect();
});
*/

 
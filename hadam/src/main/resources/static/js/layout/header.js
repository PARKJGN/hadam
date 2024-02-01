//header.js



//세션값 : 닉네임, 멤버인덱스
const memberNickname=$("#hidden_session_nicknamevalue").val();
//click_evt에서 이미 선언해서 지워놨삼
//const memberIndex= $("#hidden_session_idxvalue").val();

let getChatRoomListLoading = false; //채팅방 목록이 추가되면 false로 바꿔줘야할것만 같은 그런 기분..
 var stompClient = null;


function getChatRoomList() { 
	if(!getChatRoomListLoading){
	 
    const data = { "memberIndex": memberIndex };

    $.ajax({
        type: "post",
        url: '/chat/getchatroomlist',
        data: data,
        dataType: "json",
        success: function (response) {
			//채팅 목록 div
            var chatRoomListDiv = $('#chatRoomList');
            console.log("날짜 체크용 콘솔 "+response[0].chatRoomLastSendTime);
            //[채팅방 목록 출력]
            // 채팅방 목록을 돌면서 동적으로 목록 생성
            $.each(response, function (index, ChatRoomList) {

/*                var chatRoomItem = $('<div class="chatRoomItem"></div>');
                chatRoomItem.text(ChatRoomList.chatRoomName); // 또는 다른 필요한 속성을 표시
                chatRoomItem.attr('data-chatRoomId', ChatRoomList.chatRoomId);
                chatRoomItem.attr('onclick', 'addmodal(' + ChatRoomList.chatRoomId + ', \'' + ChatRoomList.chatRoomName + '\')');
                // 생성된 목록을 chatRoomListDiv에 추가 */
                 
                var avatarSrc = "images/chattingroom.jpg";
				var titleText = ChatRoomList.chatRoomName;
				var lastChatDate = ChatRoomList.chatRoomLastSendTime
				var lastChatContent = ChatRoomList.chatRoomLastMsg
                //memberUploadImageName
                var chatItem = $('<a class="chat-contacts-item"></a>');
                //chatItem.attr('onclick', 'addmodal(' + ChatRoomList.chatRoomId + ', \'' + ChatRoomList.chatRoomName + '\')');
                chatItem.attr('onclick', 'addmodal(' + ChatRoomList.chatRoomId + ', \'' + ChatRoomList.chatRoomName + '\', \'' + memberUploadImageName + '\')');
				var avatarContainer = $('<div class="dashboard-message-avatar"></div>');
				var avatarImage = $('<img class="프사" src="' + avatarSrc + '" alt="">');
				var textContainer = $('<div class="chat-contacts-item-text"></div>');
				var titleHeader = $('<h4 class="제목들어가야함">' + titleText + '</h4>');
				var lastChatDateSpan = $('<span class="마지막채팅날짜">' + lastChatDate + '</span>');
				var lastChatContentP = $('<p class="마지막채팅내용">' + lastChatContent + '</p>');
 				
				avatarContainer.append(avatarImage);
				textContainer.append(titleHeader);
				textContainer.append(lastChatDateSpan);	
				textContainer.append(lastChatContentP);
				chatItem.append(avatarContainer);
				chatItem.append(textContainer);
                chatRoomListDiv.append(chatItem);
                
                //addmodal(ChatRoomList.chatRoomId,ChatRoomList.chatRoomName);
                   
                
            });
        },
        error: function (error) {
            console.error(error);
        }
    });//end of ajax
    
    getChatRoomListLoading=true;
    }
}

//[채팅방생성]
function addmodal(chatRoomId,chatRoomName,UploadImageName) {
	 if ($('#chattingroomId' + chatRoomId).length ===0){
		//채팅방 헤더 생성
		var header = $('<div class="chat-room-header"></div>')
		var headerH=$('<h3>' + chatRoomName + '</h3>')
		var closeBtn=$('<button>X</button>');
		closeBtn.attr('id','closeBtn'+chatRoomId);
	    // 채팅방 모달 생성
	    var RoomId = chatRoomId
	    var form = $('<form ></form>');
	     form.attr('id','chatingForm'+chatRoomId);
	    var modalContent = $('<div class="chattingroommodal"></div>');
	    var hiddenRoomId = $('<input type="hidden" id="modalChatRoomId">').val(chatRoomId);
	    /*24-02-01 유저 프로필사진 uploadName-정건일*/
	    var hiddenMemberUploadImageName = $('<input type="hidden" id="hiddenMemberUploadImageName">').val(UploadImageName);
		modalContent.attr('id', 'chattingroomId'+chatRoomId);
	    // chat-box 생성
	    var chatBox = $('<div class="chat-box fl-wrap grey-blue-bg" style="height:500px;overflow-y: auto;max-height: 500px;"></div>');
		chatBox.attr('id', 'chattingboard'+chatRoomId);
	    // message-input 생성
	    var messageInput = $('<div class="message-input fl-wrap"></div>');
	    var textarea = $('<textarea placeholder="Type Message"></textarea>');
	    textarea.attr('id', 'userMessage'+chatRoomId);
	    var button = $('<button type="submit"><i class="fal fa-paper-plane"></i></button>');
	
	
		//헤더에 요소 추가하기
		header.append(headerH);
		header.append(closeBtn);
	    // message-input에 textarea와 button 추가
	 
	    form.append(textarea);
	    form.append(button);
	    form.append(hiddenRoomId);
	    form.append(hiddenMemberUploadImageName)
	    messageInput.append(form);
	
	    // modalContent에 chat-box와 message-nput 추가
	    modalContent.append(header);
	    modalContent.append(chatBox);
	    modalContent.append(messageInput);
	
	    // 생성된 모달 창을 body에 추가
	    $('.chattingmodalplace').append(modalContent);
	
	//기존의 채팅 내용을 불러오는 코드
	 $.ajax({
		    type: "GET",
		    url: "http://localhost:8080/mongodb/" + chatRoomId,  // 수정된 엔드포인트로 변경
		    success: function (data) {
		        // 성공적으로 서버에서 응답을 받았을 때 수행할 동작
		        console.log("채팅 내용을 가져왔습니다.", data);
		
		      data.forEach(function (message) {
            showGreeting(message.memberNickname, message.chatRoomId, message.chatContent,message.sendTime,message.memberUploadImageName);
        });
		    },
		    error: function (error) {
		        // 서버에서 오류 응답을 받았을 때 수행할 동작
		        console.error("채팅 내용을 가져오는데 실패했습니다.", error);
		    }
		});

	
		$("#userMessage"+chatRoomId).on("keydown", function (event) {
    // event.which는 눌린 키의 코드를 나타냅니다. 엔터 키의 코드는 13입니다.
    if (event.which === 13) {
        // 엔터 키가 눌렸을 때 폼 제출
        event.preventDefault(); // 기본 동작인 줄 바꿈을 방지
        $("#chatingForm"+chatRoomId).submit(); // 폼 제출
    }
});
		
	$("#closeBtn"+chatRoomId).on('click', function (e) {
		 e.preventDefault();
		hide_on_chattingroom(chatRoomId);
		});	
		
		
		
		
		
			
			
			
	 $("#chatingForm"+chatRoomId).on('submit', function (e) {
		 	 /*24-02-01 프로필사진 각자적용 시키기 -건일*/
	        e.preventDefault();
	        var userMessage = $("#userMessage"+RoomId).val();
	        var UploadImageName=$("#hiddenMemberUploadImageName").val();
	        var sendTime=moment().format("YYYY-MM-DDTHH:mm");
	        /*mongoDB에 데이터 전송 성공시 웹소캣 서버에 채팅을 뿌려주는 함수 -정건일*/
	        if(userMessage != ""){
			$.ajax({
            type: "POST",
            url: "http://localhost:8080/mongodb",
            contentType: "application/json",
            data: JSON.stringify({
                "chatRoomId": RoomId,
			    "memberIndex": memberIndex,
			    "memberNickname": memberNickname,
			    "chatContent": userMessage,
			    "sendTime": sendTime,
			    "memberUploadImageName":UploadImageName
            }),
			success: function (data) {
	        	stompClient.send("/app/chat/"+RoomId, {}, JSON.stringify({ 'userMessage': userMessage,'memberNickname':memberNickname, 'sendTime':sendTime, "memberUploadImageName":UploadImageName }));
                console.log("POST 요청 성공");
                $("#userMessage"+RoomId).val('');
            },error: function (error) {
                // 서버에서 오류 응답을 받았을 때 수행할 동작
                console.error("POST 요청 실패", error);
            }
        });	//end of ajax
			}
	    });

    connect(memberNickname,chatRoomId);

    // 모달 창을 표시하거나 필요한 동작 수행
    // 여기에서는 간단하게 show 메서드를 호출하는 예시를 보여줍니다.
    
		modalContent.show();
		}else{     hide_on_chattingroom(chatRoomId);
				}
 }
 
 

function connect(nickname,RoomId) {
    var socket = new SockJS('/websocket-example');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings/'+ RoomId , function (greeting) {
			console.log("greeting info 잘받아지나 확인");
            showGreeting(JSON.parse(greeting.body).memberNickname,RoomId,JSON.parse(greeting.body).content,JSON.parse(greeting.body).sendTime ,JSON.parse(greeting.body).memberUploadImageName);
        });
    });
}



// 최근에 추가된 채팅의 닉네임을 담는 변수
let latestChatNickname = "";
let latesChatSendTime="";
let latesChatRoomId;
function showGreeting(memberNickname1,RoomId,message,sendTime,UploadImageName) {
	const formattedDate = moment(sendTime).format("MM-DD"); // "01-27"
	const formattedTime = moment(sendTime).format("HH:mm");    // "19:47"
	console.log("정건일의 대모험 성공 ㅋㅋ "+UploadImageName);

	//내가 보낸 메세지가 아니라면 guest에 맞다면 user에 텍스트를 출력해주는 함수
	if(memberNickname1!=memberNickname){
		

		 // 최근에 추가된 채팅의 닉네임과 현재 닉네임이 동일한지 확인
        
	
	console.log("게스트 채팅칸");
	//게스트 채팅칸 틀만들기
	var guestavatarSrc = "images/profile/"+UploadImageName+".jpg";	
	var guestmessageDate = formattedDate;
	var guestmessageTime = formattedTime;
	// 새로운 채팅 메시지 생성
	var guestChatMessage = $('<div class="chat-message chat-message_guest fl-wrap"></div>');
	var guestavatarContainer = $('<div class="dashboard-message-avatar"></div>');
		if (memberNickname1 === latestChatNickname&&latesChatSendTime===formattedTime&&latesChatRoomId===RoomId) {
            guestavatarContainer.attr("style", "display: none;");
        }
	//var guestavatarImage = $('<img src="' + guestavatarSrc + '" alt="">');
	var guestavatarImage = $('<img src="' + guestavatarSrc + '" onerror="this.onerror=null; this.src=\'/images/gal/no_image2.jpg\';">');
	var guestNameSpan = $('<span></span>');
	var guestmessageDateSpan = $('<span class="massage-date">' + guestmessageDate + ' <span>' + guestmessageTime + '</span></span>');
	if (memberNickname1 === latestChatNickname&&latesChatSendTime===formattedTime&&latesChatRoomId===RoomId) {
            guestmessageDateSpan.attr("style", "display: none;");
        }
	var guestmessageContentP = $('<p id="realguestChat">' + message + '</p>');
  
	
	// 요소들을 조립하여 채팅 메시지에 추가
	guestavatarContainer.append(guestavatarImage);
	guestavatarContainer.append(guestNameSpan);
	guestChatMessage.append(guestavatarContainer);
	guestChatMessage.append(guestmessageDateSpan);
	guestChatMessage.append(guestmessageContentP);
	guestChatMessage.find('.dashboard-message-avatar span').text(memberNickname1);
 	$('#chattingboard'+RoomId).append(guestChatMessage);
	// 최근에 추가된 채팅의 닉네임,시간 업데이트
        latestChatNickname = memberNickname1;
        latesChatSendTime	= formattedTime;
        latesChatRoomId=RoomId;

    }else{
	//작성자 채팅칸 틀만들기

	 // 최근에 추가된 채팅의 닉네임과 현재 닉네임이 동일한지 확인
        if (memberNickname1 === latestChatNickname) {
            console.log("!");
        }

	//var useravatarSrc = "images/avatar/1.jpg";
	
	
	//user 프로필사진 uploadname
	var useravatarSrc = "images/profile/"+UploadImageName+".jpg";
	//src="/images/profile/memberUploadImageName.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';"
	var usermessageDate = formattedDate;
	var usermessageTime =formattedTime;
	
	// 새로운 사용자 채팅 메시지 생성
	var userChatMessage = $('<div class="chat-message chat-message_user fl-wrap"></div>');
	var useravatarContainer = $('<div class="dashboard-message-avatar"></div>');
	if (memberNickname1 === latestChatNickname && latesChatSendTime===formattedTime&&latesChatRoomId===RoomId) {
            useravatarContainer.attr("style"," display: none;");
        }
	var useravatarImage = $('<img src="' + useravatarSrc + '" onerror="this.onerror=null; this.src=\'/images/gal/no_image2.jpg\';">');
	var userNameSpan = $('<span></span>');
	var usermessageDateSpan = $('<span class="massage-date">' + usermessageDate + ' <span>' + usermessageTime + '</span></span>');
	if (memberNickname1 === latestChatNickname && latesChatSendTime===formattedTime&&latesChatRoomId===RoomId) {
            usermessageDateSpan.attr("style"," display: none;");
        }
	var usermessageContentP = $('<p id="realuserChat">' + message + '</p>');
	 
	// 요소들을 조립하여 사용자 채팅 메시지에 추가
	useravatarContainer.append(useravatarImage);
	useravatarContainer.append(userNameSpan);
	userChatMessage.append(useravatarContainer);
	userChatMessage.append(usermessageDateSpan);
	userChatMessage.append(usermessageContentP);
	//작성자 채팅칸 틀만들기
	userChatMessage.find('.dashboard-message-avatar span').text(memberNickname1);
	$('#chattingboard'+RoomId).append(userChatMessage);
	
	// 최근에 추가된 채팅의 닉네임,시간 업데이트
        latestChatNickname = memberNickname1;
        latesChatSendTime	= formattedTime;
        latesChatRoomId=RoomId;
	}
	
	scrollToBottom(RoomId);
	
	
}


function scrollToBottom(RoomId) {
    var chatBox = $("#chattingboard"+RoomId);
    chatBox.scrollTop(chatBox[0].scrollHeight);
}



function hide_on_chattingroom(chatRoomId){
	var chattingroomdiv = $("#chattingroomId"+chatRoomId);
	
	 // 만약 chattingroomdiv가 숨겨져 있지 않다면
    if (!chattingroomdiv.is(":hidden")) {
     chattingroomdiv.hide();

    } else {
        // 보여주기
        chattingroomdiv.show();
      	scrollToBottom(chatRoomId);
        
        
    }
}


 
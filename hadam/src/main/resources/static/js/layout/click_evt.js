
//세션에서 받아온 멤버 인덱스 -건일
let memberIndex= $("#hidden_session_idxvalue").val();
//세션에서 받아온 멤버 프로필사진 주소 -건일 
let memberUploadImageName= $("#hidden_session_memberUploadImageNamevalue").val();

let getalarmlistpandan =false;

//[몽고디비에서 알림내용 불러오기 -건일]
document.addEventListener('DOMContentLoaded', function() {
	var alarmLink = document.getElementById('alarmLink');

	alarmLink.addEventListener('click', function() {
		$("#alarmCountPointer").removeClass("fa-solid").addClass("fa-regular");
		var alramUserMenu = document.querySelector('.alram-user-menu');
		alramUserMenu.classList.toggle('hu-menu-vis');
		
		if(!getalarmlistpandan){
		$.ajax({
		    type: "GET",
		    url: `http://localhost:8080/mongodb/getalarm/${memberIndex}`,  // 수정된 엔드포인트로 변경
		    success: function (data) {
		        // 성공적으로 서버에서 응답을 받았을 때 수행할 동작
		        console.log("알림 내용을 가져왔습니다.", data);
		        
		         if (data.length > 0) {
					 console.log("리스트에 뭔가 있어서 알림이없다는 문구를 삭제");
					  $("#nonealram").remove();}
					  
				let aTageHref ="/index";
		      data.forEach(function (alarm) {
            const newLi = document.createElement("li");
			const newLink = document.createElement("a");
			const hiddenId=document.createElement("input");
			hiddenId.type = "hidden";
			hiddenId.value = alarm.id;
			
			
		switch (alarm.alarmContent) {
		  case "새로운 댓글이 달렸습니다.":
		    aTageHref ="/community/boardView?boardId="+alarm.boardId;
		    newLink.textContent=alarm.alarmContent;
		    break;
		  case "새로운 참가 신청이 들어왔습니다.":
			aTageHref =`/mypage/mypageEntry`;
			newLink.textContent = alarm.boardName+" 게시물의 "+alarm.alarmContent;
		    break;
		    //추후에 수정 (어떤 페이지로 보낼지)-건일
		  case "참가신청이 거절되었습니다.":
			aTageHref ="/mypage/mypageEntry";
			newLink.textContent = alarm.boardName+" 게시물의 "+alarm.alarmContent;
		    break;
		  case "참가신청이 수락되었습니다.":
			aTageHref ="/mypage/mypageEntry";
			newLink.textContent = alarm.boardName+" 게시물의 "+alarm.alarmContent;
		    break;
		  // 추가적인 case 문들
		  default:
		    // expression이 어떠한 case에도 일치하지 않을 때 실행되는 코드
		}
			
			
			// 이벤트 데이터를 <a> 요소의 텍스트 콘텐츠로 설정
			//newLink.textContent = alarm.boardName+" 게시물의 "+alarm.alarmContent;
			console.log("mongodb 알림의 id값"+alarm.id);
			// <a> 요소의 href 속성을 설정 (예시로 'index.html'로 설정)
			newLink.href = aTageHref;
			newLink.setAttribute("onclick", "handleClick(this)");
			// <a> 요소를 <li> 요소에 추가
			newLi.appendChild(newLink);
			newLi.appendChild(hiddenId);
			// 목록에 <li> 요소 추가
			alramUserMenu.appendChild(newLi);
        });
		    },
		    error: function (error) {
		        // 서버에서 오류 응답을 받았을 때 수행할 동작
		        console.error("채팅 내용을 가져오는데 실패했습니다.", error);
		    }
		});//end of ajax;
		getalarmlistpandan=true;
		}//end of if
		
		
	});

});




/*emitter 구독 하는 코드 - 정건일*/

//userid session값 적용 시켜서 구독하기
if(memberIndex){
	console.log("sse구독 시작");
const eventSource = new EventSource(`http://localhost:8080/notifications/subscribe/${memberIndex}`);


//[알림내용 실시간 등록-건일]
//알림 event가 발생하면 알림 창에 정보를 추가해주는 함수.
document.addEventListener('DOMContentLoaded', function() {
	
	//1.alram창의 div를 가져온다.
	const alramUserMenu = document.querySelector('.alram-user-menu');

//sse라는 이름으로 evt가 발생하면 감지해서 어떤 알림이 왔는지 noti해주는 함수 -건일
	eventSource.addEventListener('sse', event => {
		//event.data에 알림내용/href에 추가해야할 데이터값을 한번에 보내기 때문에 정제해줘야한다.
		
		//console.log("q23ytg2yg34onjtg34iujbnti34jhkbnt"+event.data);
		let splittedData1 = event.data.split('/');

		// 게시물 제목or게시물 넘버
		let splitFirst = splittedData1[0];
		// 진짜 내용
		let splitSecond=splittedData1[1];
		
		if(splitSecond!=="EventStream Created"){
		$("#nonealram").remove();
		//알림이 도착했을 때 도착표시로 바꿔주는 코드
		$("#alarmCountPointer").removeClass("fa-regular").addClass("fa-solid");
	
		
		//event.data에 알림내용/href에 추가해야할 데이터값을 한번에 보내기 때문에 정제해줘야한다.
		let splittedData = event.data.split('/');

		// 게시물정보
		let splitFirst = splittedData[0];
		// 알림내용
		let splitSecond = splittedData[1];
		//href태그의 재료로 사용될 녀석 (ex. 게시글num)
		let aTageHref ="";
		const newLi = document.createElement("li");
		const newLink = document.createElement("a");
		
		console.log("2번확인품"+splitSecond);
		//switch문을 사용해서 a태그에 추가될 attr을 지정한다.
		//알림내용마다 알람을 눌렀을때 req가 다르기때문이다.
		switch (splitSecond) {
		  case "새로운 댓글이 달렸습니다.":
			  newLink.textContent = splitSecond;
		    aTageHref ="/community/boardView?boardId="+splitFirst;
		    break;
		  case "새로운 참가 신청이 들어왔습니다.":
			  newLink.textContent = splitFirst+" 게시글의 "+splitSecond;
			aTageHref =`/mypage/mypageEntry`;

		    break;
		    //추후에 어떤 페이지로 던져질지 고민(-건일)
		  case "참가신청이 거절되었습니다.":
			  newLink.textContent = splitFirst+" 게시글의 "+splitSecond;
			aTageHref ="/mypage/mypageEntry";

		    break;
		  case "참가신청이 수락되었습니다.":
			  newLink.textContent = splitFirst+" 게시글의 "+splitSecond;
			aTageHref ="/mypage/mypageEntry";

		    break;
		  // 추가적인 case 문들
		  default:
		    // expression이 어떠한 case에도 일치하지 않을 때 실행되는 코드
		}
		
 
				
				
				//추가
	/*		const hiddenId=document.createElement("input");
			hiddenId.type = "hidden";
			hiddenId.value = alarm.id;*/
				
				//추가
				// 이벤트 데이터를 <a> 요소의 텍스트 콘텐츠로 설정
				 
				// <a> 요소의 href 속성을 설정 (예시로 'index.html'로 설정)
				newLink.href = aTageHref;

				// <a> 요소를 <li> 요소에 추가
				newLi.appendChild(newLink);
				//newLi.appendChild(hiddenId);
		
				// 목록에 <li> 요소 추가
				alramUserMenu.appendChild(newLi);
		}
	});
})
}else{console.log("로그아웃 상태입니다.")}


/*document.addEventListener('DOMContentLoaded', function() {
	const alramUserMenu = document.querySelector('.alram-user-menu');

	eventSource.addEventListener('sse', event => {
		
		console.log("이벤트발생시 발동하는 함수");
		// 새로운 이벤트가 도착할 때마다 <li> 요소와 <a> 요소를 생성하고 내용을 설정하여 목록에 추가
		const newLi = document.createElement("li");
		const newLink = document.createElement("a");

		// 이벤트 데이터를 <a> 요소의 텍스트 콘텐츠로 설정
		newLink.textContent = event.data;

		// <a> 요소의 href 속성을 설정 (예시로 'index.html'로 설정)
		newLink.href = "index.html";

		// <a> 요소를 <li> 요소에 추가
		newLi.appendChild(newLink);

		// 목록에 <li> 요소 추가
		alramUserMenu.appendChild(newLi);


	});
})*/
/*emitter 구독 하는 코드*/


//채팅목록 껏다켯다
document.getElementById('chatlist').addEventListener('click', function() {
    
        var chatRoomList = document.getElementById('chatRoomList');

    if (chatRoomList.style.display === 'none' || chatRoomList.style.display === '') {
        chatRoomList.style.display = 'block';
    } else {
        chatRoomList.style.display = 'none';
    }
   
});


  function handleClick(element) {
    var id = $(element).siblings("input[type='hidden']").val();
    alramDelete(id);
  }

function alramDelete(id){
		$.ajax({
		    type: "DELETE",
		    url: `http://localhost:8080/mongodb/deleteAlarm/`+id,  // 수정된 엔드포인트로 변경
		    success: function (data) {
		   
        },error: function (error) {
		        console.error("알림이 삭제되는데 실패했습니다.", error);
		    }
		});//end of ajax;
}
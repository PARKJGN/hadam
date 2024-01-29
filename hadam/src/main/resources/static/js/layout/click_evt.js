let memberIndex= $("#hidden_session_idxvalue").val();



document.addEventListener('DOMContentLoaded', function() {
	var alarmLink = document.getElementById('alarmLink');

	alarmLink.addEventListener('click', function() {
		var alramUserMenu = document.querySelector('.alram-user-menu');
		alramUserMenu.classList.toggle('hu-menu-vis');
	});

});




/*emitter 구독 하는 코드 - 정건일*/

//userid session값 적용 시켜서 구독하기
if(memberIndex){
	console.log("sse구독 시작");
const eventSource = new EventSource(`http://localhost:8080/notifications/subscribe/${memberIndex}`);


document.addEventListener('DOMContentLoaded', function() {
	const alramUserMenu = document.querySelector('.alram-user-menu');

	eventSource.addEventListener('sse', event => {
		
		console.log("이벤트발생시 발동하는 함수"+event.data);
		
		
		let notifyComment="";
		let aTageHref ="";
		switch (event.data) {
		  case "새로운 댓글이 달렸습니다.":
		    aTageHref =`/community/boardView?${memberIndex}`;
		    break;
		  case "새로운 참가 신청이 들어왔습니다.":
		    // expression이 value2와 일치할 때 실행되는 코드
		    break;
		  // 추가적인 case 문들
		  default:
		    // expression이 어떠한 case에도 일치하지 않을 때 실행되는 코드
		}
		
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

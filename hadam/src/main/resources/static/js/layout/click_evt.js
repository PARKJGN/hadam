document.addEventListener('DOMContentLoaded', function() {
	var alarmLink = document.getElementById('alarmLink');

	/*alarmLink.addEventListener('click', function() {
		var alramUserMenu = document.querySelector('.alram-user-menu');
		alramUserMenu.classList.toggle('hu-menu-vis');
	});*/

});




/*emitter 구독 하는 코드 - 정건일*/

//userid session값 적용 시켜서 구독하기
//const eventSource = new EventSource('http://localhost:8080/notifications/subscribe/{userid}');

document.addEventListener('DOMContentLoaded', function() {
	const alramUserMenu = document.querySelector('.alram-user-menu');

	eventSource.addEventListener('sse', event => {

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
/*emitter 구독 하는 코드*/

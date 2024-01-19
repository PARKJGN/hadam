document.addEventListener('DOMContentLoaded', function() {
	var alarmLink = document.getElementById('alarmLink');

	alarmLink.addEventListener('click', function() {
		var alramUserMenu = document.querySelector('.alram-user-menu');
		alramUserMenu.classList.toggle('hu-menu-vis');
	});

});

/*const eventSource = new EventSource("/see/stream");

eventSource.onmessage = function (event) {
	// 데이터가 "data:"로 시작하는 형태일 때만 파싱
	if (event.data.startsWith("data: ")) {
		const data = JSON.parse(event.data.substring(6)); // "data: " 이후의 부분만 추출하여 파싱
		console.log("Received event:", data.message);
		document.getElementById("sseOutput").innerText = data.message;
	}
};*/

/*emitter 구독 하는 코드*/
const eventSource = new EventSource('http://localhost:8080/notifications/subscribe/1');

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

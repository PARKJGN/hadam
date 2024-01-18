/**
 * 
 */


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

eventSource.addEventListener('sse', event => {
	console.log(event);
});

/*emitter 구독 하는 코드*/


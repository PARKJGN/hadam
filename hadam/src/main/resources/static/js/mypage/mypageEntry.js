$(function(){
	
	/* 비밀번호 변경버튼 클릭 후 메세지 */
	var msg = $('#msg').text()
	console.log(msg)
	if(msg.length > 0){
		alert($('#msg').text());
		$('#msg').text('');
	}
	
})
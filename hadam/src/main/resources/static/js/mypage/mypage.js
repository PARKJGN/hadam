$(function(){
	var msg = $('#msg').text()
	if(msg.length > 0){
		alert($('#msg').text());
		$('#msg').text('');
	}
	
}) 
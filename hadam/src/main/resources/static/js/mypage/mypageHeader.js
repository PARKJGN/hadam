$(function(){
	
	$.ajax({
		url : "/mypage/mypageHeaderInfo",
		type : "post",
		success : function(result){
			console.log(result)
			$('#scheduleNum').text(result[0]);
			$('#scheduleShareNum').text(result[1]);
			$('#boardNum').text(result[2]);
		},
		error : function(err){
			
		}
	})
})
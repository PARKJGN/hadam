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
	
	
	
	/*프로필 수정 눌렀을 때*/
	$("#profileModify").on('click', function(){
		var profileModify = $("#profileModify").val();
		/*프로필 수정하려고 눌렀을때*/
		if(profileModify=='프로필 수정'){
			$("#profileModify").text('저장');
			$('#profileImage').submit();
		/*저장하려고 눌렀을때*/	
		}else{
			$("#profileModify").text('수정');
			
		}
	})
	
	
	
})
$(function(){
	
	 $(".password_comment").removeAttr("style")
	
	/* 비밀번호 변경버튼 클릭 후 메세지 */
	var msg = $('#msg').text()
	if(msg.length > 0){
		alert($('#msg').text());
		$('#msg').text('');
	}
	
	
	
	
	
	/* 비밀번호 정규식 및 일치 확인 */
	$('#memberNewPassword').on('focus keyup', function() {
		var member_password = $('#memberNewPassword').val();

		/* 비밀번호 정규식 검사 문자, 숫자, 특수 문자 포함 8~15자 */
		const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/g;

		/* 입력한 비밀번호가 정규식에 맞으면 */
		if (passwordPattern.test(member_password)) {
			$('.password_comment').text(" 사용가능한 비밀번호 입니다")
			$('.password_comment').css("color", "blue");
			form_password = member_password
			/* 입력한 비밀번호가 정규식에 맞지 않으면 */
		} else {
			$('.password_comment').text(" 문자 숫자 특수문자 조합에 8~15자리")
			$('.password_comment').css("color", "red");
		}

	})
	
	
	/* 비밀번호 확인이 비밀번호와 일치하는지 확인 */
	$('#memberNewPasswordCheck').on('foucs keyup', function() {
		var confirm_member_password = $('#memberNewPasswordCheck').val();

		/* 일치할때 */
		if (confirm_member_password == $('#memberNewPassword').val()) {
			$('.passwordCheck_comment').text('');
			form_confirm_password = confirm_member_password;
			/* 일치하지 않을 때 */
		} else {
			$('.passwordCheck_comment').css("color", "red");
			$('.passwordCheck_comment').text('비밀번호가 일치하지 않습니다');
		}
	})

	
}) 
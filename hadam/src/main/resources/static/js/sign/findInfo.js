$(function() {


	/* 핸드폰 문자 인증 */
	$('#member_phone_check').on("click", function() {
		var member_phone = $('#member_phone').val()
		/*alert(member_phone)*/

		if (member_phone.length < 11) {
			alert('핸드폰 번호를 확인해주세요');
		} else if (member_phone.length == 11) {

			$.ajax({
				url: "/signup/memberPhoneCheck",
				type: 'post',
				data: {
					"phone": member_phone,
					"findInfo": 1
				},
				success: function(result) {
					/*문자보내기 성공*/
					if (result != "0") {
						alert('인증번호를 전송하였습니다. 임증번호 입력 후에 확인버튼을 눌러주세요')
						$('#member_phone_checknum').focus();
						clearInterval(countdown);
						seconds = 180; // 3분(180초)
						updateCountdown();
						// 1초마다 카운트다운 업데이트
						countdown = setInterval(updateCountdown, 1000);
						/* 인증번호 맞는지 확인하는 부분 */
						$('#btn_member_phone_checknum').on('click', function() {
							if ($('#member_phone_checknum').val() == result) {
								$.ajax({
									url: "/signin/getMemberId",
									type: 'post',
									data: {
										"phone": member_phone
									},
									success: function(result) {
										$('#memberId').val(result)
										$('#form_memberId').val(result)
									},
									error : function(error){
										console.log('오류')
									}
								})
								alert("인증번호가 확인되었습니다 아이디를 확인해주세요");
								clearInterval(countdown);
								$('#btn_phonenumber_change_completion').removeClass('disa');
								$('#btn_phonenumber_change_completion').css("background-color", "#F9B90F");
							} else {
								alert("인증번호가 맞지 않습니다");
							}
						})


						/*문자보내기 실패*/
					}
					else {
						alert('오류발생 다시 시도해주세요');
					}
				},
				error: function(err) {
					alert("오류");
					console.log("오류 : " + err);
				}
			})
		}
	})


	/* 전화번호 인증 count 함수 */
	let seconds;   // 남은 시간 변수
	let countdown; // 카운트다운을 관리하는 변수
	const updateCountdown = function() {
		if (seconds >= 0) {
			const minutes = Math.floor(seconds / 60);
			const remainingSeconds = seconds % 60;
			$('#check_phone_count').text(`${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`);
			seconds--;
		} else {
			clearInterval(countdown);
			alert('시간이 만료되었습니다 인증번호를 다시 받아주세요');
			$('#btn_member_phone_checknum').addClass('disa')   /*확인버튼 안되게 다시 설정 */
		}
	};



	$('#btn_phonenumber_change_completion').on('click', function() {
		$('#phoneField').hide();
		$('#passwordField').show();
		
	})



	$(".password_comment").removeAttr("style")


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
$(function(){
	
	/* 닉네임 글자 수 안내  */
	$('#member_nickname').on('foucs keyup', function() {
		var member_nickname = $('#member_nickname').val();

		if (member_nickname.length < 3) {
			$('.nickname_comment').text('3글자 이상이여야 합니다');
			$('.nickname_comment').css("color", "red");
		} else {
			$('.nickname_comment').text('');
		}
	})
	
	
	/* 닉네임 중복검사 */
	$('#member_nickname_check').on('click', function() {
		var member_nickname = $('#member_nickname').val();
		if (member_nickname.length > 2) {
			$.ajax({
				url: '/signup/memberNicknameCheck',
				type: 'post',
				data: { "nickname": member_nickname },
				success: function(result) {
					/* true면 중복되는 닉네임 없음 */
					if (result) {
						$('.nickname_comment').text("사용가능한 닉네임 입니다");
						$('.nickname_comment').css("color", "blue");
						form_nickname = member_nickname;
						/* false면 중복되는 닉네임 있음 */
					} else {
						$('.nickname_comment').text("사용중인 닉네임 입니다");
						$('.nickname_comment').css("color", "red");
					}
				},
				error: function(err) {
					console.log('닉네임 오류')
				}
			})
		} else {
			$('.nickname_comment').text("2글자 이상이여야 합니다");
			$('.nickname_comment').css("color", "red");
		}
	})
	
	/* 핸드폰 문자 인증 */
	$('#member_phone_check').on("click", function() {
		var member_phone = $('#member_phone').val()
		/*alert(member_phone)*/

		if (member_phone.length < 11) {
			$('.phone_comment').text('핸드폰 번호를 확인해주세요');
		} else if (member_phone.length == 11) {
			$('.phone_comment').text('');
			$.ajax({
				url: "/signup/memberPhoneCheck",
				type: 'post',
				data: { "phone": member_phone },
				success: function(result) {
					/*문자보내기 성공!*/
					if (result != "0") {
						/*인증번호 받는 모달 창 띄우기*/
						
						$('#input_check_phone').focus();
						clearInterval(countdown);
						seconds = 180; // 3분(180초)
						updateCountdown();
						// 1초마다 카운트다운 업데이트
						countdown = setInterval(updateCountdown, 1000);
						
						$('#btn_check_phone').on('click', function() {
							if ($('#input_check_phone').val() == result) {
								$('.reg-modal , .reg-overlay2').fadeOut(200);
								$("html, body").removeClass("hid-body");
								$('#member_phone_check').val('인증완료');
								$('#member_phone_check').addClass('disa');
								$('#member_phone').addClass('disa');
								$('#member_phone_check').css('background', '#3AACED');
								$('#member_phone_check').css('color', '#fff');
								form_phone = member_phone;
							}
						})

						/*문자보내기 실패*/
					} else if (result == "1") {
						$('.phone_comment').text('이미 가입된 전화번호 입니다');
					}
					else {
						$('.phone_comment').text('오류발생 다시 시도해주세요');
					}
				},
				error: function(err) {
					alert("오류");
					console.log("오류 : " + err);
				}
			})
		}
	
	})
	
})
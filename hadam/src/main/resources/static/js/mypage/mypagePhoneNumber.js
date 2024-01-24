$(function() {

	/* 비밀번호 변경버튼 클릭 후 메세지 */
	var msg = $('#msg').text()
	if(msg.length > 0){
		alert($('#msg').text());
		$('#msg').text('');
	}

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
				data: { "phone": member_phone },
				success: function(result) {
					/*문자보내기 성공*/
					if (result != "0") {
						$('#member_phone_checknum').focus();
						clearInterval(countdown);
						seconds = 180; // 3분(180초)
						updateCountdown();
						// 1초마다 카운트다운 업데이트
						countdown = setInterval(updateCountdown, 1000);
						/* 인증번호 맞는지 확인하는 부분 */
						$('#btn_member_phone_checknum').on('click', function() {
							if ($('#member_phone_checknum').val() == result) {
								alert("인증번호가 확인되었습니다 완료하기를 눌러주세요");
								$('#btn_phonenumber_change_completion').removeClass('disa');
								$('#btn_phonenumber_change_completion').css("background-color", "#F9B90F");
							}else{
								alert("인증번호가 맞지 않습니다");
							}
						})


						/*문자보내기 실패*/
					} else if (result == "1") {
						alert('이미 가입된 전화번호 입니다');
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
			/*$('#btn_check_phone').addClass('disa')   확인버튼 안되게 다시 설정 */
		}
	};

}) 
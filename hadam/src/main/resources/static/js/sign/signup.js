/* 
	  파일명 	signup.js
	페이지명	기본 회원가입 페이지 
	용도		회원가입시 필요 조건충족 확인 등
	작성자 	최성익  

 */

$(function() {

	/* 약관동의 하고 다음 버튼 누르는지 확인하는 로직  */
	$('.custom-form').on('click', '#check-a', function() {
		/* 동의 체크 되어있으면 */
		if ($('#check-a').is(':checked')) {
			/* 다음버튼에 비활성화 시키는 클래스 제거 */
			$('#rule_agree').removeClass("disa");

			/* 동의 체크 안 되어있으면 */
		} else {
			/* 다음버튼에 비활성화 시키는 클래스 추가 */
			$('#rule_agree').addClass("disa");
		}
	})


	let form_id = null;
	let form_password = null;
	let form_confirm_password = null;
	let form_phone = null;
	let form_nickname = null;
	let form_birth = null;





	/* 아이디 중복체크 */
	$('#member_id_check').on("click", function() {
		var member_id = $('#member_id').val()
		// alert(member_id)
		/* 아이디 정규식 검사 영문 숫자 조합으로 5~13자 */
		const idPattern = /^[a-zA-Z][0-9a-zA-Z]{4,12}$/g

		/* 아이디 정규식에 맞으면 */
		if (idPattern.test(member_id)) {
			/* 정규식에 포함되는 아이디 중복확인 진행 */
			$.ajax({
				url: "/signup/memberIdCheck",
				type: 'post',
				data: { "id": member_id },
				success: function(result) {
					/* true면 중복되는 아이디가 없음 */
					if (result) {
						$('.confirm_id_comment').text("사용가능한 아이디 입니다");
						$('.confirm_id_comment').css("color", "blue");
						form_id = member_id;
						/* false면 중복되는 아이디 있음 */
					} else {
						$('.confirm_id_comment').text("사용중인 아이디 입니다");
						$('.confirm_id_comment').css("color", "red");
					}
				},
				error: function(err) {
					alert("오류");
					console.log("오류 : " + err);
				}
			})
			/* 아이디 정규식에 맞지 않으면 */
		} else {
			/* 아이디 생성규칙 표기 */
			$('.confirm_id_comment').css("color", "red");
			$('.confirm_id_comment').text("영문 숫자 조합에 5~13자리");
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
						$('.reg-modal , .reg-overlay2').fadeIn(200);
						$("html, body").addClass("hid-body");
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

	/* 인증번호 모달 창 닫기 */
	$('#btn_cancel_check_phone').on('click', function(e) {
		e.preventDefault();
		$('.reg-modal , .reg-overlay2').fadeOut(200);
		$("html, body").removeClass("hid-body");
		$('#btn_check_phone').removeClass('disa')
	})


	/* 비밀번호 정규식 및 일치 확인 */
	$('#member_password').on('focus keyup', function() {
		var member_password = $('#member_password').val();

		/* 비밀번호 정규식 검사 문자, 숫자, 특수 문자 포함 8~15자 */
		const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/g;

		/* 입력한 비밀번호가 정규식에 맞으면 */
		if (passwordPattern.test(member_password)) {

			$('.password_comment').text("사용가능한 비밀번호 입니다")
			$('.password_comment').css("color", "blue");
			form_password = member_password
			/* 입력한 비밀번호가 정규식에 맞지 않으면 */
		} else {
			$('.password_comment').text("문자 숫자 특수문자 조합에 8~15자리")
			$('.password_comment').css("color", "red");
		}

	})

	/* 비밀번호 확인이 비밀번호와 일치하는지 확인 */
	$('#confirm_member_password').on('foucs keyup', function() {
		var confirm_member_password = $('#confirm_member_password').val();

		/* 일치할때 */
		if (confirm_member_password == $('#member_password').val()) {
			$('.confirm_password_comment').text('');
			form_confirm_password = confirm_member_password;
			/* 일치하지 않을 때 */
		} else {
			$('.confirm_password_comment').text('비밀번호가 일치하지 않습니다');
		}
	})

	/* 닉네임 글자 수 안내  */
	$('#member_nickname').on('foucs keyup', function() {
		var member_nickname = $('#member_nickname').val();

		if (member_nickname.length < 3) {
			$('.nickname_comment').text('2글자 이상이여야 합니다');
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

	/* 전화번호 - 추가해주기 */
	/*	$('#member_phone').on('foucs keyup', function() {
			var member_phone = $('#member_phone').val();
			//this.value = this.value.replace(/[^0-9.]{,11}/g, '').replace(/(\..*)\./g, '$1');
			$('#member_phone').val(member_phone.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
			if(member_phone.length==11){
				format_phone = member_phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				
				$('#member_phone').val(format_phone);
			}
	
		})*/



	/* 생년월일 - 추가해주기 */
	$('#member_birth').on('foucs keyup', function() {
		/*		var member_birth = $('#member_birth').val();
				$('#member_birth').val(member_birth.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
				if(member_birth.length == 8){
					format_birth = member_birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
					$('#member_birth').val(format_birth)
				}*/
		if (this.value.length > 8) {
			this.value = this.value.substr(0, 8);
		} else if (this.value.length == 8) {
			form_birth = this.value;
		}
	})

	/* 전화번호 인증 함수 */
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
			$('#check_phone_coment').text('취소 후 다시 시도해주세요')
			$('#btn_check_phone').addClass('disa')
		}
	};

	form_sex = $('input[name=select]:checked').val();

	$('#signup_basicform').hide();							/* 개인정보 입력완료 진짜 버튼 숨기기 */
	$('#hide_signup_basicform').on('click', function() {

		if ($('#member_id').val() != form_id) {
			alert('아이디를 확인해주세요');
			return false;
		}
		if ($('#member_password').val() != form_password) {
			alert('비밀번호를 확인해주세요');
			return false;
		}
		if ($('#confirm_member_password').val() != form_confirm_password) {
			alert('비밀번호 확인칸을 확인해주세요');
			return false;
		}
		if (form_password != form_password) {
			alert('비밀번호와 비밀번호 확인이 동일하지 않습니다');
			return false;
		}
		if ($('#member_phone').val() != form_phone) {
			alert('핸드폰 인증을 확인해주세요');
			return false;
		}
		if ($('#member_nickname').val() != form_nickname) {
			alert('닉네임을 확인해주세요');
			return false;
		}
		if ($('#member_birth').val() != form_birth) {
			alert('생년월일를 확인해주세요');
			return false;
		}
		if ($('input[name=member_sex]:checked').val() != '여자' && $('input[name=member_sex]:checked').val() != '남자') {
			alert('성별을 선택해주세요');
			return false;
		}

		$('#signup_basicform').trigger("click");

	})


	/* 회원가입 완료 번튼 눌렀을 때 */
	$('#signup_completion').hide();
	$('#hide_signup_completion').on('click', function() {

		let checkedCategory = [];
		$('input:checkbox[class~=small]').each(function() {
			if ($(this).is(':checked') == true) {
				/*console.log($(this)[0].id);*/
				checkedCategory.push($(this)[0].id);
			}
		})
		/*console.log(checkedcCtegory);*/


		$.ajax({
			url: '/signup/signupCompletion',
			type: 'post',
			data: {
				'memberId': form_id,
				'memberPassword': form_password,
				'memberPhoneNumber': form_phone,
				'memberNickname': form_nickname,
				'memberSex': $('input[name=member_sex]:checked').val(),
				'memberBirth': form_birth,
				'checkedCategory': checkedCategory
			},
			success: function(result) {
				if (result == 1) {
					$('#signup_completion').trigger("click");
				} else {
					alert('네트워크에 문제가 있습니다. 잠심 후 시도해주세요');
				}

			},
			error: function(err) {
				alert('네트워크에 문제가 있습니다. 잠심 후 시도해주세요');
			}


		})


	})

	/* 카테고리 탭에서 중분류 눌렀을때 소분류 태그 토글 */
	/*소분류 숨기기*/
	$('div.small').hide();
	/*중분류 태그 누르면*/
	$('.ks-cboxtags').find('.middle').on('change', function() {

		var middle = $(this)
		/*누른 중분류 태그의 클래스 명의 div가 토글됨*/
		$(`.${$(this)[0].id}`).toggle('2000');
		/*누른 중분류 태그 아래 input 태그(소분류)중 체크 된거 있으면 체크 된채로 토글*/
		if ($(`.${$(this)[0].id}`).find('input').is(':checked')) {
			middle.prop('checked', true);
		}

	})







})

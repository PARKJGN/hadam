$(function() {

	$('#loginbtn').click(function() {

		var memberId = $('#memberId').val();
		var memberPassword = $('#memberPassword').val();

		$.ajax({
			url: "/signin/loginCheck",
			type: "post",
			data: {
				"memberId": memberId,
				"memberPassword": memberPassword
			},
			success: function(result) {
				console.log('컨트롤러 결과 : ', result);

				if (result == 1) {
					console.log('로그인 성공')
					location.reload();
				} else if (result == 0) {
					console.log('로그인 실패')
					$('.login_comment').text("아이디와 비밀번호를 확인해주세요");
				} else if (result == 2) {
					console.log('관리자 로그인')
					/*location.href(""); 나중에 관리자 페이지 새기면*/
				} else {
					console.log('오류');
				}
			}, error: function(err) {
				alert("오류");
				console.log(err);
			}

		});

	});

	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "sIGCFQ1qvJKFf37n_gIA", //내 애플리케이션 정보에 cliendId
			callbackUrl: "http://localhost:8080/signup/naverCallback", // 내 애플리케이션 API설정의 Callback URL
			isPopup: false,
			callbackHandle: true
		}
	);

	naverLogin.init();

/* 네이버 정보 동의를 하고 창을 닫으면 콜백url이 불러지면서 status가 들어옴  */
	window.addEventListener('load', function() {
		naverLogin.getLoginStatus(function(status) {
			if (status) {

				const nickName = naverLogin.user.getNickName();
				/*const profile = naverLogin.user.getProfile_image();*/
				const gender = naverLogin.user.getGender();
				const birthday = naverLogin.user.getBirthday();
				const birthyear = naverLogin.user.getBirthyear();
				const phonenumber = (naverLogin.user.getMobile()).replace(/\-/g,'');
				const id = naverLogin.user.getId();

				const birth = birthyear + birthday.replace('-','');

				const password = id;

				

				console.log(naverLogin);
				
				const accesstoken = naverLogin.accessToken.accessToken

				/*naverLogin.reprompt();*/ //사용자 정보 재동의필요시 동의창 다시 띄움

				/* 네이버 정보로 회원가입 시도 */
				$.ajax({
					type: 'post',
					url: '/signup/naverSignup',
					data: {
						"memberNickname": nickName,
						"memberSex": gender,
						"memberBirth": birth,
						"memberPhoneNumber": phonenumber,
						"memberId": id,
						"memberPassword": password,
						"memberApi": 1
					},
					/*dataType: 'text',*/
					success: function(result) {
						/* success 1 : 기가입  */ /* success 0 : 가입해야 할 경우 */
						if (result == 1 || result == 0) {
							/* 입력 시 데이터 전송으로 자동로그인 처리 및 메인 페이지 이동 */
							/*alert('로그인 직전')*/
							$.ajax({
								type: 'post',
								url: '/signin/naverLogin',
								data: {
									"memberId": id,
									"memberPassword": password,
									"accessToken" : accesstoken
								}
							});
							location.replace("/index");

						} else {
							console.log('오류 발생')
						}
					},
					error: function(result) {
						console.log('오류 발생')
					}
				})

			} /*else alert("콜백 실패");*/

		});
	});
/*네이버 로그인 로그아웃 링크*/
/*https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=sIGCFQ1qvJKFf37n_gIA&client_secret=Wq_cQNV4qs&access_token=
=======




/*https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=sIGCFQ1qvJKFf37n_gIA&client_secret=Wq_cQNV4qs&access_token=AAAAOsxomvXRIwIiUizKqFtP_-RAuKjtm7ajMSvyGaNVtMvH24EuL192Cw9fgggYujs4Am4miv_6s8v8KXVFsDelpno
>>>>>>> branch '20240119_seoungik' of https://github.com/PARKJGN/hadam.git
&state=af2d41f3-e90c-4334-ba64-272b1c9e8daa&service_provider=NAVER*/


/*네이버 로그인 어쩌구 저쩌구*/
	/*var testPopUp;
	function openPopUp() {
		testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp() {
		testPopUp.close();
	}

	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
		}, 1000);


	}*/







})
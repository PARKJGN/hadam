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




	/*네이버 SDK*/
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "sIGCFQ1qvJKFf37n_gIA", 							// 내 애플리케이션 정보에 cliendId
			callbackUrl: "http://localhost:8080/signup/naverCallback", 	// 내 애플리케이션 API설정의 Callback URL
			isPopup: false,
			callbackHandle: true
		}
	);

	naverLogin.init();

	/* 네이버 정보 동의를 하고 창을 닫으면 콜백url이 불러지면서 status가 들어옴  */
	window.addEventListener('load', function() {
		naverLogin.getLoginStatus(function(status) {
			if (status) {

				/*naverLogin.reprompt();*/ //사용자 정보 재동의필요시 동의창 다시 띄움

				// 네이버 정보 다 가져옴
				const id = naverLogin.user.getId();
				const nickName = naverLogin.user.getNickName();
				/*const profile = naverLogin.user.getProfile_image();*/
				const genderTemp = naverLogin.user.getGender();
				const birthday = naverLogin.user.getBirthday();
				const birthyear = naverLogin.user.getBirthyear();
				const phonenumber = (naverLogin.user.getMobile()).replace(/\-/g, '');

				const birth = birthyear + birthday.replace('-', '');
				const password = id;
				let sex = "";
				
				if(genderTemp=='F') sex = '여자';
				if(genderTemp=='M') sex = '남자';

				const accesstoken = naverLogin.accessToken.accessToken

				$('#memberId').val(id)
				$('#memberPassword').val(id)
				$('#memberPhoneNumber').val(phonenumber)
				$('#memberNickname').val(nickName)
				$('#memberBirth').val(birth)
				$('#memberSex').val(sex)
				$('#memberType').val('1')
				$('#accesstoken').val(accesstoken)
				console.log(id+"/"+phonenumber)
				
				if(naverLogin.user.getId() != null){
					$('#naver').submit();
					
				}

			} /*else alert("콜백 실패");*/

		});
	});



})
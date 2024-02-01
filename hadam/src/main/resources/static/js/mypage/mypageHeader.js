$(function() {

	$.ajax({
		url: "/mypage/mypageHeaderInfo",
		type: "post",
		success: function(result) {
			console.log(result)
			$('#scheduleNum').text(result[0]);
			$('#scheduleShareNum').text(result[1]);
			$('#boardNum').text(result[2]);
		},
		error: function(err) {

		}
	})

	// 현재 url 확인해서 맞는 li 클래스 추가 
	let currentUrl = window.location.pathname
	$(`a[href="${currentUrl}"]`).addClass('user-profile-act')
	/*console.log($(`a[href="${currentUrl}"]`))*/
	
	
	$(".modifyProfile").hide();

	/*프로필*/
	$("#profileModify").on('click', function() {
		var profileModify = $("#profileModify").text();

		/*수정눌렀을 때*/
		if (profileModify === '수정') {
			$("#profileModify").text('저장');
			$(".modifyProfile").show();
			$(".saveProfile").hide();

			return false;

			/*저장눌렀을 때*/
		} else {

			/* 닉네임 중복검사 */
			var member_nickname = $('#member_nickname').val();
			$('.nickname_comment').text("빈칸으로 두시면 기존 닉네임이 유지됩니다");
			if (member_nickname.length > 2) {
				$.ajax({
					url: '/signup/memberNicknameCheck',
					type: 'post',
					data: { "nickname": member_nickname },
					success: function(result) {
						/* true면 중복되는 닉네임 없음 */
						if (result) {
							$('#memberNickname_hidden').val(member_nickname);
							$('.nickname_comment').text("");
							$("#profileModify").text('수정');
							$(".modifyProfile").hide();
							$(".saveProfile").show();
							$('#profileImageUpload').submit();
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
			} else if (member_nickname.length == 0) {
				$('.nickname_comment').text("");
				$("#profileModify").text('수정');
				$(".modifyProfile").hide();
				$(".saveProfile").show();
				$('#profileImageUpload').submit();
			} else {
				$('.nickname_comment').text("2글자 이상이여야 합니다");
				$('.nickname_comment').css("color", "red");
			}
		}
	})

	$('#profileModifyCancel').on('click', function() {
		$('#memberNickname_hidden').val(member_nickname);
		$('.nickname_comment').text("");
		$("#profileModify").text('수정');
		$(".modifyProfile").hide();
		$(".saveProfile").show();
	})


})
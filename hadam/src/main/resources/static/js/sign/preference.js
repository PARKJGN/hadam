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
	let form_phone = null;
	let form_nickname = null;
	let form_birth = null;

	

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

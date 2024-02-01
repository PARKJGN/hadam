/* 
	파일명 	preference.js
	페이지명	간편 로그인시 취향설정 페이지 
	용도		간편 로그인시 취향설정 안되어 있으면 설정함
	작성자 	최성익  

 */

$(function() {

	/*키보드 새로고침은 막는데 브라우저창 새로고침 버튼은 못막음*/
	/*function NotReload(){
		if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
		} 
	}
	document.onkeydown = NotReload;*/

	/*키보드랑 브라우저 새로고침 막는 코드*/
	window.addEventListener('beforeunload', (event) => {
		if (preventUnload) {
			event.preventDefault();
			event.returnValue = '';
		}
	})

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

	let id = $('#imsimemberId').val();
	let password = $('#imsimemberPassword').val();
	let phone = $('#imsimemberPhoneNumber').val();
	let nickname = $('#imsimemberNickname').val();
	let sex = $('#imsimemberSex').val();
	let birth = $('#imsimemberBirth').val();
	let memberType = $('#imsimemberType').val();

	if (id == '') {
		location.replace('/index')
	}

	/* 회원가입 완료 번튼 눌렀을 때 */
	$('#signup_completion').hide();
	$('#hide_signup_completion').on('click', function() {
		preventUnload = false;
		let checkedCategory = [];
		$('input:checkbox[class~=small]').each(function() {
			if ($(this).is(':checked') == true) {

				checkedCategory.push($(this)[0].id);
			}
		})
		/*console.log(checkedcCtegory);*/
		if (checkedCategory.length < 10) {
			alert('카테고리는 최소 10개이상 선택해야 합니다')
			return false;
		} 
		
		var eating = $(".eating input:checked").length
		var drinking = $(".drinking input:checked").length
		var playing = $(".playing input:checked").length
		var watching = $(".watching input:checked").length
		var walking = $(".walking input:checked").length

		if (eating == 0 || drinking == 0 || playing == 0 || watching == 0 || walking == 0) {
			alert('먹기, 마시기, 놀기, 보기, 걷기의 카테고리는 각각 최소 1개이상 선택하셔야 합니다')
			return false;
		}

		$.ajax({
			url: '/signup/signupCompletion',
			type: 'post',
			data: {
				'memberId': id,
				'memberPassword': password,
				'memberPhoneNumber': phone,
				'memberNickname': nickname,
				'memberSex': sex,
				'memberBirth': birth,
				'memberType': memberType,
				'checkedCategory': checkedCategory
			},
			success: function(result) {
				if (result != 0) {
					alert('가입을 감사드립니다 메인페이지로 이동합니다');
					location.replace('/index')
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

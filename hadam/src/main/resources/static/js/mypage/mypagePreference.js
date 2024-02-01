$(function(){
	
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
	
	/* 수정완료 눌렀을때 */
	$('#preferenceModefy').on('click', function() {
		preventUnload = false;
		let checkedCategory = [];
		$('input:checkbox[class~=small]').each(function() {
			if ($(this).is(':checked') == true) {
				
				checkedCategory.push($(this)[0].id);
			}
		})
		/*console.log(checkedcCtegory);*/
		if(checkedCategory.length < 10){
			alert('카테고리는 최소 10개이상 선택해야 합니다')
			return false;
		}
		
		/* 카테고리 별로 각 1개씩 선택해야 함 */
		 var eating = $(".eating input:checked").length()
		 var drinking = $(".drinking input:checked").length()
		 var playing = $(".playing input:checked").length()
		 var watching = $(".watching input:checked").length()
		 var walking = $(".walking input:checked").length()
		
		if(eating==0 || drinking==0 || playing==0 || watching==0 || walking==0){
			alert('먹기, 마시기, 놀기, 보기, 걷기의 카테고리는 각각 최소 1개이상 선택하셔야 합니다')
			return false;
		}
		
		
		
		$.ajax({
			url: '/mypage/PreferenceModify',
			type: 'post',
			data: {
				'checkedCategory': checkedCategory
			},
			success: function(result) {
				if (result != 0) {
					alert('정상적으로 변경되었습니다');
					location.reload();
				} else {
					alert('네트워크에 문제가 있습니다. 잠심 후 시도해주세요');
				}

			},
			error: function(err) {
				alert('네트워크에 문제가 있습니다. 잠심 후 시도해주세요');
			}
		})
	})
	
	
	
})
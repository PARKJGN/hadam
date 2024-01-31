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
	
})
/* 
 	파일명 	signup.js
	페이지명	기본 회원가입 페이지 
	용도		회원가입시 필요 조건충족 확인 등
	작성자 	최성익  

 */

$(function(){
	/* 약관동의 하고 다음 버튼 누르는지 확인하는 로직  */
	$('.custom-form').on('click','#check-a', function(){
		/* 동의 체크 되어있으면 */
		if($('#check-a').is(':checked')){
			/* 다음버튼에 비활성화 시키는 클래스 제거 */
			$('#rule_agree').removeClass("disa");
			
		/* 동의 체크 안 되어있으면 */
		}else{
			/* 다음버튼에 비활성화 시키는 클래스 추가 */
			$('#rule_agree').addClass("disa");
		}
	})
	
	
	
	
	/* 아이디 중복체크 */
	$('#member_id_check').on("click",function(){
		var member_id = $('#member_id').val()
		// alert(member_id)
		
		/* 아이디 정규식 검사 영문 숫자 조합으로 5~13 글자 */
		const pattern = /^[a-zA-Z][0-9a-zA-Z]{4,12}$/g
		
		/* 아이디 정규식에 맞으면 */
		if(pattern.test(member_id)){
			/* 정규식에 포함되는 아이디 중복확인 진행 */
			$.ajax({
				url : "/signup/memberIdCheck",
				type : 'post',
				data : {"id" : member_id},
				success : function(result){
					if(result){
						$('.confirm_id_comment').text("사용중인 아이디 입니다");
					}else{
						$('.confirm_id_comment').text("사용가능한 아이디 입니다");
					}
				},
				error : function(err){
					alert("오류");
					console.log("오류 : "+ err);
				}
			})			
		/* 아이디 정규식에 맞지 않으면 */
		}else{
			/* 아이디 생성규칙 표기 */
			$('.confirm_id_comment').text("아이디는 영문 숫자 조합에 5~13자리로 가능합니다");
		}
		
	})
	
	/* 핸드폰 문자 인증 */
	$('#member_phone_check').on("click",function(){
		var member_phone = $('#member_phone').val()
		/*alert(member_phone)*/
		
		$.ajax({
			url : "/signup/memberPhoneCheck",
			type : 'post',
			data : {"phone" : member_phone},
			success : function(result){
				if(result){
					
				}else{
					
				}
			},
			error : function(err){
				alert("오류");
				console.log("오류 : "+ err);
			}
		})
		
	})
	
	
	$('#member_password').on('')
	
	
	
})

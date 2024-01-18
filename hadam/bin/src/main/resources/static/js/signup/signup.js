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
	
	
	/*ddd*/
	
	/* 아이디 중복체크 */
	$('#member_id_check').on("click",function(){
		var member_id = $('#member_id').val()
		// alert(member_id)
		
		/* 아이디 정규식 검사 영문 숫자 조합으로 5~13자 */
		const idPattern = /^[a-zA-Z][0-9a-zA-Z]{4,12}$/g
		
		/* 아이디 정규식에 맞으면 */
		if(idPattern.test(member_id)){
			/* 정규식에 포함되는 아이디 중복확인 진행 */
			$.ajax({
				url : "/signup/memberIdCheck",
				type : 'post',
				data : {"id" : member_id},
				success : function(result){
					/* true면 중복되는 아이디가 없음 */
					if(result){
						$('.confirm_id_comment').text("사용가능한 아이디 입니다");
					/* false면 중복되는 아이디 있음 */
					}else{
						$('.confirm_id_comment').text("사용중인 아이디 입니다");
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
			$('.confirm_id_comment').text("영문 숫자 조합에 5~13자리");
		}
		
	})
	
	/* 핸드폰 문자 인증 */
	/*$('#member_phone_check').on("click",function(){
		var member_phone = $('#member_phone').val()
		alert(member_phone)
		
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
		
	})*/
	
	/* 비밀번호 정규식 및 일치 확인 */
	$('#member_password').on('focus keyup', function(){
		var member_password = $('#member_password').val();
		
		/* 비밀번호 정규식 검사 문자, 숫자, 특수 문자 포함 8~15자 */
		const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/g;
		
		/* 입력한 비밀번호가 정규식에 맞으면 */
		if(passwordPattern.test(member_password)){
		
			$('.password_comment').text("사용가능한 비밀번호 입니다")
		/* 입력한 비밀번호가 정규식에 맞지 않으면 */
		}else{
			$('.password_comment').text("문자 숫자 특수문자 조합에 8~15자리")
		}
		
	})
	
	/* 비밀번호 확인이 비밀번호와 일치하는지 확인 */
	$('#confirm_member_password').on('foucs keyup', function(){
		var confirm_member_password = $('#confirm_member_password').val();
		
		/* 일치할때 */
		if(confirm_member_password==$('#member_password').val()){
			$('.confirm_password_comment').text('');
		/* 일치하지 않을 때 */
		}else{
			$('.confirm_password_comment').text('비밀번호가 일치하지 않습니다');
		}		
	})
	
	/* 닉네임 글자 수 안내  */
	$('#member_nickname').on('foucs keyup', function(){
		var member_nickname = $('#member_nickname').val();
		
		if(member_nickname.length < 3){
			$('.nickname_comment').text('2글자 이상이여야 합니다');
		}else{
			$('.nickname_comment').text('');
		}
	})
	
	/* 닉네임 중복검사 */
	$('#member_nickname_check').on('click',function(){
		var member_nickname = $('#member_nickname').val();
		$.ajax({
			url : '/signup/memberNicknameCheck',
			type : 'post',
			data : { "nickname" : member_nickname },
			success : function(result){
				/* true면 중복되는 닉네임 없음 */
				if(result){
					$('.nickname_comment').text("사용가능한 닉네임 입니다");
				/* false면 중복되는 닉네임 있음 */
				}else{
					$('.nickname_comment').text("사용중인 닉네임 입니다");
				}
			},
			error : function(err){
				console.log('닉네임 오류')
			}
		})
	})
	
	/* 전화번호 - 추가해주기 */
	$('#member_phone').on('foucs keyup', function(){
		var member_phone = $('#member_phone').val();
		//this.value = this.value.replace(/[^0-9.]{,11}/g, '').replace(/(\..*)\./g, '$1');
		/*$('#member_phone').val(member_phone.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));*/
		/*if(member_phone.length==11){
			format_phone = member_phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
			
			$('#member_phone').val(format_phone);
		}*/
		
	})
	
	/* 생년월일 - 추가해주기 */
	$('#member_birth').on('foucs keyup',function(){
		/*var member_birth = $('#member_birth').val();*/
		/*$('#member_birth').val(member_birth.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		if(member_birth.length == 8){
			format_birth = member_birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
			$('#member_birth').val(format_birth)
		}*/
	})
	
})

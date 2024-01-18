$(function(){

    $('#loginbtn').click(function () {

        var memberId = $('#memberId').val();
        var memberPassword = $('#memberPassword').val();
        
        $.ajax({
            url: "/signin/loginCheck",
            type: "post",
            data: {
                "memberId": memberId,
                "memberPassword": memberPassword
            },
            success: function (result) {
                console.log('컨트롤러 결과 : ',result);
                
                if (result == 1) {
                    console.log('로그인 성공')
                    location.reload();
                }else if(result == 0){
                    console.log('로그인 실패')
                    $('.login_comment').text("아이디와 비밀번호를 확인해주세요");			
				}else if(result == 2) {
                    console.log('관리자 로그인')					
                	/*location.href(""); 나중에 관리자 페이지 새기면*/
                }else{
                    console.log('오류');										
				}
            }, error: function (err) {
                alert("오류");
                console.log(err);
            }

        });

    });

	


})
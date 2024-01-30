
//==========================================================
// 계정 관리

// 모달 창 열기
$('.accountModal').click(function () {
  var memberId = $(this).attr('value');

  $.ajax({
    type: 'post',
    url: '/admin/getAccountInfo',
    data: {
      memberId: memberId
    },
    dataType: "json",
    success: function (data) {
      // 모달 창에 데이터 채우기
      $("#accountNickname").val(data.memberNickname);
      $("#accountId").val(data.memberId);
      $("#accountPhone").val(data.memberPhoneNumber);
      $("#accountAdminStatus").val(data.adminStatus);
      $("#accountStatus").val(data.memberStatus);
      $(".memInfo").html(data.memberNickname + "님의 회원 정보");

      // 모달 창 열기
      $("#accountModal").show();
	    // 수정 모달 창 열기
		$('.modifyAccountBtn').off('click').on('click', function () {
		
		  $.ajax({
		    type: 'post',
		    url: '/admin/getAccountInfo',
		    data: {
		      memberId: memberId
		    },
		    dataType: "json",
		    success: function (data) {
		      // 수정 모달 창에 데이터 채우기
		      $("#modifyAccountNickname").val(data.memberNickname)
		      $("#modifyAccountAdminStatus").val(data.adminStatus);
		      $("#modifyAccountStatus").val(data.memberStatus);
		      $(".memInfo").html(data.memberNickname + "님의 회원 정보");
		
		      // 수정 모달 창 열기
		      $("#modifyModal").show();
		      
		      	$(".modifyComBtn").off("click").on("click",function(){
					  var modifiedData = {
					        memberId: memberId,
					        modifyAccountNickname: $("#modifyAccountNickname").val(),
					        modifyAccountAdminStatus: $("#modifyAccountAdminStatus").val(),
					        modifyAccountStatus: $("#modifyAccountStatus").val()
					    };
					    console.log(modifiedData);
					  $.ajax({
						  type:"post",
						  url: "/admin/adminAccountU",
						  data: modifiedData,
						  dataType: "json",
						  success: function(result){
							  if(result === 1){
								  console.log("성공");
								  window.location.reload();
							  }
							  else{
								  console.log("실패")
								  window.location.reload();
							  }
					},
				    error: function(status, error) {
				      console.log('에러발생!!');
				      console.log(status, error);
				     
				    }
				  })
			  	});
		    },
		    error: function (status, error) {
		      console.log('에러발생!!');
		      console.log(status, error);
		    }
		  });
		});
		
		// 수정 모달 창 닫기
		$(".accountModal-header .close").click(function() {
		  $("#modifyModal").hide();
		});
		
    },
    error: function (status, error) {
      console.log('에러발생!!');
      console.log(status, error);
    }
  });
});

// 모달 창 닫기
$(".accountModal-header .close").click(function() {
  $("#accountModal").hide();
});


// 취소 버튼
$(".cancelBtn").click(function(){
	$("#modifyModal").hide();
})

//==========================================================
// 신고 관리

$(".suspendBtn").click(function(){
	var commentId = $(this).attr("value");
    var suspendChoice = prompt("정지 사유를 입력하세요:", "");
    if (suspendChoice !== null) {
        $.ajax({
			type:"post",
			url: "/admin/memberSuspend",
			data: {commentId : commentId},
			dataType: "json",
			success: function(result){
				if(result === 1){
					
					console.log("성공");
					window.location.reload();
				}
				else{
					console.log("실패")
					window.location.reload();
				}
		},
		error: function(status, error) {
		  console.log('에러발생!!');
		  console.log(status, error);
		 
		}
		
		});
    } else {
        console.log("취소");
    }
});

$(".releaseBtn").click(function(){
	var commentId = $(this).attr("value");
	var releaseChoice = confirm("정말로 해제하시겠습니까?")
	if (releaseChoice !== null) {
        $.ajax({
			type:"post",
			url: "/admin/memberRelease",
			data: {commentId : commentId},
			dataType: "json",
			success: function(result){
				if(result === 1){
					
					console.log("성공");
					window.location.reload();
				}
				else{
					console.log("실패")
					window.location.reload();
				}
		},
		error: function(status, error) {
		  console.log('에러발생!!');
		  console.log(status, error);
		 
		}
		
		});
    } else {
        console.log("취소");
    }
});

//==========================================================
// 게시판 관리

// 게시글 모달창 열기
$(".boardModal").click(function(){
	var boardId = $(this).attr('value');
	
	
})


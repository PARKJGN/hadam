
// 찜 추가 버튼
$(document).on("click", ".fc-add-button", function() {
    const locationId = $('#realLocationId').val();
    console.log(locationId);
    const memberIndex = $("#memberIndex").val();
    console.log(memberIndex);
    
    const clickedButton = $(this);
	
    // 서버로 찜하기 요청 전송
    $.ajax({
        url: "/favorites/addFavorites",
        type: "post",
        data: {
            locationId: locationId,
            memberIndex: memberIndex
        },
        dataType: "json",
        success: function (result) {
            if (result == 1) {
                console.log("찜 완료"+result);
                // 찜이 완료되었으면 UI 업데이트
                
                clickedButton.removeClass("fc-add-button").addClass("fc-delete-button");
                $("#heartIcon").removeClass("fa-regular fa-heart").addClass("fa-solid fa-heart");
                //$(this).removeClass("add-button").addClass("delete-button");
            } else {
                alert("로그인 후 이용해주세요.");
            }
        },
        error: function (err) {
            console.log("에러 발생");
            console.log(err);
        }
    });
});

// 찜 삭제 버튼
$(document).on("click", ".fc-delete-button",function(){
	const locationId = $("#realLocationId").val();
	const memberIndex = $("#memberIndex").val();
	
	const clickedButton = $(this);
	
	// 찜이 이미 되어있으면 삭제 진행
    $.ajax({
        url: "/favorites/deleteFavorites",
        type: "post",
        data: {
            locationId: locationId,
            memberIndex: memberIndex
        },
        dataType: "json",
        success: function (result) {
            if (result == 1) {
                console.log("찜 삭제 완료"+result);
                // 찜이 삭제되었으면 UI 업데이트
                //$(this).removeClass("delete-button").addClass("add-button");
                clickedButton.removeClass("fc-delete-button").addClass("fc-add-button");
                $("#heartIcon").removeClass("fa-solid fa-heart").addClass("fa-regular fa-heart");
            } else {
                console.log("찜 삭제 실패"+result);
                alert("찜 삭제 실패");
            }
        },
        error: function (err) {
            console.log("에러 발생");
            console.log(err);
        }
    });
})

// 비회원일 시 찜버튼 클릭하면 로그인 후 이용해달라는 알림창만 띄우기
$(document).on("click", ".fc-button",function(){
	alert("로그인 후 이용해주세요.")
});
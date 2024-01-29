
// 모달 창 열기
$('.accountModal').click(function () {
  var memberId = $(this).attr('value');

  $.ajax({
    type: 'post',
    url: '/admin/getAccountInfo',
    data: {
      memberId: memberId,
    },
    dataType: "json",
    success: function (data) {
      // 모달 창에 데이터 채우기
      $("#nickname").val(data.memberNickname);
      $("#id").val(data.memberId);
      $("#phone").val(data.memberPhoneNumber);
      $("#adminStatus").val(data.adminStatus);
      $("#memberStatus").val(data.memberStatus);
      $(".memInfo").html(data.memberNickname + "님의 회원 정보");

      // 모달 창 열기
      $("#accountModal").show();
    },
    error: function (status, error) {
      console.log('에러발생!!');
      console.log(status, error);
    }
  });
});

// 모달 창 닫기
$(".modal-content .close").click(function() {
  $("#accountModal").hide();
});

// 모달 창 외부 클릭 시 닫기
$(window).click(function(event) {
  if (event.target.id === "accountModal") {
    $("#accountModal").hide();
  }
});


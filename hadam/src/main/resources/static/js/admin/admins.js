
//==========================================================
// 대시보드

// 날짜별 게시글 수 차트
$(document).ready(function () {
    getBoardChart();
});

function getBoardChart() {
	// 하루에 작성된 게시글 수 리스트
    let boardCntList = [];
    // 현재일로부터 7일 전까지 뽑아오는 리스트
    let dateList = [];

    $.ajax({
        url: "/admin/boardChart",
        type: "get",
        dataType: "json",
        success: function (data) {
            for (let i = 0; i < data.length; i++) {
				// 게시글 수 리스트에 정보 주입
                boardCntList.push(data[i].dateBoardCount);
                // 현재일로부터 7일 전까지 게시글이 작성돼있는 일별 리스트에 정보 주입  
                dateList.push(formatChartDate(data[i].boardRegisterDate));
            }
            //console.log(boardCntList);
            //console.log(dateList);
            
            // boardChart에 해당하는 id를 가진 canvas로 chart 생성
            new Chart(document.getElementById("boardChart"), {
                type: "bar",
                data: {
					// 레이블을 일별로 정렬
                    labels: dateList,
                    datasets: [{
						// 일별로 작성된 게시글 수를 데이터로 출력
                        data: boardCntList,
                        label: "일별 게시글",
                        backgroundColor: "#A4A4A4",
                        fill: false
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: "주간 게시글"
                    },
                    // 부모 태그에 스타일 맞추기
                    responsive: true,
                    maintainAspectRatio: false
                }
            })
        }, error: function () {
            alert("실패");
        }
    })
}

// 성비 차트
// 남성, 여성 유저 회원 수 가져오기
function getSexChart(maleCnt, femaleCnt) {
	// sexChart에 해당하는 id를 가진 canvas 찾아서 차트 생성
    new Chart(document.getElementById("sexChart"), {
        type: "pie",
        data: {
			// 남자, 여자로 레이블 나누기
            labels: ['남자', '여자'],
            datasets: [{
				// 데이터로 남성, 여성 회원 수를 주입
                data: [maleCnt, femaleCnt],
                backgroundColor: ['#3498db', '#e74c3c']
            }]
        },
        options: {
            title: {
                display: true,
                text: '남녀 성비'
            },
            // 부모 태그에 스타일 맞추기
            responsive: true,
            maintainAspectRatio: false
        }
    });
}

// 페이지가 로드됐을 시 실행
$(document).ready(function () {
    $.ajax({
		// sexCahrt에 해당하는 컨트롤러를 ajax url로 설정
        url: "/admin/sexChart",
        type: "get",
        dataType: "json",
        // 데이터 받아오는 것이 성공 시 남성, 여성 회원 수를 인자로 받아온 getSexChart 함수를 실행 
        success: function (data) {
            getSexChart(data.maleCnt, data.femaleCnt);
        },
        error: function () {
            alert("실패");
        }
    });
});
   
// 스케줄별 선호 카테고리 차트

$(document).ready(function () {
    getCateChart();
});

function getCateChart() {
	// 스케줄 생성 시 선택한 소분류로 리스트 생성
    let scheCateList = [];
    // 스케줄 생성 시에 선택한 장소에 해당하는 소분류별 수 리스트 생성
    let scheCntList = [];

    $.ajax({
        url: "/admin/cateChart",
        type: "get",
        dataType: "json",
        success: function (data) {
            for (let i = 0; i < data.length; i++) {
                scheCateList.push(data[i].scheduleCategory);
                scheCntList.push(data[i].scheduleCateCnt);
            }
            //console.log(scheCateList);
            //console.log(scheCntList);
            // cateChart에 해당하는 id를 가진 canvas로 차트 생성
            new Chart(document.getElementById("cateChart"), {
                type: "bar",
                data: {
                    labels: scheCateList,
                    datasets: [{
                        data: scheCntList,
                        label: "카테고리 선택 수량",
                        backgroundColor: "#A4A4A4",
                        fill: false
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: "스케줄별 선호 카테고리"
                    },
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
					    xAxes: [{ // x 축에 대한 설정
					        ticks: {
					            autoSkip: false,
					            maxRotation: 90,
					            minRotation: 90,
					            fontSize: 10 
					        }
					    }],
					    y: {
					        beginAtZero: true
					    }
					}
                }
            })
        }, error: function () {
            alert("실패");
        }
    })
}
   
   
// 차트 날짜형식 변환
function formatChartDate(date) {
	return moment(date).format("MM/DD");
}

//==========================================================
// 신고 관리

// 정지 버튼 클릭시
$(".suspendBtn").click(function(){
	
	// 신고된 commentId에 해당하는 value 가져오기
	var commentId = $(this).attr("value");
	// prompt로 신고 사유를 입력할 수 있는 선택창 생성
    var suspendChoice = prompt("정지 사유를 입력해주세요.", "");
    // prompt로 신고 사유 입력 후 확인 클릭 시 
    if (suspendChoice !== null && suspendChoice.trim() !== "") {
        $.ajax({
			type:"post",
			url: "/admin/memberSuspend",
			// 받아온 commentId와 입력한 신고 사유를 ajax 데이터로 전송
			data: {commentId : commentId , reason: suspendChoice},
			dataType: "json",
			success: function(result){
				// 정지 성공 시 화면 새로고침
				if(result === 1){
					console.log("성공");
					window.location.reload();
				}
				// 실패 시 화면 새로고침
				else{
					console.log("실패");
					window.location.reload();
				}
		},
		error: function(status, error) {
		  console.log('에러발생!!');
		  console.log(status, error);
		 
		}
		
		});
		// 신고 사유를 입력하지 않았을 시
    } else if(suspendChoice !== null) {
		alert("사유를 입력해주세요.");
		window.location.reload();
	}
    
    // 정지 취소 버튼을 선택했을 시
    else {
        console.log("취소");
    }
});


// 정지 해제 버튼 클릭 시
$(".releaseBtn").click(function(){
	var commentId = $(this).attr("value");
	var releaseChoice = confirm("정말로 해제하시겠습니까?")
	if (releaseChoice) {
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
// 계정 관리

// 회원 정보 모달 창 열기
$('.accountModal').click(function () {
	// memberId를 가진 태그가 선택됐을 때 해당 memberId를 value로 가져오기
  var memberId = $(this).attr('value');

  $.ajax({
    type: 'post',
    url: '/admin/getAccountInfo',
    data: {
		// 받아온 memberId를 memberId 변수로 설정
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

      // 회원 정보 모달 창 열기
      $("#accountModal").show();
	    // 수정하는 모달 창 열기
		$('.modifyAccountBtn').off('click').on('click', function () {
		
		  $.ajax({
		    type: 'post',
		    url: '/admin/getAccountInfo',
		    data: {
				// 회원 정보에 해당하는 memberId를 수정하기 위해 한번 더 변수로 설정
		      memberId: memberId
		    },
		    dataType: "json",
		    success: function (data) {
		      // 수정 모달 창에 받아온 memberId에 해당하는 회원 정보 설정
		      $("#modifyAccountNickname").val(data.memberNickname)
		      $("#modifyAccountAdminStatus").val(data.adminStatus);
		      $("#modifyAccountStatus").val(data.memberStatus);
		      $(".memInfo").html(data.memberNickname + "님의 회원 정보");
		
		      // 수정 모달 창 열기
		      $("#modifyModal").show();
		      
		      	// 수정완료 버튼이 클릭됐을 시
		      	$(".modifyComBtn").off("click").on("click",function(){
					  // memberId에 해당하는 닉네임, 계정 권한, 계정 상태를 입력한 값으로 설정
					  var modifiedData = {
					        memberId: memberId,
					        modifyAccountNickname: $("#modifyAccountNickname").val(),
					        modifyAccountAdminStatus: $("#modifyAccountAdminStatus").val(),
					        modifyAccountStatus: $("#modifyAccountStatus").val()
					    };
					    //console.log(modifiedData);
					  $.ajax({
						  type:"post",
						  url: "/admin/adminAccountU",
						  data: modifiedData,
						  dataType: "json",
						  success: function(result){
							  // 입력한 회원 정보로 수정 성공 시 창 새로고침
							  if(result === 1){
								  console.log("성공");
								  window.location.reload();
							  }
							  // 수정 실패 시 창 새로고침
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
// 게시판 관리

// 스케줄 공유 게시판 모달창
// 모달창 상세페이지           
function openDetailModal(boardId,memberIndex) {
	 $.ajax({
		   
		 type:"GET",
		 url : '/community/scheduleShareDetail',
		 data: { 
			 boardId: boardId
		 }, 
		 success: function (data){ 
			console.log('성공',data);
			console.log('data[0].memberIndex', data[0].memberIndex);
			console.log('memberIndex', memberIndex);
			 
			 // 날짜 문자형으로 변환
			function formatDate(dateString) {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit'};
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			}
			 
			 
			let output  = "</div>";
			    output += '<div class="list-main-wrap fl-wrap card-listing" id="box1">';
			    output += '<div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">';
			    output += '<h2>Schedule :<span>'+data[0].boardTitle+'  </span></h2>';
			    output += '<span><i class="fa-solid fa-calendar-days" style="margin-left:20px; position:relative; top:-3px" ><strong style="font-size:14px; color:#46649B ">'+formatDate(data[0].boardRegisterDate)+'</strong></i></span>'
			    output += '</div>';
			    output += '<div class="post-author" id="userInfo"><a href="#"><img src="/communityBoardFile/d1fa1aea12bb6c5633762505152d9561" alt=""><span>'+data[0].memberNickname+'</span></a></div>'
			   	  
			   	  if (data[0].memberIndex == memberIndex) {
			    output += '<div class="buttonBox">'
			    output += '<a style="text-decoration:none; color:black;"  href="/community/scheduleShareUpdate?boardId= '+boardId +'"  id="updateBtn" ><i style="color:#28AEFF"class="fa-solid fa-pencil">수정</i></a>';
			    output += '<a style="text-decoration:none; color:black;" id="deleteBtn" href="/community/scheduleShareDelete?boardId='+boardId+'"><i  style="color:#DC6089"class="fa-solid fa-xmark">삭제</i></a>'
			    output += '</div>';
			    }
			    	
			    output += '<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox1">';
			    for ( let i in data ) {
			    output += '<div class="listing-item" id="listItem">';
			    output += '<article class="geodir-category-listing fl-wrap" style="width:150px;">';
			    output += '<div class="geodir-category-img listImg">';
			    output += '<a href="/location/locationDetail?locationId=' + data[i].locationId + '">';
				output += '<img src="/images/location/' + data[i].locationName + '.jpg" alt="" ';
				output += 'onerror="this.onerror=null;this.src=\'/images/gal/girlfriend.jpg\';">';
				output += '</a>';
			    output += '<div class="geodir-category-opt">';
			    output += '</div>';
			    output += '</div>';
			    output += '<div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">';
			    output += '<div class="geodir-category-content-title fl-wrap">';
			    output += '<div class="geodir-category-content-title-item">';
			    output += '<h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">'+data[i].scheduleStartTime+"~"+data[i].scheduleEndTime+'</h3>';
			    output += '<div class="geodir-category-location fl-wrap"><a href="/location/locationDetail?locationId='+data[i].locationId+'" class="map-item"><i class="fas fa-map-marker-alt"></i>'+data[i].locationName+'</a></div>'
		        output += '</div>';
		        output += '</div>';
		        output += '</div>';
		        output += '</article>';		       
		        output += '</div>';
		        
		         if( i< data.length -1){
		        output += '<div class="arrowBox1">';
		        output += '<div class="arrow"></div>';
		        output += '</div>';
		        }
		        }
		        output += '<div class="infor">';
		        output += '<p style="font-size:14px; color:black"><strong>희망성별 : '+data[0].boardSex+'</strong></p>';
		        output += '<p style="font-size:14px; color:black"><strong>희망나이 : '+data[0].boardAge+'</strong></p>';
		         
		         if (data[0].chatRoomCount < data[0].chatRoomMax){
					output += '<div><strong style="font-size:14px;">참가인원 :'+data[0].chatRoomCount+'/'+data[0].chatRoomMax+'<strong/></div>'
				}
				
				// 참가인원수가 다차면 스케줄마감버튼바뀜, 참가인원: max로 바뀜
				 
				 if (data[0].chatRoomCount >= data[0].chatRoomMax){
					output += '<div><strong style="font-size:14px;">참가인원 : max<strong/> </div>' 
				 }
				 
		        output += '</div>';
		        output += '</div>';
		           if (data[0].memberIndex !== memberIndex) {
			    output += '<div class="shareBtnBox1">';																														   // 스케줄 참가하기 버튼
			    output += '<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" role="button" id="shareBtn1" onclick="scheduleAttend(\'' + data[0].boardId + '\', \'' + data[0].memberIndex + '\',\''+data[0].scheduleTableId +'\')">스케줄 참가하기</button>';
			    output += '</div>';
				}
		        output += '<div class="list-single-main-item fl-wrap modalBoxshadow" id="writeForm">';
		        output += '<div class="list-single-main-item-title fl-wrap">';
		        output += '<h3>글 내용</h3>';
		        output += '</div>';
		        output += '<div id="contact-form">';
		        output += '<div id="message"></div>';
		        output += '<form  class="custom-form" action="php/contact.php" name="contactform" id="contactform">';
		        output += '<p>'+data[0].boardContent+'</p>';
		        output += '</form>';
		        output += '</div></div>';
		        output += '<div id="scheduleCommentList">';		     		        
			 	output += '</div>';
		        output += '</div>';
				output += '</div>';
		        output += '<div class="list-single-main-item fl-wrap modalBoxshadow" id="replyWriteBox">';
		        output += '<div class="list-single-main-item-title fl-wrap">';
		        output += '<h3>댓글 등록</h3>';
		        output += '</div>';
		        output += '<div id="add-review" class="add-review-box">';
		        output += '<fieldset>';
		        output += '<div class="row">';
		        output += '<div class="col-md-6">';
		        output += '</div></div>';
		        // 댓글 입력
		        output += '<textarea cols="40" rows="3" id="commentContent" name="commentContent" placeholder="댓글을 입력해주세요"></textarea>';
		        output += '</fieldset>';
		        output += '<div class="commentBtn">';
		        
		        // 댓글 등록 버튼 클릭시 함수 호출
		        output += '<button class="btn btn-primary" id="comment" onclick="scheduleCommentWrite(\'' + boardId + '\', \'' + memberIndex + '\')">등록</button>';
		        output += '</div>';

		        output += '</div>';
		        output += '</div>';
		        output += '<div id="scheduleAttend"></div>';
		        output += '<div class="pagination" id="page">';
		        output += '</div>';
		        output += '</div>';
		 		
		 		document.getElementById('modalScheduleDetail').innerHTML = output;
		 		
		 		// 스케줄 참가 최대인원이 다 찼을경우 스케줄마감으로 버튼변경
		 		if(data[0].chatRoomCount >= data[0].chatRoomMax){
					 document.getElementById('shareBtn1').innerHTML = '스케줄 마감';
					document.getElementById('shareBtn1').disabled = true;
				 }
		 		
		 		// entry 확인
		 		$.ajax({
					 type:"post",
					 url:'/community/checkEntry',
					 data : {boardId : boardId},
					 success : function(data){
					 	 
					 	 console.log("checkEntry성공", data); 
					 	 console.log("data.memberIndex확인",data.memberIndex);
					 	 console.log(boardId);
					 	 // 참가했으면 버튼 바뀌기
					 	 if(data.memberIndex == memberIndex ){
					 		 document.getElementById('shareBtn1').innerHTML = '신청 완료';
					 		 // 버튼 비활성화
    				 		 document.getElementById('shareBtn1').disabled = true;
					 	    }
					 	 else if(data.memberIndex == null){
					 		 document.getElementById('shareBtn1').innerHTML = '스케줄 참가하기';
					 	 }
					 	 
					 
					 },
					 error : function(error){
					 	 console.error("checkEntry실패",error);
					 }
				 })   
				
		 		// 모달상세페이지 댓글 목록 띄우기 
		 		$.ajax({				
					 type:'get',
					 url :'/community/getScheduleCommentList',
					 data : {boardId : boardId},
					 success: function (commentData) {
						 
						 console.log('댓글 데이터 가져오기 성공', commentData);
						 console.log(commentData)
						 
						 function formatDate(dateString) {
						    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
						    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
						    return formattedDate;
						}
						 
							 let output = "<div/>";
							
							 for (let i in commentData) {
	                            output += '<div class="list-single-main-item fl-wrap modalBoxshadow" id="replyBox">';
								output += '<div class="list-single-main-item-title fl-wrap">';
								output += '<h3> 댓글</h3>';
								output += '</div>';			
								output += '<div class="reviews-comments-wrap">';		
								output += '<div class="review-comments-avatar" id="replyImage">';
								output += '<img src="/communityBoardFile/d1fa1aea12bb6c5633762505152d9561" alt="">';
								output += '</div>';
								output += '<div class="reviews-comments-item" id="replyinnerBox">';
								output += '<div class="reviews-comments-item-text" id="chatBox">';
								output += '<h4 style=font-size:13px;><a href="#">'+commentData[i].memberNickname+'</a></h4>';
								output += '<p style=font-size:11px;>'+commentData[i].commentContent+'</p>';
								output += '<div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>'+formatDate(commentData[i].commentRegisteDate)+'</span> </div>';
								output += '';
								/*if( commentData[i].memberIndex !== memberIndex){
								output += '<div class="dangerBox">';
								output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
								output += '</div>';
								}*/
								
								output += '</div></div>';
								
								output += '</div></div>';
                        	}
                        	document.getElementById('scheduleCommentList').innerHTML = output;
						
						
						
					 }, 
					 error : function(error) {
						 console.error("댓글 데이터 가져오기 실패", error );
					 }
				 })
		 		
		 },
		 error: function(error) {
			 
			 console.error("실패", error);
		 }
		 
		 
	 })
 }
 
 // 댓글 작성
const scheduleCommentWrite = (boardId,memberIndex) => {
	
	// 입력한 댓글의 값
	const commentContent = document.getElementById('commentContent').value;

	console.log("session memberIndex",memberIndex);
	$.ajax ({
		type:'post',
		url : "/community/scheduleCommentWrite",
		data : {
			commentContent : commentContent,
			boardId : boardId,
		},
		dataType: "json",
		success : function(commentList){
			console.log("작성 성공");
			console.log(commentList);
			console.log("memberIndex",memberIndex)
			// 날짜 문자형으로 변환
			function formatDate(dateString) {
			    const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
			    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
			    return formattedDate;
			}
			
			let output = "<div/>";
			for ( let i in commentList ) {
				console.log("data의 memberIndex",commentList[i].memberIndex);
			output += '<div class="list-single-main-item fl-wrap modalBoxshadow" id="replyBox">';
			output += '<div class="list-single-main-item-title fl-wrap">';
			output += '<h3> 댓글</h3>';
			output += '</div>';			
			output += '<div class="reviews-comments-wrap">';		
			output += '<div class="review-comments-avatar" id="replyImage">';
			output += '<img src="/communityBoardFile/d1fa1aea12bb6c5633762505152d9561" alt="">';
			output += '</div>';
			output += '<div class="reviews-comments-item" id="replyinnerBox">';
			output += '<div class="reviews-comments-item-text" id="chatBox">';
			output += '<h4 style=font-size:13px;><a href="#">'+commentList[i].memberNickname+'</a></h4>';
			output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
			output += '<div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>'+formatDate(commentList[i].commentRegisteDate)+'</span> </div>';
			/*if( commentList[i].memberIndex !== memberIndex){
			output += '<div class="dangerBox">';
			output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
			output += '</div>';
			}*/
			
			output += '</div></div>';
			
			output += '</div></div>';
					}
			document.getElementById('scheduleCommentList').innerHTML = output;
			document.getElementById('commentContent').value='';
			
			
		},
		error : function() {
			console.log("실패");
		}
	})
}
 
// 스케줄 공유 게시판 페이징 처리
$(()=>{
	// 다음 페이지
	var pageprevNum = Number(pageNum) - 1 < 1 ? 1 : Number(pageNum) - 1;
	var pagenextNum = Number(pageNum) + 1 > pageLastPage ? pageLastPage : Number(pageNum) + 1;
	var paging = '';
	
					
					`<a href="/community/scheduleShareList/1" class="prevposts-link"><i
					class="fa fa-caret-left"></i></a>
				<!-- 전페이지로 이동 -->
				<a href="/community/scheduleShareList/${pageprevNum}"
					class="prevposts-link"><i class="fa fa-caret-left"></i></a>
				<!-- 페이지 리스트 3으로 설정하면 3개나옴 -->
				<!-- 다음페이지 이동 -->
				<a href="/community/scheduleShareList/${pagenextNum}"
					class="nextposts-link"><i class="fa fa-caret-right"></i></a>
				<!-- 마지마페이지 이동 -->
				<a href="/community/scheduleShareList/${pageLastPage}"
					class="nextposts-link"><i class="fa fa-caret-right"></i></a>`
					
	paging += `<a href="/community/scheduleShareList/1" class="prevposts-link"><i
					class="fa fa-caret-left"></i></a>
					<a href="/community/scheduleShareList/${pageprevNum}"
					class="prevposts-link"><i class="fa fa-caret-left"></i></a>`
	
	for (i = pageStartPage; i <= pageEndPage; i++) {
						if (i == pageNum) {
							paging += `<a href="/community/scheduleShareList/${i}" id= ${i} class="searchbtn active">${i}</a>`
						} else {
							paging += `<a href="/community/scheduleShareList/${i}" id= ${i} class ="searchbtn">${i}</a>`
						}
					}
	paging += `<a href="/community/scheduleShareList/${pagenextNum}"
					class="nextposts-link"><i class="fa fa-caret-right"></i></a>
				<!-- 마지마페이지 이동 -->
				<a href="/community/scheduleShareList/${pageLastPage}"
					class="nextposts-link"><i class="fa fa-caret-right"></i></a>`
	
	$("#page").append(paging)
	
})


// 게시글 모달창 열기
/*$(".boardModal").click(function(){
	var boardId = $(this).attr('value');
	$.ajax({
		type: 'post',
    	url: '/admin/boardViewModal',
    	data: {
      		boardId: boardId
    	},
    	dataType: "json",
    	success: function (data) {
			$("#aBoardRegisterDate").val(data.boardRegisterDate)
			$("#aBoardRegisterDate").val(data.boardRegisterDate)
			$("#aBoardRegisterDate").val(data.boardRegisterDate)
			$("#aBoardRegisterDate").val(data.boardRegisterDate)
			$("#aBoardRegisterDate").val(data.boardRegisterDate)
			// 모달 창 열기
	      	$("#boardModal").show();
    	},
    	error: function (status, error) {
      		console.log('에러발생!!');
      		console.log(status, error);
    	}
  	});
  	
  	
  	
});*/

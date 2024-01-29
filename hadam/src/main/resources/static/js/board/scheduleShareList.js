/**
 * 
 */
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
			let output  = "</div>";
			    output += '<div class="list-main-wrap fl-wrap card-listing" id="box1">';
			    output += '<div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">';
			    output += '<h2>Schedule :<span>'+data[0].boardTitle+'  </span></h2>';
			    output += '</div>';
			    output += '<div class="post-author" id="userInfo"><a href="#"><img src="/images/avatar/1.jpg" alt=""><span>'+data[0].memberNickname+'</span></a></div>'
			   	  if (data[0].memberIndex == memberIndex) {
			    output += '<div class="buttonBox">'
			    output += '<a style="text-decoration:none; color:black;"  href="/community/scheduleShareUpdate?boardId= '+boardId +'"  id="updateBtn" ><i style="color:#28AEFF"class="fa-solid fa-pencil">수정</i></a>';
			    output += '<a style="text-decoration:none; color:black;" id="deleteBtn" href="/community/scheduleShareDelete?boardId='+boardId+'"><i  style="color:#DC6089"class="fa-solid fa-xmark">삭제</i></a>'
			    output += '</div>';
			    }
			    
			    
			     if (data[0].memberIndex !== memberIndex) {
			    output += '<div class="shareBtnBox1">';																														   // 스케줄 참가하기 버튼
			    output += '<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" role="button" id="shareBtn1" onclick="scheduleAttend(\'' + data[0].boardId + '\', \'' + data[0].memberIndex + '\',\''+data[0].scheduleTableId +'\')">스케줄 참가하기</button>';
			    output += '</div>';
				}
				
				
			    
				
			    output += '<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox1">';
			    for ( let i in data ) {
			    output += '<div class="listing-item" id="listItem">';
			    output += '<article class="geodir-category-listing fl-wrap" style="width:120px;">';
			    output += '<div class="geodir-category-img listImg">';
			    output += '<a href="/location/locationDetail?locationId='+data[i].locationId+'"><img src="/images/location/'+data[i].locationName+'.jpg" alt=""></a>';
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
					output += '<div style="text-align:right"><strong>참가인원 :'+data[0].chatRoomCount+'/'+data[0].chatRoomMax+'<strong/></div>'
				}
				
				// 참가인원수가 다차면 스케줄마감버튼바뀜, 참가인원: max로 바뀜
				 if (data[0].chatRoomCount >= data[0].chatRoomMax){
					output += '<div style="text-align:right"><strong>참가인원 : max<strong/> </div>' 
					
				 }
		        output += '</div>';
		        output += '</div>';
		        output += '<div class="list-single-main-item fl-wrap" id="writeForm">';
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
		        output += '<div class="list-single-main-item fl-wrap" id="replyWriteBox">';
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
	                            output += '<div class="list-single-main-item fl-wrap" id="replyBox">';
								output += '<div class="list-single-main-item-title fl-wrap">';
								output += '<h3> 댓글</h3>';
								output += '</div>';			
								output += '<div class="reviews-comments-wrap">';		
								output += '<div class="review-comments-avatar" id="replyImage">';
								output += '<img src="/images/avatar/1.jpg" alt="">';
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
			console.log("commentList[i].memberIndex",commentList[i].memberIndex);
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
			output += '<div class="list-single-main-item fl-wrap" id="replyBox">';
			output += '<div class="list-single-main-item-title fl-wrap">';
			output += '<h3> 댓글</h3>';
			output += '</div>';			
			output += '<div class="reviews-comments-wrap">';		
			output += '<div class="review-comments-avatar" id="replyImage">';
			output += '<img src="/images/avatar/1.jpg" alt="">';
			output += '</div>';
			output += '<div class="reviews-comments-item" id="replyinnerBox">';
			output += '<div class="reviews-comments-item-text" id="chatBox">';
			output += '<h4 style=font-size:13px;><a href="#">'+commentList[i].memberNickname+'</a></h4>';
			output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
			output += '<div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>'+formatDate(commentList[i].commentRegisteDate)+'</span> </div>';
			if( commentList[i].memberIndex === memberIndex){
			output += '<div class="dangerBox">';
			output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
			output += '</div>';
			}
			
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

// 스케줄 참가신청창에서 신청 버튼 클릭시 (scheduleShareList.jsp에 버튼 있음)
const scheduleAttendWrite = () => {
	

		alert('참가 신청이 완료되었습니다.');
        
        // 참가 완료로 버튼 텍스트 변경
        document.getElementById('shareBtn1').innerHTML = '신청 완료';
        // '참가 완료' 상태로 전역 변수 설정  
        
}

// 스케줄 참가하기 버튼 클릭시
const scheduleAttend = (boardId,memberIndex, shceduleTableId) => {
	
	$.ajax({
		type:'post',
		url: '/community/getBoardId',
		data : {
			boardId : boardId,
			shceduleTableId : shceduleTableId,
			memberIndex:memberIndex
		},
		success : function(result) {
			console.log("boardId가져오기",result);
			
			
			let output = '<input type="hidden" name="boardId" value="'+result[0].boardId+'"/>' ;
			    output += '<input type="hidden" name="scheduleTableId" value="'+result[0].scheduleTableId+'"/>'
			    output += '<input type="hidden" name="memberIndex" value="'+result[0].memberIndex+'"/>'
			
			document.getElementById('getBoardId').innerHTML = output;
		},
		error : function(error){
			console.log("error",error);
		}
	})
}

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

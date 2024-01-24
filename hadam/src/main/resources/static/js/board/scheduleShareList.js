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
			 
			 
			 // '스케줄 참가하기' 버튼 상태 설정	 
			 
			 console.log('성공',data);
			 console.log(data);
		    
			 function formatDate(dateString) {
						    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						    const formattedDate = new Date(dateString).toLocaleDateString('ko-KR', options);
						    return formattedDate;
			 }
			   
			let output = "</div>";
			    output += '<div class="list-main-wrap fl-wrap card-listing" id="box1">';
			    output += '<div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">';
			    output += '<h2>Schedule :<span>'+data[0].boardTitle+'  </span></h2>';
			    output += '</div>';
			    output += '<div class="post-author" id="userInfo"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>'+data[0].memberNickname+'</span></a></div>'
			   	  if (data[0].memberIndex == memberIndex) {
			    output += '<div class="buttonBox">'
			    output += '<a style="text-decoration:none; color:black;"  href="/community/scheduleShareUpdate?boardId= '+boardId +'"  id="updateBtn" ><i style="color:#28AEFF"class="fa-solid fa-pencil">수정</i></a>';
			    output += '<a style="text-decoration:none; color:black;" id="deleteBtn" href="/community/scheduleShareDelete?boardId='+boardId+'"><i  style="color:#DC6089"class="fa-solid fa-xmark">삭제</i></a>'
			    output += '</div>';
			    }
			     
			    output += '<div class="shareBtnBox">';																																							// 스케줄 참가하기 버튼
			    output += '<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" role="button" id="shareBtn1" onclick="scheduleAttend(\'' + data[0].boardId + '\', \'' + memberIndex + '\',\''+data[0].scheduleTableId +'\')">스케줄 참가하기</button>';
			    output += '</div>';
				
			    output += '<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox1">';
			    for ( let i in data ) {
			    output += '<div class="listing-item" id="listItem">';
			    output += '<article class="geodir-category-listing fl-wrap" style="width:120px;">';
			    output += '<div class="geodir-category-img listImg">';
			    output += '<a href=""><img src="../images/location/'+data[i].locationName+'.jpg" alt=""></a>';
			    output += '<div class="geodir-category-opt">';
			    output += '</div>';
			    output += '</div>';
			    output += '<div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">';
			    output += '<div class="geodir-category-content-title fl-wrap">';
			    output += '<div class="geodir-category-content-title-item">';
			    output += '<h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">'+data[i].scheduleStartTime+"~"+data[i].scheduleEndTime+'</h3>';
			    output += '<div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>'+data[i].locationName+'</a></div>'
		        output += '</div>';
		        output += '</div>';
		        output += '</div>';
		        output += '</article>';
		        output += '<div class="arrowBox1">';
		        output += '<div class="arrow"></div>';
		        output += '<div class="timeTaken">';
		        output += '<p >30분</p>';
		        output += '</div></div></div>'
		        }
		        output += '<div class="listing-item" id="information">';
		        output += '<article class="geodir-category-listing fl-wrap" >';
		        output += '<div class="geodir-category-content fl-wrap title-sin_item"  id ="timeBox"style="border:solid 1px; border-radius:10px; border-color:lightblue">';
		        output += '<div class="geodir-category-content-title-item" >';
		        output += '<h3 class="title-sin_map">스케줄일정: '+formatDate(data[0].scheduleTableRegisteDate)+"~"+formatDate(data[0].scheduleTableRegisteDate) +'</h3>';
		        output += '<h3 class="title-sin_map">예상소요시간: 12:00 ~ 18:00</h3>';
		        output += '</div>';
		        output += '</div>';
		        output += '</article>';
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
			 	output+= '</div>';
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
		        output += '<button class="btn btn-primary" id="comment" onclick="scheduleCommentWrite(\'' + data[0].boardId + '\', \'' + memberIndex + '\')">등록</button>';
		        output += '</div>';

		        output += '</div>';
		        output += '</div>';
		        output += '<div id="scheduleAttend"></div>';
		        output += '<div class="pagination" id="page">';
		        output += '</div>';
		        output += '</div>';
		 		
		 		
		 		document.getElementById('modalScheduleDetail').innerHTML = output;
		 		
		 		/*scheduleAttendWrite();*/
		 		
		 		/*if (data[0].entryApplicationId !== null){
					 document.getElementById('shareBtn1').innerHTML = '참가완료'
				 }
				else {
					document.getElementById('shareBtn1').innerHTML = '스케줄 참가하기'
				}*/
		 		
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
								output += '<img src="../images/avatar/1.jpg" alt="">';
								output += '</div>';
								output += '<div class="reviews-comments-item" id="replyinnerBox">';
								output += '<div class="reviews-comments-item-text" id="chatBox">';
								output += '<h4 style=font-size:13px;><a href="#">'+commentData[i].memberNickname+'</a></h4>';
								output += '<p style=font-size:11px;>'+commentData[i].commentContent+'</p>';
								output += '<div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>'+formatDate(commentData[i].commentRegisteDate)+'</span> </div>';
								output += '';
								if( commentData[i].memberIndex !== memberIndex){
								output += '<div class="dangerBox">';
								output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
								output += '</div>'
								}
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
			output += '<img src="../images/avatar/1.jpg" alt="">';
			output += '</div>';
			output += '<div class="reviews-comments-item" id="replyinnerBox">';
			output += '<div class="reviews-comments-item-text" id="chatBox">';
			output += '<h4 style=font-size:13px;><a href="#">'+commentList[i].memberNickname+'</a></h4>';
			output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
			output += '<div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>'+formatDate(commentList[i].commentRegisteDate)+'</span> </div>';
			if( commentList[i].memberIndex !== memberIndex){
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

const scheduleAttendWrite = () => {
		alert('참가 신청이 완료되었습니다.');
        
        // 참가 완료로 버튼 텍스트 변경
        document.getElementById('shareBtn1').innerHTML = '참가 완료';
        // '참가 완료' 상태로 전역 변수 설정
        
       
        
}

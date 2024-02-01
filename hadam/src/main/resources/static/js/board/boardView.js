const commentWrite = () => {
            	// 입력한 댓글 내용
      			const commentContent = document.getElementById("commentContent").value;
            	// 해당 게시판의 boardId
      			const boardId = '${board.boardId}'
      			/* 게시물 작성자에게 알림을 보내기위해 작성자 Index를 보내야함 -건일 */
      			const memberIndex = '${boardMemberIndex.memberIndex}'
      			
      			console.log("session값확인",memberIndex);
      			$.ajax ({
      				type: "post",
      				url: "/community/commentSave",
      				data : {
      					commentContent : commentContent,
      					boardId : boardId,
      	      			/* 게시물 작성자에게 알림을 보내기위해 작성자 Index를 보내야함 -건일 */
      					memberIndex : memberIndex
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
      					output += "<div class='list-single-main-item fl-wrap' id='sec5'>";
      					output += "<div class='list-single-main-item-title fl-wrap'>";	
      					output += "<h3> 댓글 <span></span></h3>";
      					output += "</div>";
      					output += "<div class='reviews-comments-wrap'>";
      					for (let i in commentList) {
      					output += "<div class='reviews-comments-item'>";
      					output += "<div class='review-comments-avatar' id='replyImage'>";
      					output += "<img src='/images/profile/"+commentList[i].memberUploadImageName+".jpg' "; 
      					output += 'onerror="this.onerror=null; this.src=\'/images/gal/no_image2.jpg\';"> ';
      					output += '</div>';
      					output += '<div class="reviews-comments-item-text" id="chatBox">';
      					output += '<h4 style=font-size:13px;>'+commentList[i].memberNickname+'</h4>';
      					output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
      					output += '<div class="reviews-comments-item-date" id="replydateBox"><span id="replydate"><i class="far fa-calendar-check"></i>'+formatDate(commentList[i].commentRegisteDate)+'</span></div>';   					
      					// 댓글작성자의 memberIndex와 로그인한 사용자의 memberIndex가 다르면 신고 버튼 보임
      					/*  if ( commentList[i].memberIndex == memberIndex) {
      						output += '<button type="button" id="danger"class="btn btn-danger" onclick="commentDelete()">삭제</button>';
      					}    */
      					console.log("올라간댓글 memberIndex들 확인",commentList[i].memberIndex)
      					output += '</div>';
      					output += '</div>';    				
      					}			
      					output += '</div>';
      					output += '</div>';
      					document.getElementById('commentList').innerHTML = output;
      					document.getElementById('commentContent').value='';
      				},
      				error : function() {
      					console.log("실패");
      				}
      			})   			
      			 let notifyComment="새로운 댓글이 달렸습니다";
      			//몽고DB에 알림내용 추가하는 ajaxs >_ㅇ -괴도건일
      			$.ajax({
		            type: "POST",
		            url: "http://localhost:8080/mongodb/alarmsave",
		            contentType: "application/json",
		            data: JSON.stringify({
					    "memberIndex": memberIndex,
					    "boardId": boardId,
					    "alarmContent": notifyComment
		            }),
					success: function (data) {
						console.log("댓글 알림내용 저장완료");
		            },error: function (error) {
		                // 서버에서 오류 응답을 받았을 때 수행할 동작
		                console.error("POST 요청 실패", error);
		            }
		        });	//end of ajax 
      		}		
			// 한 게시글에 신고 한번 밖에 못함 
              // 신고된 정보 저장
              const commentReport = () => {
              	
              	// 게시판 번호
              	const boardId = '${board.boardId}';
              	
              	// 댓글 번호
               	const commentId = '${commentId.commentId}';  
              	
              	// 해당 게시글의 댓글 신고자
              	const boardAndCommentReporter = '${sessionScope.memberIndex}';       	            	
        			$.ajax ({
  					  type:"post",
  					  url:"/community/commentReportSave",
  					  data : {
  						  boardId : boardId,
  		 				  commentId : commentId, 
  						  boardAndCommentReporter : boardAndCommentReporter
  					  },
  					  dataType : "json",
  					  success : function(result){
  						  console.log("신고되었습니다.",result);
  						  alert("정말로 신고하시겠습니까?")
  						  alert("신고가 접수되었습니다.")
  						  
  						  const button = document.getElementById('danger')
  						  button.innerText = '접수';
  						  button.disabled = true; 
  					  },
  					  error : function(xhr, status, error) {
  						  console.log("실패", error);
  					  }
  				  })
              }      
              
   
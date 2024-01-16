/**
 * 
 */
// 댓글 작성 ajax


	

    const commentWrite = () => {
      			const commentContent = document.getElementById("commentContent").value;
      			const boardId = '${board.boardId}'
      			
      			$.ajax ({
      				type: "post",
      				url: "/community/commentSave",
      				data : {
      					commentContent : commentContent,
      					boardId : boardId
      				},
      				dataType: "json",
      				success : function(commentList){
      					console.log("작성 성공");
      					console.log(commentList);
      					let output = "<div/>";
      					
      					output += "<div class='list-single-main-item fl-wrap' id='sec5'>";
      					output += "<div class='list-single-main-item-title fl-wrap'>";	
      					output += "<h3> 댓글 <span></span></h3>";
      					output += "</div>";
      					output += "<div class='reviews-comments-wrap'>";
      					for (let i in commentList){
      					output += "<div class='reviews-comments-item'>";
      					output += "<div class='review-comments-avatar' id='replyImage'>";
      					output += "<img src='../images/avatar/1.jpg' alt=''> ";
      					output += '</div>';
      					output += '<div class="reviews-comments-item-text" id="chatBox">';
      					output += '<h4 style=font-size:13px;>'+commentList[i].memberNickname+'</h4>';
      					output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
      					output += '<div class="reviews-comments-item-date" id="replydateBox"><span id="replydate"><i class="far fa-calendar-check"></i>'+commentList[i].commentRegisteDate+'</span></div>';
      					output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
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

      	
      		}
      		


 
              
			 let reported = false;
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
  						  console.log("신고되었습니다.")
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
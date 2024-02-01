<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 작성일 문자형식으로 포맷팅하려고 import 했습니다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>     
     <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
	 <link type="text/css" rel="stylesheet" href="/css/board/boardView.css">
 
            <div id="wrapper">
                <div class="content">
                    <section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="/images/board/back7.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">                          
                                <h2><span>Hadam(하루를 담다)</span></h2>
                                <span class="section-separator"></span>
                                <h4>당신의 하루를 디자인하세요!</h4>
                            </div>                            
                        </div>
                    </section>
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                        	<!-- 게시판 상세 페이지 -->
                            <div class="breadcrumbs fl-wrap"><a href="boardList">커뮤니티</a><a href="boardList">자유게시판</a><span>자유게시판 상세보기</span></div>
                        </div>
                    </div>
                    <section  id="sec1" class="middle-padding grey-blue-bg">
                        <div class="container" id="full">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="post-container fl-wrap" id="box">
                                    	<!-- 로그인한 사용자의 memberIndex가 없을 때 -->
                                    	<c:if test="${not empty sessionScope.memberIndex }">
                                        <a style="text-decoration:none; color:black;"  href="boardWrite"  id="writeButton"><i style="color:#64A0FF;" class="fa-solid fa-pen-to-square" >글 작성</i></a>
                                        </c:if>
                                        <!-- 내가 쓴 글의 게시판일경우에만 수정 삭제 버튼 보임-->
                                        <c:if test="${sessionScope.memberIndex eq board.memberIndex or board.adminStatus ne 0}"> 
                                        <a style="text-decoration:none; color:black;"  href="boardUpdate?boardId=${board.boardId}"  id="updateBtn" ><i style="color:#28AEFF"class="fa-solid fa-pencil">수정</i></a><!--클릭 시 수정 페이지로 이동-->   
                                        <a style="text-decoration:none; color:black;" id="deleteBtn" href="boardDelete?boardId=${board.boardId}"><i  style="color:#DC6089"class="fa-solid fa-xmark">삭제</i></a><!-- 클릭시 삭제 -->          
                                        </c:if> 
                                      		<article class="post-article">                                          
	                                            <div class="list-single-main-item fl-wrap" >
	                                             <form action="" >
	                                             <input name="BOARD_ID" type="hidden" value=""/>
	                                              <div class="list-single-main-item-title fl-wrap" >
	                                                  <div class="list-single-main-item-title fl-wrap" >
	                                    				<!-- 게시글 제목 -->
	                                         			<h3 style=font-size:20px; id="largeTitleTab">${board.boardTitle}</h3>
	                                         		  </div>		            
	                                         		  																					<!-- 게시글을 올린 사용자의 프로필 사진 -->																										<!--회원 별명-->                                         
	                                                    <div class="post-author" id="userInfo"><a href="#"><img src="/images/profile/${profile.memberUploadImageName}.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';"><span>${board.memberNickname}</span></a></div> 
	                                                    <div class="post-opt" id="inforTab">
	                                                    <ul>											
	                                                        <li><i class="fal fa-calendar"></i> <span>
	                                                        						<!--게시판 등록일-->
	                                                         <fmt:formatDate value="${board.boardRegisterDate}" pattern="yyyy/MM/dd HH:MM:SS" />                                                
	                                                       </span></li>
	                                                        								<!-- 게시판 조회수-->
	                                                        <li><i class="fal fa-eye"></i> <span>${board.boardViews}</span></li>                        	
	                                                    </ul>                                                  
	                                                </div>
	                                                </div>
                                               	 <div>
                                             	<div class="list-single-main-media fl-wrap">       	 
                                                <div class="single-slider-wrapper fl-wrap">                                                
                                                    <div class="single-slider fl-wrap"  >                                                    
                                                        <div class="slick-slide-item">
  														<!-- 첨부사진 출력 -->                                                      
                                                        <img src="${pageContext.request.contextPath}/communityBoardFile/${board.memberUploadImageName}?" alt="파일첨부"
                                                        onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/girlfriend.jpg'">
                                                        </div>                                      
                                                    </div>
                                                </div>                                                       
                                            </div>
                                            <div class="list-single-main-item-title fl-wrap" >                                 			
                                         		</div>
                                            </div>                                           
                                            <div class="list-single-main-item fl-wrap">
                                                 <!-- 게시글 내용 --> 
                                                <p>
                                                  ${board.boardContent}
                                                </p>
                                            </div>
                                           	</form>
                                            </div>                                                                         
                                            <!-- 입력한 댓글 목록-->       			
                               				 <div id="commentList">                                               
                                               <div class="list-single-main-item fl-wrap" id="sec5">
                                                <div class="list-single-main-item-title fl-wrap">
                                                						<!-- 댓글 개수 -->
                                                    <h3> 댓글 </h3> <h3>${commentCount.count}</h3>
                                                </div>
                                                <!-- 작성한 댓글 목록 -->                                                                                            
                                                <c:forEach items="${commentList}" var="comment">
											        <div class="reviews-comments-wrap"> 
											            <div class="reviews-comments-item">
											            			<!-- 해당 memberIndex 프로필 사진 출력 -->
											                <div class="review-comments-avatar" id="replyImage">
											                  <img src="/images/profile/${comment.memberUploadImageName}.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';" alt=""> 
											                </div>													      								                
											                <div class="reviews-comments-item-text" id="chatBox">
											                	<!-- 댓글 작성자 -->
											                    <h4 style="font-size:13px;">${comment.memberNickname}</h4>
											                    <!-- 댓글 내용 -->                                                    
											                    <p style="font-size:11px;">${comment.commentContent}</p>
											                    <div class="reviews-comments-item-date" id="replydateBox">
											                        <span id="replydate"><i class="far fa-calendar-check"></i>
											                        <!-- 댓글 등록일 --> 
											                         <fmt:formatDate value="${comment.commentRegisteDate}" pattern="yyyy/MM/dd HH:MM:SS" /></span>
											                    </div>
											                    <!-- 댓글 작성자와 로그인한 사용자가 다르면 신고버튼 보임 -->
											                    <%-- <c:if test="${not empty sessionScope.memberIndex and comment.memberIndex ne sessionScope.memberIndex}">
											                    <!-- 신고클릭시 함수호출 -->
											                    <button type="button" id="danger" class="btn btn-danger" onclick="commentReport()">신고</button>				               		
											               		</c:if> --%>
											                </div>
											            </div>
											        </div>					
												  </c:forEach>
                                                </div> 
                                              </div>  		 
                              			          		<!-- 로그인한 사용자의 memberIndex가 있을 때만 댓글 등록가능 -->
                              			  <c:if test="${not empty sessionScope.memberIndex }">                                                 
                                           <div class="list-single-main-item fl-wrap" id="sec6" style=height:300px;>                                                             
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>댓글 등록</h3>
                                                </div>
                                                <!-- Add Review Box -->
                                                <div id="add-review" class="add-review-box">                                                                         
                                                            <textarea cols="40" id="commentContent"rows="3" placeholder="내용을 입력해주세요" ></textarea>                     										
                                                        <!-- 댓글 등록시 js 함수호출 -->
                                                        <button class="btn color2-bg float-btn" id="commentBtn" onclick="commentWrite()" style="color:rgba(124,150,255,1)">댓글 등록</button>
                                                </div>
                                            </div>
                                    	 </c:if>                   
                                        </article>                                
                                    </div> 
                                </div>
                            </div>
                        </div>
                        <div class="limit-box fl-wrap"></div>
                    	<a class="btn btn-primary" href="boardList" role="button" id="boardlistpage">자유게시판으로</a> <!-- 클릭 시 자유게시판으로 이동 -->
                    </section>
                </div>
            </div>
              <script>
              // merge시 에러뜸 commentWrite인자에 sessionScope.memberIndex 제거해야함
              // js 폴더 만들어서 했는데 템플릿에있는 js랑 겹쳐서 되지않아 일단 여기에 작성했습니둥
              // 댓글 작성 ajax
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
      					  /* if ( commentList[i].memberIndex == memberIndex) {
      						output += '<button type="button" id="danger"class="btn btn-danger" onclick="commentDelete()">삭제</button>';
      					}     */
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
      			let notifyComment="새로운 댓글이 달렸습니다.";
      			//몽고DB에 알림내용 추가하는 ajaxs >_ㅇ -괴도건일
      			$.ajax({
		            type: "POST",
		            url: "/mongodb/alarmsave",
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
              
              const commentDelete = () => {
            	  
            	  $.ajax ({
            		  type:"get",
            		  url: "/community/boardCommentDelete",
            		  data: {
            			  
            		  }
            	  })
              }
              
             </script>
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
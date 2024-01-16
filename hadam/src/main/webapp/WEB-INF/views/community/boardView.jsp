<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 작성일 문자형식으로 포맷팅하려고 import 했습니다 -->
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>     
     <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
	 <link type="text/css" rel="stylesheet" href="/css/board/boardView.css">
 
            <div id="wrapper">
                <div class="content">
                    <section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="/images/board/park.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">
                                
                                <h2><span>자유 게시판</span></h2>
                                <span class="section-separator"></span>
                                <h4>hadam</h4>
                            </div>
                             
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec1" class="custom-scroll-link color-bg"><i class="fal fa-angle-double-down"></i></a></div>
                        </div>
                    </section>
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                        	<!-- 게시판 상세 페이지 -->
                            <div class="breadcrumbs fl-wrap"><a href="boardList">커뮤니티</a><a href="boardList">자유게시판</a><span>자유게시판 상세보기</span></div>
                        </div>
                    </div>
                    <section  id="sec1" class="middle-padding grey-blue-bg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="post-container fl-wrap" id="box">
                      
                                                     <a style="text-decoration:none; color:black;"  href="boardWrite"  id="writeButton"><i style="color:#64A0FF;" class="fa-solid fa-pen-to-square" >글 작성</i></a>
                                               <c:if test="${board.memberIndex eq sessionScope.memberIndex}"> <!-- 내가 쓴 글의 게시판일경우에만 수정 삭제 버튼 보임-->
                                                 <a style="text-decoration:none; color:black;"  href="boardUpdate?boardId=${board.boardId}"  id="updateBtn" ><i style="color:#28AEFF"class="fa-solid fa-pencil">수정</i></a><!--클릭 시 수정 페이지로 이동-->   
                                                 <a style="text-decoration:none; color:black;" id="deleteBtn" href="boardDelete?boardId=${board.boardId}"><i  style="color:#DC6089"class="fa-solid fa-xmark">삭제</i></a>          
                                             	 
                                               </c:if> 
                                        <article class="post-article">
                                           
                                            <div class="list-single-main-item fl-wrap" >
                                             <form action="" >
                                             <input name="BOARD_ID" type="hidden" value=""/>
                                              <div class="list-single-main-item-title fl-wrap" >
                                                     <div class="list-single-main-item-title fl-wrap" >
                                    
                                         			<h3 style=font-size:20px; id="largeTitleTab">${board.boardTitle}</h3> <!-- 게시글 제목 -->
                                         			</div>	
                                                      <div class="post-author" id="userInfo"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>${board.memberNickname}</span></a></div> <!--회원 별명-->
                                                    <div class="post-opt" id="inforTab">
                                                    
                                                    <ul>											<!--게시판 등록일-->
                                                        <li><i class="fal fa-calendar"></i> <span><%// boardRegisterDate를 받아오는 부분, 예시로 현재 시간을 사용
																									Date boardRegisterDate = new Date();
																									// SimpleDateFormat을 사용하여 날짜를 원하는 형식으로 포맷
																									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
																									String formattedDate = sdf.format(boardRegisterDate);
																								  %>
																										    
																								  <%= formattedDate %></td></span></li>
																								  
																								   <!--게시판 수정일-->
                                                        
                                                        <li><i class="fal fa-eye"></i> <span>${board.boardViews}</span></li><!-- 게시판 조회수-->
                                                        	
                                                    </ul>
                                                  
                                                </div>
                                                </div>
                                                <div>
                                             	 <div class="list-single-main-media fl-wrap">
                                             	 
                                                <div class="single-slider-wrapper fl-wrap">
                                                
                                                    <div class="single-slider fl-wrap"  >
                                                    
                                                        <div class="slick-slide-item">
                                                        
                                                        <img src="${pageContext.request.contextPath}/communityBoardFile/${board.memberUploadImageName}?" alt="파일첨부">
                                                        </div><!--파일첨부한 이미지-->
                                         
                                                    </div>
                                                   
                                                </div>
                                                       
                                            </div>
                                            <div class="list-single-main-item-title fl-wrap" >
                                                                                       			
                                         		</div>
                                            </div>
                                            
                                            <div class="list-single-main-item fl-wrap">
                                                
                                                <p>
                                                   <!-- 게시글 내용 --> ${board.boardContent}
                                                </p>

                                            </div>
                                             
                                                
                                                
                                                </form>
                                            </div>
                                            
                                           
                                            
                                            <!-- 입력한 댓글 목록-->
                                            
                             				
                      <%--${comment.commentRegisteDate} --%>
                               			
                               				 <div id="commentList">
                                               
                                               <div class="list-single-main-item fl-wrap" id="sec5">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3> 댓글 </h3>
                                                </div>
                                                <c:forEach items="${commentList}" var="comment">
											        <div class="reviews-comments-wrap"> 
											            <div class="reviews-comments-item">
											                <div class="review-comments-avatar" id="replyImage">
											                    <img src="../images/avatar/1.jpg" alt=""> 
											                </div>
											                <div class="reviews-comments-item-text" id="chatBox">
											                    <h4 style="font-size:13px;">${comment.memberNickname}</h4>                                                    
											                    <p style="font-size:11px;">${comment.commentContent}</p>
											                    <div class="reviews-comments-item-date" id="replydateBox">
											                        <span id="replydate"><i class="far fa-calendar-check"></i> 
											                        <% Date commentRegisteDate = new Date(); 
											                        SimpleDateFormat saf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
											                        String formattDate = sdf.format(boardRegisterDate);
											                        %> <%= formattedDate %> </span>
											                    </div>
											                    <c:if test="${comment.memberIndex ne sessionScope.memberIndex}">
											                    <button type="button" id="danger" class="btn btn-danger" onclick="commentReport()">신고</button>
											               		</c:if>
											                </div>
											            </div>
											        </div>
								
													</c:forEach>
                                            </div> 
                                         			
                              			          </div>  		
                               	
                                                              
                                           <div class="list-single-main-item fl-wrap" id="sec6" style=height:300px;>
                                               
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>댓글 등록</h3>
                                                </div>
                                                <!-- Add Review Box -->
                                                <div id="add-review" class="add-review-box">
                                                    <!-- Review Comment -->
              
                                                        <fieldset>
                                                            
                                                            <textarea cols="40" id= "commentContent"rows="3" placeholder="내용을 입력해주세요" ></textarea>
                                                        </fieldset>
                                                          
                                                        <button class="btn btn-warning" id="commentBtn" onclick="commentWrite()">댓글 등록</button>
                                                    
                                                </div>
                                                <!-- Add Review Box / End -->
                                            </div>
                                    	
                                            
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
              // js 폴더 만들어서 했는데 템플릿에있는 js랑 겹쳐서 되지않아 일단 여기에 작성했습니둥
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
      					
      					// 세션으로 담아온 memberIndex 값 변수에 저장
      					var memberIndex = ${sessionScope.memberIndex};
      					
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
      					for (let i in commentList){
      					output += "<div class='reviews-comments-item'>";
      					output += "<div class='review-comments-avatar' id='replyImage'>";
      					output += "<img src='../images/avatar/1.jpg' alt=''> ";
      					output += '</div>';
      					output += '<div class="reviews-comments-item-text" id="chatBox">';
      					output += '<h4 style=font-size:13px;>'+commentList[i].memberNickname+'</h4>';
      					output += '<p style=font-size:11px;>'+commentList[i].commentContent+'</p>';
      					output += '<div class="reviews-comments-item-date" id="replydateBox"><span id="replydate"><i class="far fa-calendar-check"></i>'+formatDate(commentList[i].commentRegisteDate)+'</span></div>';
      					
      					// 댓글작성자의 memberIndex와 로그인한 사용자의 memberIndex가 다르면 신고 버튼 보임
      					if ( commentList[i].memberIndex !== memberIndex) {
      						output += '<button type="button" id="danger"class="btn btn-danger">신고</button>';
      					}   
      					
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
              
              
              </script>
           	 
              <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             <!-- <script type="text/javascript" src="/js/board/boardView.js"></script> -->
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
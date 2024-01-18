<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
     
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <!-- <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css"> -->
            
            <style>
            	#danger{
            		width:50px;
            		height:20px;
            		font-size:12px;
            		margin-left:610px;
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				top:-70px;
	 				right:-15px;
            	}
            	#comment{
            		width:50px;
            		height:20px;
            		font-size:13px;
            		margin-left:730px;
            		text-align : center;
	 				padding : 0 0;
            	
            	}
            	
            	#box {
            		margin-left:200px;
            	}
            	
            	#writepage {
            		width:60px;
            		height:25px;
            		font-size:14px;
            		margin-left:780px;
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				top:-10px;
            	}
            	
            	#boardlistpage {
            
            		font-size:13px;
            		width:120px;
            		height:30px;
            	}
            	
            	
            	
            	#inforTab {
            		position:relative;
            		right:-390px;
            	}
            	#userInfo {
            		position:relative;
            	
            	}
            	
            	#sec5 {
            		height:250px;
            	}
            	
            	#chatBox {
            		height:100px;
            		postion:relative;
            		left:-40px;
            		top: -30px;
            	}
            	
            	#chatBox h4{
            		position:relative;
            		top:-20px;
            	}
            	
            	#chatBox p {
            		position:relative;
            		left:-40px;
            	}
            	
            	#replyImage img{
            		width:50px;
            		height:50px;
            		position:relative;
            		top:-30px;
            	}
            	
            	#replydateBox {
            		position:relative;
            		top:-60px;
            	
            	}
            	#COMMENT_CONTENT{
            		height:80px;
            	}
            	
            	#largeTitleTab{
            		
            		position:relative;
            		bottom:-30px;
            	}
            	
            	#writeButton {
            		width:60px;
            		height:25px;
            		font-size:14px;
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				right:-260px;
	 				top:-8px;
            	}
            	#updateBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
            		top:-1291px;
            		right:-360px;
            	}
            	#deleteBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				top:-1291px;
	 				right:-360px;
            	}
            </style>
            
            
            
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!--  section  -->
                    <section class="color-bg middle-padding ">
                        <div class="wave-bg wave-bg2"></div>
                        <div class="container">
                            <div class="flat-title-wrap">
                                <h2><span>자유 게시판</span></h2>
                                <span class="section-separator"></span>
                                <h4>hadam</h4>
                            </div>
                        </div>
                    </section>
                    <!--  section  end-->
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="boardList">커뮤니티</a><a href="boardList">자유게시판</a><span>자유게시판 상세보기</span></div>
                        </div>
                    </div>
                    <!-- section-->
                    <section  id="sec1" class="middle-padding grey-blue-bg">
                        <div class="container">
                            <div class="row">
                                <!--blog content -->
                                <div class="col-md-8">
                                    <!--post-container -->
                                    <div class="post-container fl-wrap" id="box">
                                        <!-- article> -->
                                         <div class="list-single-main-item-title fl-wrap" >
                                                    <h3 style=font-size:25px;>자유게시판</h3>
                                         			<h3 style=font-size:20px; id="largeTitleTab">${board.boardTitle}</h3>
                                         </div>
                                  
                                                     <a class="btn btn-primary" href="boardWrite" role="button" id="writeButton">글 작성</a>
                                                    
                                        <article class="post-article">
                                           
                                            <div class="list-single-main-item fl-wrap" >
                                             <form action="" >
                                             <input name="BOARD_ID" type="hidden" value=""/>
                                              <div class="list-single-main-item-title fl-wrap" >
                                                    
                                                      <div class="post-author" id="userInfo"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>${board.memberNickname}</span></a></div>
                                                    <div class="post-opt" id="inforTab">
                                                    
                                                    <ul>
                                                        <li><i class="fal fa-calendar"></i> <span>${board.boardRegisterDate}</span></li>
                                                        <li><i class="fal fa-calendar"></i> <span>${board.boardId}</span></li>
                                                        <li><i class="fal fa-eye"></i> <span>${board.boardViews}</span></li>
                                                        	
                                                    </ul>
                                                  
                                                </div>
                                                </div>
                                             	 <div class="list-single-main-media fl-wrap">
                                                <div class="single-slider-wrapper fl-wrap">
                                                    <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="${pageContext.request.contextPath}/communityBoardFile/${board.memberUploadImageName}" alt="게시판 이미지"></div>
                                                     
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                                <p>${board.boardContent}</p>
                                                
                                                <c:if test="${board.memberIndex eq member.memberIndex}"> 
                                                 <a href="boardUpdate?boardId=${board.boardId}"><input type="button" class="btn btn-primary" id="updateBtn" value="수정"/></a>                
                                             	 <a class="btn btn-primary" role="button" id="deleteBtn" href="<c:url value='/boardView/${board.boardId}/delete' />" >삭제</a>
                                                </c:if> 
                                                </form>
                                            </div>
                                            <!-- list-single-main-item -->   
                                            <div class="list-single-main-item fl-wrap" id="sec5">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3> 댓글  <span> 댓글 개수 </span></h3>
                                                </div>
                                                <div class="reviews-comments-wrap">
                                                    <!-- reviews-comments-item -->  
                                                    <div class="reviews-comments-item">
                                                        <div class="review-comments-avatar" id="replyImage">
                                                            <img src="../images/avatar/1.jpg" alt=""> 
                                                        </div>
                                                        <div class="reviews-comments-item-text" id="chatBox">
                                                            <h4 style=font-size:13px;><a href="#">작성자</a></h4>
                                                            
                                                            <p style=font-size:11px;>댓글 내용</p>
                                                            <div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>작성일</span> </div>
                                                       		<button type="button" id="danger"class="btn btn-danger">신고</button>
          
                                                        </div>
                                                    </div>
                                                                                                                
                                                </div>
                                            </div>
                                            <!-- list-single-main-item end -->   
                                            <!-- list-single-main-item -->   
                                            <div class="list-single-main-item fl-wrap" id="sec6">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>댓글 등록</h3>
                                                </div>
                                                <!-- Add Review Box -->
                                                <div id="add-review" class="add-review-box">
                                                    <!-- Review Comment -->
                                                    <form id="add-comment" class="add-comment  custom-form" name="rangeCalc" >
                                                        <fieldset>
                                                            <div class="row">
                                                                <!-- <div class="col-md-6">
                                                                    <label><i class="fal fa-user"></i></label>
                                                                    <input type="text" placeholder="Your Name *" value=""/>
                                                                </div> -->
                                                                <div class="col-md-6">
                                                                    <!-- <label><i class="fal fa-envelope"></i>  </label>
                                                                    <input type="text" placeholder="Email Address*" value=""/> -->
                                                                </div>
                                                            </div>
                                                            <textarea cols="40" rows="3" id="COMMENT_CONTENT" name="COMMENT_CONTENT" placeholder="댓글을 입력해주세요"></textarea>
                                                        </fieldset>
                                                       <button class="btn btn-primary" id="comment"type="submit">등록</button>
                                                    </form>
                                                </div>
                                                <!-- Add Review Box / End -->
                                            </div>
                                            <!-- list-single-main-item end -->                                             
                                        </article>
                                        <!-- article end -->                                
                                    </div>
                                    <!--post-container end -->  
                                </div>
                                <!-- blog content end -->
                                <!--   sidebar  -->
                          
                                <!--   sidebar end  -->
                            </div>
                        </div>
                        <div class="limit-box fl-wrap"></div>
            
                    	<a class="btn btn-primary" href="boardList" role="button" id="boardlistpage">자유게시판으로</a>
                    </section>
                    <!-- section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
              <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
              
              <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
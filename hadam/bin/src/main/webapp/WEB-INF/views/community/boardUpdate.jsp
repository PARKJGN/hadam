<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            
            <style>
            	#box {
            		width:1000px;
      				position:relative;
      				right:-200px;

            	}
            	
            	#updateBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
            	}
            	
            	#backBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
            	}
            </style>
            
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- map-view-wrap --> 
                    <div class="map-view-wrap">
                        <div class="container">
                           
                        </div>
                    </div>
                    <!--map-view-wrap end --> 
                    <!-- Map -->
                  
                    <!-- Map end --> 
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="boardList">커뮤니티</a><a href="boardList">자유게시판</a><span>게시글 수정</span></div>
                        </div>
                    </div>
                    <section  id="sec1" class="grey-b lue-bg middle-padding">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-8">
                                    <div class="list-single-main-item fl-wrap" id="box">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>게시글 수정</h3>
                                        </div>
                                        <div id="contact-form">
                                            <div id="message"></div>
                                            <form  class="custom-form" action="updateBoard" name="contactform" id="contactform" method="post">
                                                <fieldset>
                                                	                                              	
                                                	<input name="boardId" type="hidden" value="${board.boardId}"/>
                                                	
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="boardTitle" id="BOARD_TITLE" placeholder="Your Title *" value="${board.boardTitle }" />
                                                	
                                                	<label for="validationCustom02" class="form-label">작성자</label>                                               
                                                    <input type="text" name="memberNickname" id="name" placeholder="Your Name *" value="${board.memberNickname }" disabled/>
                                                    <div class="clearfix"></div>
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="BOARD_CONTENT" cols="40" rows="3" placeholder="Your Message:" >${board.boardContent }</textarea>
                               						
                              						 <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="${pageContext.request.contextPath}/communityBoardFile/${board.memberUploadImageName}"></div>
                                                     
                                                    </div>
                                                                        						
                                                	<input type="file" class="form-control" aria-label="file example" >
                                                   
                                              
                                                </fieldset>
                                                <!-- <button class="btn float-btn color2-bg" style="margin-top:15px;" id="submit">Send Message<i class="fal fa-angle-right"></i></button> -->
                                            	 <div class="col-12">
    												<button class="btn btn-primary" type="submit" id="updateBtn">수정</button>
    												 <a class="btn btn-primary" href="boardView?boardId=${board.boardId}" role="button" id="backBtn">이전</a>
 												 </div>
 												
 												 
                                            </form>
                                        </div>
                                        <!-- contact form  end--> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section-decor"></div>
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
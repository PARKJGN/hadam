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
            	#box{
            		margin-left:300px;
            	}
            	
            	#updateBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 ;				top:-4px;
	 				right:-300px;
            	}
            	
            	#backBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				right:-365px;
	 				top:-50px;
	 				
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
                            <div class="breadcrumbs fl-wrap"><a href="boardList">커뷰니티</a><a href="boardList">자유게시판</a><span>자유게시판 작성</span></div>
                        </div>
                    </div>
                    <section  id="sec1" class="grey-b lue-bg middle-padding">
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-8">
                                    <div class="list-single-main-item fl-wrap" id="box">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>게시글 작성</h3>
                                        </div>
                                        <div id="asd">
                                            <form  class="custom-form" action="saveBoard"  id="contactform" method="post" enctype="multipart/form-data">
                                               
                                             
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="boardTitle" id="boardTitle" placeholder="Your Title *" required/>
                                                	
                                                	<!-- <label for="validationCustom01" class="form-label">이름</label>
                                                    <input type="text" name="boardTitle" id="boardTitle" placeholder="Your Title *"  /> -->
                                                    
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="boardContent" cols="40" rows="3" placeholder="Your Message:" required></textarea>
                               
                                                	<input type="file" name="file" class="form-control" aria-label="file example" required>
                                                	<div class="invalid-feedback">.jpg만 선택해 주세요</div>
                                                
                                                
                                                <!-- <button class="btn float-btn color2-bg" style="margin-top:15px;" id="submit">Send Message<i class="fal fa-angle-right"></i></button> -->
                                         
    												<input type="submit" class="btn btn-primary" id="updateBtn" value="등록"/>
    												 
 										
 												
 												 
                                            </form>
                                            <a class="btn btn-primary" href="boardList" role="button" id="backBtn">취소</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>          
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            <link type="text/css" rel="stylesheet" href="/css/board/boardWrite.css">
    		
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- map-view-wrap --> 
                    <div class="map-view-wrap">
                        <div class="container">                
                        </div>
                    </div>
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="/community/boardList">커뷰니티</a><a href="/community/boardList">자유게시판</a><span>자유게시판 작성</span></div>
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
                                        	<!-- 글작성 폼 -->
                                            <form  class="custom-form" action="saveBoard"  id="contactform" method="post" enctype="multipart/form-data">    
                                            		<!-- 게시글 제목 작성 -->                  				
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="boardTitle" id="boardTitle" placeholder="Your Title *" required/>   
                                                    <!-- 로그인한 사용자 memberIndex 받기 -->                                        	
                                                    <input type="hidden" name="memberIndex" value="${sessionScope.memberIndex}"/>
                                                    <!-- 게시글 내용 작성 -->
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="boardContent" cols="40" rows="3" placeholder="Your Message:" required></textarea><!-- 내용 작성 -->
                                                    <!-- 파일 찾기 -->
                                         			<div class="filebox">
													    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
													    <label for="file">파일찾기</label> 
													    <input type="file" id="file" name="file" >
													</div>
                                         			<!-- 등록버튼 -->
    												<input type="submit" class="btn btn-primary" id="updateBtn" value="등록" />		 
                                            </form>
                                            <!-- 자유게시판목록으로 이동-->
                                            <a class="btn btn-primary" href="boardList" role="button" id="backBtn">취소</a> 
                                        </div>
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
             <script type="text/javascript" src="/js/board/boardWrite.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
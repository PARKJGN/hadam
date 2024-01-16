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
                                                    <input type="text" name="boardTitle" id="boardTitle" placeholder="Your Title *" required/><!-- 게시글 제목 작성 -->                                              	
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="boardContent" cols="40" rows="3" placeholder="Your Message:" required></textarea><!-- 내용 작성 -->
                               
                                                	<!-- <input type="file" name="files" class="form-control" aria-label="file example" multiple >파일 첨부
                                                	<div class="invalid-feasdedback">.jpg만 선택해 주세요</div>    -->                                                                                            
                                         			
                                         			<div class="filebox">
													    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
													    <label for="file">파일찾기</label> 
													    <input type="file" id="file" name="file" required>
													</div>
                                         			
    												<input type="submit" class="btn btn-primary" id="updateBtn" value="등록" />
				 
                                            </form>
                                            <a class="btn btn-primary" href="boardList" role="button" id="backBtn">취소</a> <!-- 자유게시판목록으로 이동-->
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
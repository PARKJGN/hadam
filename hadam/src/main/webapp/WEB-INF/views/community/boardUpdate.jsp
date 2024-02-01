<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            <link type="text/css" rel="stylesheet" href="/css/board/boardUpdate.css">
            <div id="wrapper">
                <div class="content">  
                    <div class="map-view-wrap">
                        <div class="container">                           
                        </div>
                    </div>               
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                        	<!-- 게시글 수정 페이지 -->
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
                                            
                                            <!-- 게시글 수정 폼 시작 -->
                                            <form  class="custom-form" action="updateBoard" name="contactform" id="contactform" method="post" enctype="multipart/form-data">
                                                <fieldset>
                                                	<!-- 해당게시글 번호 -->                                              				
                                                	<input name="boardId" type="hidden" value="${board.boardId}" readonly/>
                                                	<!-- 해당게시글 회원의 memberIndex -->
                                                	<input type="hidden" name="memberIndex" value="${sessionScope.memberIndex}" />                                                	
                                                	<!-- 해당게시글의 글 제목 -->
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="boardTitle" id="BOARD_TITLE" placeholder="Your Title *" value="${board.boardTitle }" /> <!-- 글 제목 -->
                                                	<!-- 해당게시글의 작성자 -->
                                                	<label for="validationCustom02" class="form-label">작성자</label>                                               
                                                    <input type="text" name="memberNickname" id="name" placeholder="Your Name *" value="${board.memberNickname }" disabled/><!-- 회원 별명 -->
                                                    <div class="clearfix"></div>
                                                    <!-- 해당게시글의 글 내용 -->
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="BOARD_CONTENT" cols="40" rows="3" placeholder="Your Message:" >${board.boardContent }</textarea><!-- 게시판 내용 -->
                               						<!-- 해당게시글의 파일첨부이미지 -->
                              						 <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="${pageContext.request.contextPath}/communityBoardFile/${board.memberUploadImageName}"></div><!-- 파일첨부한 경로 및 이미지 이름-->                                                     
                                                    </div>
                                                    <!-- 파일첨부  -->                    						
                                                	<div class="filebox">
													    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
													    <label for="file">파일찾기</label> 
													    <input type="file" id="file" name="file">
													</div>     
                                                </fieldset>
                                            	 <div class="col-12">
                                            	 	<!-- 클릭 시 수정되며 지금페이지로 redirect  -->
    												<button class="btn btn-primary" type="submit" id="updateBtn">수정</button>
    												<!-- 이전 페이지인 상세 페이지로 이동 -->
    												 <a class="btn btn-primary" href="boardView?boardId=${board.boardId}" role="button" id="backBtn">이전</a>
 												 </div>									 
                                            </form>
                                            <!-- 게시글 수정 폼 끝 -->
                                        </div>                                 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section-decor"></div>
                    </section>
                </div>
            </div>
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>            
             <script  src="https://code.jquery.com/jquery-3.7.1.js"	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
             <script type="text/javascript" src="/js/board/boardUpdate.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
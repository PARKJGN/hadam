<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="KO">
<!-- header -->
<jsp:include page="/WEB-INF/layout/adminHeader.jsp"></jsp:include>
<!-- header of end -->
<!-- sidebar -->
<jsp:include page="/WEB-INF/layout/adminSidebar.jsp"></jsp:include>
<!-- sidebar of end -->
<link type="text/css" rel="stylesheet" href="/css/admin/admins.css">

        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title"> 게시판 관리 </h2>
                                <div class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">자유게시판</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">
                    	<div class="table-responsive">
	                        <table class="table">
	                            <thead class="bg-light">
	                                <tr class="border-0">
	                                    <th class="border-0">No</th>
	                                    <th class="border-0">제목</th>
	                                    <th class="border-0">작성자</th>
	                                    <th class="border-0">조회수</th>
	                                    <th class="border-0">작성일</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach var="board" items="${boardList }">
		                                <tr>
		                                    <td>${board.boardId }</td>
		                                    <td><a href="/community/boardView?boardId=${board.boardId }">${board.boardTitle }</a></td>
		                                    <td>${board.memberNickname }</td>
		                                    <td>${board.boardViews }</td>
		                                    <td>
		                                    <fmt:formatDate value="${board.boardRegisterDate}" pattern="yyyy/MM/dd" />
		                                    </td>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
                    	</div>
                    </div>
                </div>
            </div>
            <!-- 페이지 설정 -->
			<div class="pagination" id="page">
				<a href="/admin/adminBoardManagement?page=1" class="prevposts-link"><i class="fa fa-angle-double-left"></i></a>
				<a href="/admin/adminBoardManagement?page=${prevMax}" class="prevposts-link"><i class="fa fa-angle-left"></i></a>
				<c:forEach items="${numList}" var="num">
					<a href="/admin/adminBoardManagement?page=${num}">${num}</a>
				</c:forEach>
				<a href="/admin/adminBoardManagement?page=${nextMin}" class="nextposts-link"><i class="fa fa-angle-right"></i></a>
				<a href="/admin/adminBoardManagement?page=${lastPage}" class="nextposts-link"><i class="fa fa-angle-double-right"></i></a>
			</div>									                                          
			<!-- 페이지 설정 end--> 
<!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->

<!-- 게시글 상세보기 모달창 -->
<%-- <div id="boardModal">
	<article class="post-article">                                          
		<div class="list-single-main-item fl-wrap" >
			<div class="list-single-main-item-title fl-wrap" >
			<div class="list-single-main-item-title fl-wrap" >
				<!-- 게시글 제목 -->
				<h3 style=font-size:20px; id="aBoardTitle">${board.boardTitle}</h3>
				</div>		            
					<!--회원 별명-->                                         
				<div class="post-author" id="aBoardUserName"><a href="#"><img src="/communityBoardFile/d1fa1aea12bb6c5633762505152d9561" alt=""><span>${board.memberNickname}</span></a></div> 
				<div class="post-opt" id="inforTab">
					<ul>											
					    <li><i class="fal fa-calendar"></i> <span>
					    <!--게시판 등록일-->
				<fmt:formatDate id="aBoardRegisterDate" value="" pattern="yyyy/MM/dd HH:MM:SS" />                                                
				</span></li>
				 <!-- 게시판 조회수-->
				<li><i class="fal fa-eye"></i> <span id="aBoardViews">${board.boardViews}</span></li>                        	
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
						    <img src="/communityBoardFile/d1fa1aea12bb6c5633762505152d9561" alt=""> 
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
							<c:if test="${comment.memberIndex ne sessionScope.memberIndex}">
							<!-- 신고클릭시 함수호출 -->
							<button type="button" id="danger" class="btn btn-danger" onclick="commentReport()">신고</button>
							</c:if>
				        </div>
				    </div>
				</div>
				</c:forEach>
			</div> 
		</div>
	</article>
</div> --%>

<script src="/js/admin/admins.js"></script>


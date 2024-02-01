<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!--
 	파일명 	mypageBoard
	페이지명	내 게시물 페이지
	작성자 	최성익  
-->

<link type="text/css" rel="stylesheet" href="/css/mypage/mypageBoard.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->


<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<!-- mypageheader -->
		<jsp:include page="/WEB-INF/views/mypage/mypageHeader.jsp"></jsp:include>
		<!-- mypageheader end -->
		<!-- section-->
		<section class="middle-padding">
			<div class="container">
				<div class="dasboard-wrap fl-wrap">
					<!-- dashboard-content-->
					<div class="dashboard-content fl-wrap">
						<div class="dashboard-list-box fl-wrap">

							<div id="table">
								<!--자유게시판 컬럼명  -->

								<table border="1" id="tableTh">
									<thead>
										<tr>
											<th class="boardTitle">제목</th>
											<th class="boardDate">날짜</th>
											<th class="boardCount">조회수</th>
										</tr>
									</thead>
								</table>

								<hr style="opacity: 0.1;" />


								<!-- 게시판 목록출력 -->
								<div class="" id="boardTd">
									<table border="1" id="tableList">
										<tbody>
										<c:forEach items="${boardList}" var="board">
											
												<tr class="boardList">
													<td class="boardTitle"><a
														href="/community/boardView?boardId=${board.boardId}">
														<div class="boardTitle">${board.boardTitle}</div></a></td>
													<td class="boardDate"><fmt:formatDate value="${board.boardRegisterDate}" pattern="yyyy/MM/dd" /></td>
													<td class="boardCount">${board.boardViews}</td>
												</tr>
												<tr>
													<td><hr style="opacity: 0.1;" /></td>
													<td><hr style="opacity: 0.1;" /></td>
													<td><hr style="opacity: 0.1;" /></td>
												</tr>
											
										</c:forEach>
									</tbody>
									</table>
									<hr style="opacity: 0.1;" />

								</div>
							</div>


						</div>
						<!-- pagination-->
						<div class="pagination">
							<a href="#" class="prevposts-link"><i
								class="fa fa-caret-left"></i></a> <a href="#" class="current-page">1</a>
							<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#"
								class="nextposts-link"><i class="fa fa-caret-right"></i></a>
						</div>
					</div>
					<!-- dashboard-list-box end-->
				</div>

			</div>
		</section>
		<div class="limit-box fl-wrap"></div>
	</div>
	<!-- content end-->
</div>
<!--wrapper end -->

<!--footer -->
<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
<!--footer end -->

<!--=============== 개인 js  ===============-->
<!-- <script type="text/javascript" src="/js/mypage/mypagePassword.js"></script> -->

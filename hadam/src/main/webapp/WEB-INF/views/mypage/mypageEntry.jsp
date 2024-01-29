<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageEntry
	페이지명	동행신청 받는 페이지
	작성자 	최성익  
-->

<link type="text/css" rel="stylesheet"
	href="/css/mypage/mypageEntry.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->


<c:if test="${msg != null}">
    <div id="msg" hidden><%= request.getAttribute("msg") %></div>
</c:if>


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
				<!--dasboard-wrap-->
				<div class="dasboard-wrap fl-wrap">
					<!-- dashboard-content-->
					<div class="dashboard-content fl-wrap">
						<div class="dashboard-list-box fl-wrap">
							<div class="dashboard-header fl-wrap">
								<h3>동행신청</h3>
							</div>

							<c:forEach var="entry" items="${entryList}">
								<!-- dashboard-list end-->
								<div class="dashboard-list">
									<div class="dashboard-message">

										<!-- <span class="new-dashboard-item">New</span> -->
										<div class="dashboard-message-avatar">
											<!-- 프로필 사진 경로 -->
											<img src="/images/avatar/1.jpg" alt="">
										</div>
										<div class="dashboard-message-text">
											<!-- 닉네임, 신청일 -->
											<h4 class="h4_inline">${entry.memberNickname}
												<span>${entry.entryApplicationDate}</span>
											</h4>
											<div>
												<a id="entryRejection">거절</a> <a id="entryAccept"
													href="/mypage/entryAccept?boardId=${entry.boardId}&guestMemberIndex=${entry.memberIndex}">수락</a>
											</div>
											<div class="booking-details fl-wrap">
												<span class="booking-title">동행 신청 스케줄</span> <span
													class="booking-text"><a href="#">링크 걸어줘야
														함${entry.scheduleTableId}</a></span>
											</div>
											<span class="fw-separator"></span>
											<p class="p_inline">${entry.entryApplicationContent}</p>
										</div>
									</div>
								</div>
								<!-- dashboard-list end-->
							</c:forEach>


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
				<!-- dasboard-wrap end-->
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
<script type="text/javascript" src="/js/mypage/mypageEntry.js"></script>

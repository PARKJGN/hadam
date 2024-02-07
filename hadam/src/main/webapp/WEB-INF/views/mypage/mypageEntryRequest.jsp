<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageEntryRequest
	페이지명	보낸 동행신청 페이지
	작성자 	최성익  
-->

<link type="text/css" rel="stylesheet"
	href="/css/mypage/mypageEntry.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->


<c:if test="${msg != null}">
	<div id="msg" hidden><%=request.getAttribute("msg")%></div>
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
								<h3>보낸 동행 신청</h3>
							</div>

							<c:forEach var="entry" items="${entryList}">
								<!-- dashboard-list end-->
								<div class="dashboard-list">
									<div class="dashboard-message">

										<!-- <span class="new-dashboard-item">New</span> -->
										<div class="dashboard-message-avatar">
											<!-- 프로필 사진 경로 -->
											<img src="/images/profile/${entry.memberUploadImageName}.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';">
										</div>
										<div class="dashboard-message-text entryContents">
											<!-- 닉네임, 신청일 -->
											<h4 class="h4_inline">${entry.memberNickname}
												<span>${entry.entryApplicationDate}</span>
											</h4>
											<div class="entryDetail">
												<div class="entryBtnWap">
													<!-- 대기중인 신청 -->
													<c:if test="${entry.entryStatus == 0}">
														<a id="entryRejection"
															href="/mypage/entryCancel?boardId=${entry.boardId}&guestMemberIndex=${entry.memberIndex}">취소</a>
													</c:if>
													<!-- 수락한 신청 -->
													<c:if test="${entry.entryStatus == 1}">
														<a id="alreadyEntryAccept">수락된 신청</a>
													</c:if>
													<!-- 거절한 신청 -->
													<c:if test="${entry.entryStatus == 2}">
														<a id="alreadyEntryRejection">거절된 신청</a>
													</c:if>
												</div>
												<div class="booking-details fl-wrap">
													<span class="booking-title">동행 신청 스케줄</span> <span
														class="booking-text"><a href="/community/scheduleShareList/1">${entry.boardId}</a></span>
												</div>
											</div>
											<span class="fw-separator"></span> <span class="p_inline">${entry.entryApplicationContent}</span>
										</div>
									</div>
								</div>
								<!-- dashboard-list end-->
							</c:forEach>


						</div>
						<!-- pagination-->
						<!-- <div class="pagination">
							<a href="#" class="prevposts-link"><i
								class="fa fa-caret-left"></i></a> <a href="#" class="current-page">1</a>
							<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#"
								class="nextposts-link"><i class="fa fa-caret-right"></i></a>
						</div> -->
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

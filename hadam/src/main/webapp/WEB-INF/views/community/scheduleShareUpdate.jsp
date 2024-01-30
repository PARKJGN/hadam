<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->
<!--  wrapper  -->
<head>
<link type="text/css" rel="stylesheet"
	href="/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet"
	href="/css/board/scheduleShareWrite.css">
</head>
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<!-- map-view-wrap -->
		<div class="map-view-wrap">
			<div class="container"></div>
		</div>
		<!--map-view-wrap end -->
		<!-- Map -->

		<!-- Map end -->
		<div class="breadcrumbs-fs fl-wrap">
			<div class="container">
				<div class="breadcrumbs fl-wrap">
					<a href="/community/scheduleShareList/1">커뮤니티</a><a href="/community/scheduleShareList/1">스케줄 공유 게시판</a><span>게시글 수정</span>
				</div>
			</div>
		</div>
		<div class="container" id="full">
		<section id="sec1" class="grey-b lue-bg middle-padding">
			<div class="col-list-wrap fw-col-list-wrap">
				<div class="list-single-main-item fl-wrap" id="writeBox">
					<div class="list-single-main-item-title fl-wrap">
						<h3>공유 스케줄 수정</h3>
					</div>
					<div id="asd">
						<!-- 공유 스케줄 수정 폼 시작 -->
						<form class="custom-form" action="scheduleTableUpdate"
							id="contactform" method="post">
							<!-- 해당 게시글 boardId -->
							<input name ="boardId" type='hidden' value="${schedule.boardId}">
							<!-- 내가 작성한 스케줄들 중 ajax를 통해 선택한 스케줄 불러오기 (아래태그에 넣어짐) -->
							<div id="modalScheduleTableList">									
								<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox"></div>
							</div>
							<!-- 희망 성별 -->
							<label for="validationTextarea" class="form-label">희망 성별</label>
							<fieldset>
							  <!-- 남자 -->
							  <label for="agree1" class="radio_box">
									<input type="radio" id="agree1" name="boardSex" value="남자" checked="checked" />
									<span class="on"></span>
									남자
							  </label>
								<!-- 여자 -->
							  <label for="agree2" class="radio_box">
								    <input type="radio" id="agree2" name="boardSex" value="여자" />
								    <span class="on"></span>
								    여자
							  </label>
							</fieldset>
							<!-- 희망 나이 선택 -->
							<div class="selectBox">
							  <select name="boardAge" class="select">
							    <option disabled selected>희망 나이</option>
							    <option value="20~29">20~29</option>
							    <option value="30~39">30~39</option>
							    <option value="40~49">40~49</option>
							    <option value="50~59">50~59</option>
							  </select>
							  <span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
							</div>
							<!-- 참가인원 수 선택 -->
							<div class="selectBox">
							  <select name="chatRoomMax" class="select">
							    <option disabled selected>참가인원수</option>
							    <option value="2">2명</option>
							    <option value="3">3명</option>
							    <option value="4">4명</option>
							    <option value="5">5명</option>
							  </select>
							  <span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
							</div>
							<!-- 게시글 제목 작성 -->
							<label for="validationCustom01" class="form-label">제목</label> <input
								type="text" name="boardTitle" id="boardTitle"
								placeholder="제목을 입력해주세요" required />
							<!-- 게시글 내용 작성 -->
							<label for="validationTextarea" class="form-label">글 내용</label>
							<textarea name="boardContent" id="boardContent" cols="40"
								rows="3" placeholder="메시지를 입력해주세요" required></textarea>
							<!-- 게시글 수정 -->
							<input type="submit" class="btn btn-primary" id="comment" value="수정" />

						</form>
						<!-- 공유 스케줄 수정 폼 끝 -->
						<a class="btn btn-primary" href="/community/scheduleShareList"
							role="button" id="backBtn">취소</a>
						<!-- 자유게시판목록으로 이동-->

					</div>
					<!-- 버튼 클릭시 내가 작성한 스케줄 리스트들 출력 -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop"
						id="shareBtn">스케줄 불러오기</button>
				</div>

			</div>



		</section>
		</div>
		<!-- section end -->
	</div>
	<!-- content end-->
</div>
<!--wrapper end -->
<!--footer -->



<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>

<div class="modal fade " id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen modal-dialog-centered">
		<div class="modal-content asdf">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">내 스케줄</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">


				<c:forEach items="${scheduleTableList}" var="scheduleTableList"
					varStatus="loop">
					<div class="list-main-wrap-opt fl-wrap" id="modalpadding">
						<div class="list-main-wrap-title fl-wrap col-title"
							id="modalScheduleTitle">
							<h2>
								Schedule : <span> ${scheduleTableList.scheduleTableName }
								</span>
							</h2>
						</div>

						<div class="geodir-category-content fl-wrap title-sin_item">

							<div class="geodir-category-content-title-item">
								<h3 class="title-sin_map" id="modalScheduleTime">
									<%
									// boardRegisterDate를 받아오는 부분, 예시로 현재 시간을 사용
									Date scheduleTableRegisteDate = new Date();
									// SimpleDateFormat을 사용하여 날짜를 원하는 형식으로 포맷
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									String formattedDate = sdf.format(scheduleTableRegisteDate);
									%>

									<%=formattedDate%>
								</h3>
							</div>
				
							<button type="button"
								class="btn btn-primary btn-sm scheduleSelectBtn"
								id="scheduleSelect${loop.index}"
								data-schedule-id="${scheduleTableList.scheduleTableId}"
								data-bs-dismiss="modal">선택</button>

						</div>
					</div>
				</c:forEach>




			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/js/board/scheduleUpdate.js"></script>
<script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>

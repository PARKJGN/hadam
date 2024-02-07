<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<head>
<link type="text/css" rel="stylesheet"
	href="/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet"
	href="/css/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/css/board/scheduleShareList.css">
</head>
<!--  header end -->
<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<!--  section  -->
		<section class="parallax-section single-par"
			data-scrollax-parent="true">
			<div class="bg par-elem " data-bg="/images/board/back4.png"
				data-scrollax="properties: { translateY: '30%' }"></div>
			<div class="overlay"></div>
			<div class="container">
				<div class="section-title center-align big-title">
					<h2>
						<span>Hadam(하루를 담다)</span>
					</h2>
					<span class="section-separator"></span>
					<h4>당신의 완벽한 하루를 공유하세요!</h4>
				</div>
			</div>
		</section>
		<!--  section  end-->
		<div class="breadcrumbs-fs fl-wrap">
			<div class="container" id="moveTab">
				<div class="breadcrumbs fl-wrap">
					<a href="#" style="text-decoration:none; font-size:16px;">커뮤니티</a><span style="font-size:16px;">스케줄 공유 게시판</span>
				</div>
			</div>
		</div>
		<div class="container" id="full">
		<div class="list-main-wrap fl-wrap card-listing" id="box">
			<!-- 로그인한 사용자의 memberIndex가 있을 때만 스케줄 공유하기 버튼 활성화 -->
			<c:if test="${not empty sessionScope.memberIndex}">
			<div class="shareBtnBox">
				<a class="btn btn-primary" href="/community/scheduleShareWrite"
					role="button" id="shareBtn">스케줄 공유하기</a>
			</div>
			</c:if>
			<!-- 최신순,오래된순으로 게시판 조회 -->
		    
			<!-- 공유게시판 목록 출력 시작 스케줄테이블에 대한 리스트-->
			<c:forEach items="${map}" var="map" varStatus="outerIndex">
				<div class="scheduleTitle" id="scheduleTitle">
					<h5>		
						 <!-- 게시글 제목 -->																																																																																	
						 <strong style="font-size:16px;">Schedule</strong> : <span style="font-size:16px;"><strong>${map.key.boardTitle}</strong></span> 
						 <!-- 게시글 등록일 -->
						 <span><i class="fa-solid fa-calendar-days" style="margin-left:10px;"><a href=""><strong style="font-size:12px; color:#46649B"><fmt:formatDate value="${map.key.boardRegisterDate}" pattern="yyyy/MM/dd" /></strong> </a></i></span>
					</h5>
				</div>			
				<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox">
				<!-- 스케줄에 대한 리스트 시작 -->
					<c:forEach items="${map.value}" var="schedule" varStatus="innerIndex">
						<div class="listing-item" id="listItem">
							<article class="geodir-category-listing fl-wrap" style="width: 150px">
								<div class="geodir-category-img listImg">
								 	<!-- 게시판 이미지 클릭시 장소 상세페이지로이동, 게시판 장소이미지 출력 -->
									<a href="/location/locationDetail?locationId=${schedule.locationId }"><img
										src="/images/location/${schedule.locationName}.jpg" alt="" 
										onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/girlfriend.jpg'"></a>
									<div class="geodir-category-opt"></div>
								</div>
								<div class="geodir-category-content fl-wrap title-sin_item"
									style="height: 90px;">
									<div class="geodir-category-content-title fl-wrap">
										<div class="geodir-category-content-title-item">
											<!-- 스케줄 시간 -->
											<h3 class="title-sin_map">${schedule.scheduleStartTime}~${schedule.scheduleEndTime }</h3>
											<div class="geodir-category-location fl-wrap">
												<!-- 장소명 클릭시 해당 장소 상세페이지로이동 -->
												<a  href="/location/locationDetail?locationId=${schedule.locationId}">
												<i class="fas fa-map-marker-alt"></i>${schedule.locationName }</a>
											</div>
										</div>
									</div>
								</div>
							</article>							
						</div>
						<!-- 마지막화살표는 안보이게 -->
						<c:if test="${!innerIndex.last}">					
								<div class="arrowBox1">
									<div class="arrow"></div>
								</div>
						</c:if>
					</c:forEach>
					<!-- 스케줄 리스트 끝 -->
					<!-- 게시글 작성시 입력한 조건들 출력 -->
					<div class="infor">
						<p style="font-size:14px; color:black"><strong>희망성별 : ${map.key.boardSex}</strong></p>
						<p style="font-size:14px; color:black"><strong>희망나이 : ${map.key.boardAge}</strong></p>
						<!-- 최대인원보다 참가인원이 작을때만 보여줌 -->
						<c:if test="${map.key.chatRoomCount lt map.key.chatRoomMax}">
																						<!-- 참가인원 수/최대인원 수 -->
						<p style="font-size:14px; color:black"><strong>참가인원 : ${map.key.chatRoomCount}/${map.key.chatRoomMax} </strong></p>
						</c:if>
						
						<!-- 참가인원수가 다찼을 때 보여줌 -->
						<c:if test="${map.key.chatRoomCount ge map.key.chatRoomMax}">
						<p style="font-size:14px; color:black"><strong>참가인원 : Max </strong></p>
						</c:if>
					</div>					
				</div>
				<!-- 상세보기 클릭시 모달창 띄우기 openDetailModal함수호출 호출시 인자에 해당 게시글의 boardId와 로그인한 사용자의 memberIndex를 돌고감-->
				<button type="button" class="btn btn-primary modalBtn"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop2"
					onclick="openDetailModal(${map.key.boardId},${sessionScope.memberIndex})">상세보기</button>				
			</c:forEach>
			<!-- 공유게시판 목록 출력 끝 -->
			<!-- 페이징 처리-->
			<div class="pagination" id="page">		
			</div> 
		</div>
		</div>
	</div>
	<!-- content end-->
</div>
<!--wrapper end -->
<!--footer -->
<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
<!-- 상세보기 모달창(첫번째) -->
<div class="modal fade " id="staticBackdrop2" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen ">
		<div class="modal-content asdf1" style="height: 1000px; border-radius:10px; box-shadow:0 2px 3px 0 rgba(34,36,38,0,15);">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>상세보기</strong></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">		
				<!-- 첫번째 모달창 가져오기 -->
				<div id="modalScheduleDetail"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 스케줄 참가하기 모달창 (두번째)-->
<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen">
		<div class="modal-content asdf2" style="height: 500px; border-radius:10px; box-shadow:0 2px 3px 0 rgba(34,36,38,0,15); border:solid 1px">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>스케줄 참가신청</strong></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">				
				<div id="scheduleAttend"></div>
				<!-- 사용자 프로필사진, 이름 출력 -->
				<div class="post-author" id="userInfo1">
													<!-- 로그인한 사용자의 프로필사진 -->																										<!-- 로그인한 사용자의 닉네임 -->
					<a href="#"><img src="/images/profile/${sessionScope.memberUploadImageName}.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';" alt=""><span>${sessionScope.memberNickname}</span></a>
				</div>
				<!-- 참가신청서 작성 -->
				<form class="custom-form" action="/community/scheduleAttendWrite" id="contactform" method="post">							
					<!-- ajax를 통해 해당 게시글의 memberIndex, scheduleTableId, boardId를 아래태그에 받아옴 -->
					<div id="getBoardId"></div>
					<!-- 로그인한 사용자의 memberIndex받아오기 -->
					<input type="hidden" name="memberIndex"
						value="${sessionScope.memberIndex}" /> <label
						for="validationTextarea" class="form-label">글 내용</label>
					<!-- 글 내용 입력하기 -->
					<textarea name="entryApplicationContent" id="boardContent" 
						cols="40" rows="3" placeholder="메시지를 입력해주세요" required></textarea>
					<!-- 신청 버튼 클릭시 신청됨, scheduleAttendWrite함수 호출  -->
					<input type="submit" class="btn btn-primary" id="comment1"
						value="신청" data-bs-dismiss="modal" onclick="scheduleAttendWrite()" />
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	// 페이징처리
	var pageNum = "${pvo.pageNum}"
	var pageLastPage = "${pvo.lastPage}"
	var pageEndPage = "${pvo.endpage}"
	var pageStartPage = "${pvo.startpage}"
</script>

<script type="text/javascript" src="/js/board/scheduleShareList.js"></script>
<script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>

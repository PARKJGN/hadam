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
			<div class="shareBtnBox">
				<a class="btn btn-primary" href="/community/scheduleShareWrite"
					role="button" id="shareBtn">스케줄 공유하기</a>
			</div>
			 <!-- <div class="dasboard-menu">
                                    <div class="dasboard-menu-btn color3-bg">Dashboard Menu <i class="fal fa-bars"></i></div>
                                    <ul class="dasboard-menu-wrap" >         
                                        <li><a href="/community/boardList" class="user-profile-act" id="boardTap"><i class="far fa-comments"></i> 스케줄 공유 게시판 </a></li>
                                    </ul>
                                </div> -->
		    <form action="/community/searchScheduleBoards" name="searchForm" method="get" style="text-align:left;">
	                    <div class="fields">
	                        <div class="field">
	                            <div id="searchWarp">
	                                <select name="searchType" class="searchType">
	                                    <option value="">날짜별</option>
	                                    <option value="T">최신순</option>
	                                    <option value="P">오래된순</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
			</form> 
			
			<c:forEach items="${map}" var="map" varStatus="outerIndex">

				<div class="scheduleTitle" id="scheduleTitle">
					<h5>
						 <strong>Schedule</strong> : <span><a href=""><strong>${map.key.boardTitle}</strong> </a></span>
					</h5>
				</div>
				
				<div class="scheduleTitle" id="scheduleTitle">
					<h5>
						 <strong>작성일</strong> : <span><a href=""><strong>${map.key.boardTitle}</strong> </a></span>
					</h5>
				</div>
				
				<div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox">
					<c:forEach items="${map.value}" var="schedule" varStatus="innerIndex">

						<div class="listing-item" id="listItem">
							<article class="geodir-category-listing fl-wrap" style="width: 120px">
								<div class="geodir-category-img listImg">
									<a href="/location/locationDetail?locationId=${schedule.locationId }"><img
										src="/images/location/${schedule.locationName}.jpg" alt=""></a>
									<div class="geodir-category-opt"></div>
								</div>
								<div class="geodir-category-content fl-wrap title-sin_item"
									style="height: 90px;">
									<div class="geodir-category-content-title fl-wrap">
										<div class="geodir-category-content-title-item">
											<h3 class="title-sin_map">${schedule.scheduleStartTime}~${schedule.scheduleEndTime }</h3>
											<div class="geodir-category-location fl-wrap">
												<a  href="/location/locationDetail?locationId=${schedule.locationId}">
												<i class="fas fa-map-marker-alt"></i>${schedule.locationName }</a>
											</div>
										</div>
									</div>

								</div>
							</article>
							
						</div>
						<c:if test="${!innerIndex.last}">
								<div class="arrowBox1">
									<div class="arrow"></div>
								</div>
							</c:if>
					</c:forEach>
			
					<div class="infor">
						<p style="font-size:14px; color:black"><strong>희망성별 : ${map.key.boardSex}</strong></p>
						<p style="font-size:14px; color:black"><strong>희망나이 : ${map.key.boardAge}</strong></p>
						<c:if test="${map.key.chatRoomCount lt map.key.chatRoomMax}">
						<p style="font-size:14px; color:black"><strong>참가인원 : ${map.key.chatRoomCount}/${map.key.chatRoomMax} </strong></p>
						</c:if>
						<c:if test="${map.key.chatRoomCount ge map.key.chatRoomMax}">
						<p style="font-size:14px; color:black"><strong>참가인원 : Max </strong></p>
						</c:if>
					</div>
					
				</div>
				
				<button type="button" class="btn btn-primary modalBtn"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop2"
					onclick="openDetailModal(${map.key.boardId},${sessionScope.memberIndex})">상세보기</button>
			</c:forEach>
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

<div class="modal fade " id="staticBackdrop2" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen ">
		<div class="modal-content asdf1" style="height: 1000px; border-radius:10px; box-shadow:0 2px 3px 0 rgba(34,36,38,0,15)">

			<div class="modal-header">

				<h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>상세보기</strong></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
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

<!-- 스케줄 참가하기 모달창 -->
<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen ">
		<div class="modal-content asdf2" style="height: 500px; border-radius:10px; box-shadow:0 2px 3px 0 rgba(34,36,38,0,15); border:solid 1px">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>스케줄 참가신청</strong></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">				
				<div id="scheduleAttend"></div>
				<div class="post-author" id="userInfo1">
					<a href="#"><img src="/images/avatar/1.jpg" alt=""><span>${sessionScope.memberNickname}</span></a>
				</div>
				<form class="custom-form" action="/community/scheduleAttendWrite" id="contactform" method="post">
					<!-- boardId, scheduleTableId, memberIndex 값 가져오기 -->
							
						<div id="getBoardId"></div>
						
						
	
					<input type="hidden" name="memberIndex"
						value="${sessionScope.memberIndex}" /> <label
						for="validationTextarea" class="form-label">글 내용</label>
					<textarea name="entryApplicationContent" id="boardContent" 
						cols="40" rows="3" placeholder="메시지를 입력해주세요" required></textarea>
					<input type="submit" class="btn btn-primary" id="comment1"
						value="신청" data-bs-dismiss="modal" onclick="scheduleAttendWrite()" />
				</form>
			</div>

		</div>
	</div>
</div>
<script>
	var pageNum = "${pvo.pageNum}"
	var pageLastPage = "${pvo.lastPage}"
	var pageEndPage = "${pvo.endpage}"
	var pageStartPage = "${pvo.startpage}"
	

</script>

<script type="text/javascript" src="/js/board/scheduleShareList.js"></script>
<script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>


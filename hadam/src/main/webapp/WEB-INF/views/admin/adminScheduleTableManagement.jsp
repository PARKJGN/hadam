<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link type="text/css" rel="stylesheet"
	href="/css/board/scheduleShareList.css">
</head>

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
                                    	<li class="breadcrumb-item active" aria-current="page">스케줄공유게시판</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">
                    <div class="list-main-wrap fl-wrap card-listing" id="box">
			<div class="shareBtnBox">
				<a class="btn btn-primary" href="/community/scheduleShareWrite"
					role="button" id="shareBtn">스케줄 공유하기</a>
			</div>
			<!-- 최신순,오래된순으로 게시판 조회 -->
		    <form action="/community/searchScheduleBoards/1" name="searchForm" method="get" style="text-align:left;">
                <div class="fields">
                    <div class="field">
                        <div id="searchWarp">
                            <select name="searchType" class="searchType" onchange="boardSubmitForm()">
                                <option value="">날짜별</option>
                                <option value="P">오래된순</option>
                                <option value="T">최신순</option>	                                    
                            </select>
                        </div>
                    </div>
                </div>	
			</form> 
			<!-- 공유게시판 목록 출력 시작 -->
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
					<c:forEach items="${map.value}" var="schedule" varStatus="innerIndex">
						<div class="listing-item" id="listItem">
							<article class="geodir-category-listing fl-wrap" style="width: 150px">
								<div class="geodir-category-img listImg">
								 	<!-- 게시판 이미지 클릭시 장소 상세페이지로이동, 게시판 장소이미지 출력 -->
									<a href="/location/locationDetail?locationId=${schedule.locationId }">
									<img style="width:100px; height: 70px;"
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
					<!-- 게시글 작성시 입력한 조건들 출력 -->
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
					<div>
					<button type="button"  class="btn btn-primary modalBtn"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop2"
					onclick="openDetailModal(${map.key.boardId},${sessionScope.memberIndex})">상세보기</button>
					</div>
				</div>
				<!-- 상세보기 클릭시 모달창 띄우기 openDetailModal함수호출 -->
				
			</c:forEach>
			<!-- 공유게시판 목록 출력 끝 -->
			<!-- 페이징 처리-->
			<div class="pagination" id="page">		
			</div> 
		</div>
                    
                    	<!-- <div class="table-responsive">
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
	                            	<c:forEach var="sTable" items="${sTableList}">
		                                <tr>
		                                    <td>${sTable.scheduleTableId }</td>
		                                    <td><a id="modalScheduleDetail">${sTable.scheduleTableName }</a></td>
		                                    <td>${sTable.memberNickname }</td>
		                                    <td>${sTable.boardViews }</td>
		                                    <td>
		                                    <fmt:formatDate value="${sTable.scheduleTableRegisteDate }" pattern="yyyy/MM/dd" />
		                                    </td>
		                                </tr> 
	                                </c:forEach>
	                            </tbody>
	                        </table>
                    	</div> -->
                    	
                    	
                    </div>
                </div>
            </div>
<%--             <!-- 페이지 설정 -->
			<div class="pagination" id="page">
				<a href="/admin/adminScheduleTableManagement?page=1" class="prevposts-link"><i class="fa fa-angle-double-left"></i></a>
				<a href="/admin/adminScheduleTableManagement?page=${prevMax}" class="prevposts-link"><i class="fa fa-angle-left"></i></a>
				<c:forEach items="${numList}" var="num">
					<a href="/admin/adminScheduleTableManagement?page=${num}">${num}</a>
				</c:forEach>
				<a href="/admin/adminScheduleTableManagement?page=${nextMin}" class="nextposts-link"><i class="fa fa-angle-right"></i></a>
				<a href="/admin/adminScheduleTableManagement?page=${lastPage}" class="nextposts-link"><i class="fa fa-angle-double-right"></i></a>
			</div>									                                          
			<!-- 페이지 설정 end--> 
 --%><!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->

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

<script>
	// 페이징처리
	var pageNum = "${pvo.pageNum}"
	var pageLastPage = "${pvo.lastPage}"
	var pageEndPage = "${pvo.endpage}"
	var pageStartPage = "${pvo.startpage}"
	

</script>
<script src="/js/admin/admins.js"></script>


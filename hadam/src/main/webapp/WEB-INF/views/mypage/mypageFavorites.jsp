<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageFavorite
	페이지명	장소 즐겨찾기 페이지
	작성자 	최성익  
-->

<!-- 개인 css -->
<link type="text/css" rel="stylesheet" href="/css/mypage/mypageFavorites.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<!-- mypage header 추가 -->
		<jsp:include page="/WEB-INF/views/mypage/mypageHeader.jsp"></jsp:include>
		<!-- section-->
		<section class="middle-padding">
			<div class="container">
				<!--dasboard-wrap-->
				<div class="dasboard-wrap fl-wrap">
					<!-- dashboard-content-->
					<div class="dashboard-content fl-wrap">
						<div class="dashboard-list-box fl-wrap">
							<div class="dashboard-header fl-wrap">
								<h3>내 찜 장소 </h3>
							</div>
							
							<c:if test="${favoritesList == null}">
								<div class="dashboard-message">
									<div class="favoritesNull">
										찜한 장소가 없습니다
									</div>
								</div>
							</c:if>
							<c:if test="${favoritesList != null}">
							
							<c:forEach var="favorites" items="${favoritesList}">
							<!-- dashboard-list  -->
							<div class="dashboard-list">
								<div class="dashboard-message">
									<a href="/mypage/favoritesDelete/${favorites.locationId}" class="del-btn" ><span>Delete<i class="fal fa-trash-alt"></i></span></a>
									
									<!-- 장소사진 -->
									<div class="dashboard-listing-table-image">
									
									<c:if test="${favorites.locationImagePath == null || favorites.locationImagePath == '사진없음'}">
										<a href="/locateion/locationDetail?locationId=${favorites.locationId}"><img src="/images/gal/no_image2.jpg" alt="왜안나와"></a>
									</c:if>
									<c:if test="${favorites.locationImagePath != null && favorites.locationImagePath != '사진없음'}">
										<a href="/locateion/locationDetail?locationId=${favorites.locationId}"><img src="/${favorites.locationImagePath}/${favorites.locationName}.jpg" alt="왜안나와"></a>
									</c:if>
									
									<!-- 별점 -->
									<div class="locationRating"><i class="fa-solid fa-star"></i> <span> ${favorites.locationRating} </span></div>
									</div>
									<div class="dashboard-listing-table-text">
										
										<!-- 장소이름 -->
										<h4>
											<a href="/location/locationDetail?locationId=${favorites.locationId}"> ${favorites.locationName} </a>
										</h4>
										
										<div class="locationInfo">
										<!-- 영업시간 -->
										<span class="dashboard-listing-table-address">
										<i class="fa-regular fa-calendar"></i>
										
										<c:if test="${favorites.locationOpenTime != null}">
											<span>${favorites.locationOpenTime} ~ ${favorites.locationCloseTime}</span>
										</c:if>
										<c:if test="${favorites.locationOpenTime == null}">
											<span>영업시간 정보없음</span>
										</c:if>
										</span>
										
										<!-- 리뷰개수 -->
										<span class="dashboard-listing-table-address"><i class="fa-solid fa-pen"></i>
										리뷰 ${favorites.locationReviewCount} 개
										</span>
										</div>
										
										
										<ul class="dashboard-listing-table-opt  fl-wrap">
											<li><span  class="dashboard-listing-table-address"><i class="fa-solid fa-table-list"></i>${favorites.smallCategory}</span></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- dashboard-list end-->
							</c:forEach>
							</c:if>
						</div>
						<!-- pagination-->
						<!-- <div class="pagination">
							<a href="#" class="prevposts-link"><i
								class="fa fa-caret-left"></i></a> <a href="#">1</a> <a href="#"
								class="current-page">2</a> <a href="#">3</a> <a href="#">4</a> <a
								href="#" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
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
<!-- <script type="text/javascript" src="/js/mypage/mypagePhoneNumber.js"></script> -->
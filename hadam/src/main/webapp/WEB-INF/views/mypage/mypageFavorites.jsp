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
								<h3>Your Listings</h3>
							</div>
							
<%-- 							<c:forEach var="vo" items="${list}"> --%>
							<!-- dashboard-list  -->
							<div class="dashboard-list">
								<div class="dashboard-message">
									<a href="#" class="del-btn" ><span>Delete<i class="fal fa-trash-alt"></i></span></a>
									<div class="dashboard-listing-table-image">
										<a href="listing-single.html"><img src="images/gal/1.jpg" alt=""></a>
									</div>
									<div class="dashboard-listing-table-text">
										<h4>
											<a href="listing-single.html">Premium Plaza Hotel</a>
										</h4>
										<span class="dashboard-listing-table-address">
										<i class="far fa-map-marker"></i>
										<a href="#">USA 27TH Brooklyn NY</a>
										</span>
										<ul class="dashboard-listing-table-opt  fl-wrap">
											<li><a href="#">Edit <i class="fal fa-edit"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- dashboard-list end-->
<%-- 							</c:forEach> --%>
							<div class="dashboard-list">
								<div class="dashboard-message">
									<span class="new-dashboard-item">New</span>
									<div class="dashboard-listing-table-image">
										<a href="listing-single.html"><img src="images/gal/1.jpg"
											alt=""></a>
									</div>
									<div class="dashboard-listing-table-text">
										<h4>
											<a href="listing-single.html">Premium Plaza Hotel</a>
										</h4>
										<span class="dashboard-listing-table-address"><i
											class="far fa-map-marker"></i><a href="#">USA 27TH
												Brooklyn NY</a></span>
										<ul class="dashboard-listing-table-opt  fl-wrap">
											<li><a href="#">Edit <i class="fal fa-edit"></i></a></li>
											<li><a href="#" class="del-btn">Delete <i
													class="fal fa-trash-alt"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- pagination-->
						<div class="pagination">
							<a href="#" class="prevposts-link"><i
								class="fa fa-caret-left"></i></a> <a href="#">1</a> <a href="#"
								class="current-page">2</a> <a href="#">3</a> <a href="#">4</a> <a
								href="#" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
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
<!-- <script type="text/javascript" src="/js/mypage/mypagePhoneNumber.js"></script> -->
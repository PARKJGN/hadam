<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link type="text/css" rel="stylesheet" href="/css/schedule/schedule.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- header-->
<jsp:include page="../../layout/scheduleheader.jsp"></jsp:include>
<!--  header end -->

<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<!-- Map -->

		<div class="map-container  fw-map big_map hid-mob-map">
			<div id="map-main"></div>
			<div class="map-close">
				<i class="fas fa-times"></i>
			</div>
		</div>
		<!-- Map end -->
		
		<!--section -->
		<section class="grey-blue-bg small-padding">
			<div class="container">
				<div class="row">
					<!--listing -->
					<div class="col-md-12">
						<!--list-wrap-search   -->
						<div
			class="listing-item-container init-grid-items three-columns-grid"
			id="listBox">
			<div class="listing-item" id="listItem">
				<article class="geodir-category-listing fl-wrap">
					<div class="geodir-category-img">
						<a href="listing-single.html"><img src="../images/gal/1.jpg"
							alt=""></a>


						<div class="geodir-category-opt"></div>
					</div>
					<div class="geodir-category-content fl-wrap title-sin_item">
						<div class="geodir-category-content-title fl-wrap">
							<div class="geodir-category-content-title-item">
								<h3 class="title-sin_map">12:00 ~ 13:00</h3>
								<div class="geodir-category-location fl-wrap">
									<a href="#" class="map-item"><i
										class="fas fa-map-marker-alt"></i>장소명</a>
								</div>
							</div>
						</div>

					</div>
				</article>
			</div>

			<div class="arrowBox">
				<div class="arrow"></div>
			</div>
			<div class="timeTaken">
				<span>대중교통</span>
				<p>몇분</p>
				<span>자차</span>
				<p>몇분</p>
			</div>
			<!-- listing-item end -->
			<!-- listing-item  -->
			<div class="listing-item" id="listItem">
				<article class="geodir-category-listing fl-wrap">
					<div class="geodir-category-img">
						<a href="listing-single.html"><img src="../images/gal/1.jpg"
							alt=""></a>


						<div class="geodir-category-opt"></div>
					</div>
					<div class="geodir-category-content fl-wrap title-sin_item">
						<div class="geodir-category-content-title fl-wrap">
							<div class="geodir-category-content-title-item">
								<h3 class="title-sin_map">12:00 ~ 13:00</h3>
								<div class="geodir-category-location fl-wrap">
									<a href="#" class="map-item"><i
										class="fas fa-map-marker-alt"></i>장소명</a>
								</div>
							</div>
						</div>


					</div>
				</article>
			</div>

			<div class="arrowBox">
				<div class="arrow"></div>
			</div>
			<div class="timeTaken">
				<p>소요시간</p>
				<p class="whatTime">몇분</p>
			</div>
			<!-- listing-item end -->
			<!-- listing-item  -->
			<div class="listing-item" id="listItem">
				<article class="geodir-category-listing fl-wrap">
					<div class="geodir-category-img">
						<a href="listing-single.html"><img src="../images/gal/1.jpg"
							alt=""></a>


						<div class="geodir-category-opt"></div>
					</div>
					<div class="geodir-category-content fl-wrap title-sin_item">
						<div class="geodir-category-content-title fl-wrap">
							<div class="geodir-category-content-title-item">
								<h3 class="title-sin_map">12:00 ~ 13:00</h3>
								<div class="geodir-category-location fl-wrap">
									<a href="#" class="map-item"><i
										class="fas fa-map-marker-alt"></i>장소명</a>
								</div>
							</div>
						</div>


					</div>
				</article>
			</div>

		</div>
						<!--list-wrap-search end -->
						<!--col-list-wrap -->
						<!-- list-main-wrap-->

						<!-- listing-item-container -->

						<!-- listing-item-container end-->
						<div class="schedulecontent">
							<div class="table-responsive">
								<table class="table table-bordered text-center">
									<thead>
										<tr class="bg-light-gray">
										</tr>
									</thead>
									<tbody>
										<tr class="scheduleTable">

										</tr>
									</tbody>
								</table>
							</div>
							<div class="list-wrap-search lisfw fl-wrap lws_mobile">
								<div class="container ">
									<div class="scheduleinven">
										<img src="/images/schedule/bg/red.jpg" alt=""> <img
											src="/images/schedule/bg/red.jpg" alt="">
									</div>
								</div>
							</div>
						</div>
						<!-- list-main-wrap end-->
						<!--col-list-wrap end -->
					</div>
					<!--listing  end-->
				</div>
				<!--row end-->
			</div>
		</section>
	</div>
	<!-- content end-->
</div>
<!-- modal start -->


<!--wrapper end -->
<!--footer -->
<jsp:include page="../../layout/footer.jsp"></jsp:include>

<div class="modal fade" data-bs-backdrop="static" id="schedulemodal"
	tabindex="-1" aria-labelledby="schedulemodalLabel" aria-hidden="true"
	data-bs-keyboard="false">
	<div class="modal-dialog modal-xl">
		<div class="modal-content scheduleaddform">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="schedulemodalLabel">장소검색</h1>
				<select class="addr">
					<option>강남구</option>
					<option>강동구</option>
					<option>강북구</option>
					<option>강서구</option>
					<option>관악구</option>
					<option>광진구</option>
					<option>구로구</option>
					<option>금천구</option>
					<option>노원구</option>
					<option>도봉구</option>
					<option>동대문구</option>
					<option>동작구</option>
					<option>마포구</option>
					<option>서대문구</option>
					<option>서초구</option>
					<option>성동구</option>
					<option>성북구</option>
					<option>송파구</option>
					<option>양천구</option>
					<option>영등포구</option>
					<option>용산구</option>
					<option>은평구</option>
					<option>종로구</option>
					<option>중구</option>
					<option>중랑구</option>
				</select> <select class=cate></select> <select class=middlecate></select> <input
					class="searchinput" type='text' placeholder="장소명" />
				<button class="searchbtn basic" type="button" id=1>
					<i class="fas fa-search fa-lg" style="color: #0d6efd;"></i>
				</button>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>

			</div>
			<div class="modal-body">
				<div style="width: 100%; height: 90%;" class="locationlist">
					<span class="baisc">검색을 시작하세요</span>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</div>

<!--footer end -->
<script type="text/javascript" src="/js/schedule/schedulemodal.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript" src="/js/schedule/Tmap.js"></script>
<script type="text/javascript" src="/js/schedule/schedule-timeline.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja"></script>
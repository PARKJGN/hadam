<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link type="text/css" rel="stylesheet" href="/css/schedule/schedule.css">
<link type="text/css" rel="stylesheet" href="/css/schedule/scheduledate.css">
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
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
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
					<div>
					<input type="text" class="scheduletitle" placeholder="스케줄표 제목을 지어주세요"/>
					<input type="text" style = "width:300px;" placeholder="일정 시작날짜를 선택해주세요"  id="datepicker" class="hasDatepicker" readonly/>
					</div>
					
						<!--list-wrap-search   -->
						<div
			class="listing-item-container init-grid-items three-columns-grid"
			id="listBox">

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
								<div >
									<div class="scheduleinven">
									</div>
								</div>
							</div>
							<div class = "scheduleBtn">
								<button type="button" class= "btn-two blue btn-two-submit" id="scheduleTableInsert" value="스케줄생성하기">스케줄생성하기</button>
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
<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>

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
<!-- ai추천시 model에서 담아온 장소 리스트 -->
<script type="text/javascript">
	let strLocationList = '${locationList}'
	let strAiInformation = '${aiInformation}'
	
</script>

<script type="text/javascript" src="/js/schedule/schedulesubmit.js"></script>
<script type="text/javascript" src="/js/schedule/schedulemodal.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript" src="/js/schedule/Tmap.js"></script>
<script type="text/javascript" src="/js/schedule/schedule-timeline.js"></script>
<script type="text/javascript" src="/js/schedule/aitimeline.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja"></script>
	<script
  src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"
  integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c="
  crossorigin="anonymous"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageEntry
	페이지명	동행신청 받는 페이지
	작성자 	최성익  
-->

<link type="text/css" rel="stylesheet"
	href="/css/mypage/mypageSchedule.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->


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
								<h3>내 스케줄</h3>
							</div>

							
							<c:forEach var="scheduleId" items="${keyList}">
							<!-- dashboard-list end-->
							<div class="dashboard-list">
							<div class="scheduleName"><span><%-- ${scheduleTableMap[scheduleId].scheduleTableName} --%></span></div>
								<div class="dashboard-message">
							 <c:forEach var="schedule" items="${scheduleTableMap[scheduleId]}" varStatus="idx">
									<div class="schedule-wrap">
									<article class="schedule-wrap-article">
										<img class="schedule-img" src="/images/location/${schedule.locationName}.jpg" 
										onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';">
										<div class="scheduleContext-wrap">
											<a href="#" class="schedule-locationName">${schedule.locationName}</a>
											<div>
												<span class="schedule-locationTime">${schedule.scheduleStartTime} ~ ${schedule.scheduleEndTime}</span>
											</div>
										</div>
									</article>
									</div>

								<c:if test="${!idx.last}">
								
									<div class="arrow"></div>
								</c:if>
							</c:forEach> 
								</div>
								
							</div>
							</c:forEach>











							<!-- <div class="dashboard-message">
									<div >
										<div class="schedule-wrap">
											<img class="schedule-img" src="/images/gal/no_image2.jpg">
											<div class="scheduleContext-wrap">
											<a href="#" class="schedule-locationName">종건이네 국밥집</a>
											<div><span class="schedule-locationTime" >00:00 ~ 00:00</span></div>
											
											</div>
										</div>

									</div>


								</div> -->

							<!-- dashboard-list end-->

						

							<!-- dashboard-list end-->
							<!-- <div class="dashboard-list">
                                            <div class="dashboard-message">
                                                <span class="new-dashboard-item">New</span>
                                                <div class="dashboard-message-avatar">
                                                    <img src="/images/avatar/1.jpg" alt="">
                                                </div>
                                                <div class="dashboard-message-text">
                                                    <h4>Andy Smith - <span>27 December 2018</span></h4>
                                                    <div class="booking-details fl-wrap">
                                                        <span class="booking-title">Listing Item :</span> :
                                                        <span class="booking-text"><a href="listing-sinle.html">Premium Plaza Hotel</a></span>
                                                    </div>
                                                    <div class="booking-details fl-wrap">
                                                        <span class="booking-title">Persons :</span>   
                                                        <span class="booking-text">4 Peoples</span>
                                                    </div>
                                                    <div class="booking-details fl-wrap">
                                                        <span class="booking-title">Booking Date :</span>   
                                                        <span class="booking-text">02.03.2018  - 10.03.2018</span>
                                                    </div>
                                                    <div class="booking-details fl-wrap">                                                               
                                                        <span class="booking-title">Mail :</span>  
                                                        <span class="booking-text"><a href="#" target="_top">yormail@domain.com</a></span>
                                                    </div>
                                                    <div class="booking-details fl-wrap">
                                                        <span class="booking-title">Phone :</span>   
                                                        <span class="booking-text"><a href="tel:+496170961709" target="_top">+496170961709</a></span>
                                                    </div>
                                                    <div class="booking-details fl-wrap">
                                                        <span class="booking-title">Payment State :</span> 
                                                        <span class="booking-text"> <strong class="done-paid">Paid  </strong>  using Paypal</span>
                                                    </div>
                                                    <span class="fw-separator"></span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. </p>
                                                </div>
                                            </div>
                                        </div> -->
							<!-- dashboard-list end-->



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
<!-- <script type="text/javascript" src="/js/mypage/mypagePassword.js"></script> -->

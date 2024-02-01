<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	findInfo.jsp 
	페이지명	아이디 비밀번호 찾기 페이지 
	용도		화면구성	
	작성자 	최성익  
-->

<!--=============== 개인 css  ===============-->
<link type="text/css" rel="stylesheet" href="/css/sign/findInfo.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">





<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<div class="breadcrumbs-fs fl-wrap">
			<div class="container">
				<!-- 	<div class="breadcrumbs fl-wrap">
					<a href="#">Home</a><a href="#">Pages</a><span>Booking Page</span>
				</div> -->
			</div>
		</div>
		<section class="middle-padding gre y-blue-bg">
			<div class="container">
				
				<div class="row">
					<div class="col-md-8">

						<div class="fl-wrap" id="phoneField" >
							<!-- dashboard-content-->
							<div class="dashboard-content fl-wrap">
								<div class="box-widget-item-header">
									<h3>전화번호로 아이디 찾기</h3>
								</div>
								
									<div class="custom-form no-icons">
										<div class="pass-input-wrap fl-wrap">
											<label>전화번호 </label> <input type="number" id="member_phone"
												class="mypage phoneinput" placeholder=""
												name="phoneNumber" /> <input type="button"
												id="member_phone_check" class="mypage phonecheck"
												value="인증하기"> 
										</div>
									</div>

									<div class="custom-form no-icons">
										<div class="pass-input-wrap fl-wrap">
											<label>인증번호 <span id="check_phone_count"></span></label> <input
												type="text" id="member_phone_checknum"
												class="mypage phonecheckinput" placeholder="" /> <input
												type="button" id="btn_member_phone_checknum"
												class="mypage phonechecknum" value="확인">
										</div>
										<label> <span id="check_phone_count"></span></label>
										<label> <span id="check_phone_count"></span></label>
										<label>인증번호 확인 후 아이디 확인<span id="check_phone_count"></span></label>
										<input type="text" id="memberId" readonly>
										<button
											class="btn  big-btn  color2-bg flat-btn float-btn disa"
											id="btn_phonenumber_change_completion">
											비밀번호 찾기<i class="fal fa-save"></i>
										</button>
									</div>
							
							</div>
							<!-- dashboard-list-box end-->
						</div>
						<!-- dasboard-wrap end-->


						<div class="fl-wrap" id="passwordField" hidden>
							<!-- dashboard-content-->
							<div class="dashboard-content fl-wrap">
								<div class="box-widget-item-header">
									<h3>비밀번호 변경</h3>
								</div>
								<form action="/mypage/passwordChange" method="post">
									<div class="custom-form no-icons">
										<input type="hidden" name="memberId" id="form_memberId">
										<div class="pass-input-wrap fl-wrap">
											<label>새 비밀번호 <span class="password_comment"></span></label>
											<input type="password" class="pass-input"
												id="memberNewPassword" placeholder="" value=""
												name="newPassword" /> <span class="eye"><i
												class="far fa-eye" aria-hidden="true"></i> </span>
										</div>
										<div class="pass-input-wrap fl-wrap">
											<label>새 비밀번호 확인 <span class="passwordCheck_comment"></span></label>
											<input type="password" class="pass-input"
												id="memberNewPasswordCheck" placeholder="" value="" /> <span
												class="eye"><i class="far fa-eye" aria-hidden="true"></i>
											</span>
										</div>
										<button class="btn  big-btn  color2-bg flat-btn float-btn">
											변경하기 <i class="fal fa-save"></i>
										</button>
									</div>
								</form>
							</div>
							<!-- dashboard-list-box end-->
						</div>




					</div>
				</div>
			</div>
		</section>
		<!-- section end -->
	</div>
	<!-- content end-->
</div>
<!--wrapper end -->

<!--footer -->
<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
<!--footer end -->


<!--=============== 개인 js  ===============-->
<!-- <script type="text/javascript" src="/js/sign/signup.js"></script> -->
<script type="text/javascript" src="/js/sign/findInfo.js"></script>

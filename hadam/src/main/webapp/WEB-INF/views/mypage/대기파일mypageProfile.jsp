<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageProfile
	페이지명	비밀번호 변경 페이지
	작성자 	최성익  
-->

<!-- 개인 css -->
<link type="text/css" rel="stylesheet" href="/css/mypage/mypageProfile.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<jsp:include page="/WEB-INF/views/mypage/mypageHeader.jsp"></jsp:include>
		<!-- section-->
		<section class="middle-padding">
			<div class="container">
				<!--dasboard-wrap-->
				<div class="dasboard-wrap fl-wrap">
					<!-- dashboard-content-->
					<div class="dashboard-content fl-wrap">
						<div class="box-widget-item-header">
							<h3>프로필 수정</h3>
						</div>
						<!-- profile-edit-container-->
						<div class="profile-edit-container">
							<div class="custom-form">
								<label>닉네임<i class="far fa-user"></i>&emsp;<span class="nickname_comment"></span></label> 
								<input type="text" placeholder="${memberVO.memberNickname}" class="mypage nicknameinput" id="member_nickname"/> 
								<input type="button" value="중복확인" class="mypage nicknamecheck" id="member_nickname_check">
								<label>전화번호<i class="far fa-phone"></i></label> 
								<input type="text" placeholder="${memberVO.memberPhoneNumber}" class="mypage phoneinput"/>
								<input type="button" value="인증번호" class="mypage phonecheck">
								<div class="row">
									<!-- <div class="col-sm-9">
										<label> Notes</label>
										<textarea cols="40" rows="3" placeholder="About Me"></textarea>
									</div> -->
									<div class="col-sm-3">
										<label>프로필 사진</label>
										<div class="add-list-media-wrap">
											<form class="fuzone">
												<div class="fu-text">
													<span><i class="far fa-cloud-upload-alt"></i> Click
														here or drop files to upload</span>
													<div class="photoUpload-files fl-wrap"></div>
												</div>
												<input type="file" class="upload">
											</form>
										</div>
									</div>
								</div>
								<button class="btn color2-bg  float-btn">
									Save Changes<i class="fal fa-save"></i>
								</button>
							</div>
						</div>
						<!-- profile-edit-container end-->
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

<script type="text/javascript" src="/js/mypage/mypageProfile.js"></script>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- css -->
<link type="text/css" rel="stylesheet"
	href="/css/mypage/mypageHeader.css">
<!-- js -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/mypage/mypageHeader.js"></script>

<!-- section-->
<section class="flat-header color-bg adm-header mypage">
	<div class="wave-bg wave-bg2"></div>
	<div class="container">
		<div class="dasboard-wrap fl-wrap">
			<!--dasboard-sidebar-->
			<div class="dasboard-sidebar">
				<div class="dasboard-sidebar-content fl-wrap mypage">
					<div class="dasboard-avatar">
						<img id="profileImage" class="saveProfile"
							src="/images/profile/${sessionScope.memberUploadImageName}.jpg"
							onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';">

						<!-- 프로필사진 업로드 -->
						<div class="modifyProfile">
							<form id="profileImageUpload" class="fuzone"
								action="/mypage/mypageProfileModify" method="post"
								enctype="multipart/form-data">
								<div class="fu-text">
									<span><i class="far fa-cloud-upload-alt"></i>프로필 사진 변경</span>
									<div class="photoUpload-files fl-wrap"></div>
								</div>
								<input type="text" id="memberNickname_hidden"
									name="memberNickname" hidden> <input type="file"
									name="file" class="upload" accept="image/*">
							</form>
						</div>
					</div>
					<div class="dasboard-sidebar-item fl-wrap">

						<div class="saveProfile">
							<h3>
								<span>Welcome </span> ${sessionScope.memberNickname}
							</h3>
						</div>

						<div class="modifyProfile">
							<h3>
								<span class="nickname_comment"></span> <input type="text"
									id="member_nickname">
							</h3>
						</div>

					</div>
					<button id="profileModify" class="ed-btn">수정</button>
					<button id="profileModifyCancel" class="ed-btn modifyProfile">취소</button>
					<div class="user-stats fl-wrap">
						<ul>
							<li>내 스케줄 <span id="scheduleNum"></span>
							</li>
							<li>공유 스케줄 <span id="scheduleShareNum"></span>
							</li>
							<li>내 게시글 <span id="boardNum"></span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--dasboard-sidebar end-->
			<!-- dasboard-menu-->
			<div class="dasboard-menu">
				<div class="dasboard-menu-btn color3-bg">
					Dashboard Menu <i class="fal fa-bars"></i>
				</div>
				<ul class="dasboard-menu-wrap">
					<li><a href="/mypage/mypagePreference"><i
							class="far fa-user"></i>개인정보수정</a>
						<ul>
							<li><a href="/mypage/mypagePreference">취향정보변경</a></li>
							<li><a href="/mypage/mypagePassword">비밀번호변경</a></li>
							<li><a href="/mypage/mypagePhoneNumber">전화번호변경</a></li>
						</ul></li>

					<li><a href="/mypage/mypageFavorites"><i
							class="fa-regular fa-heart"></i>찜꽁빵꽁</a></li>
					<li><a href="/mypage/mypageEntryResponse"><i
							class="far fa-envelope"></i> 동행신청</a>
						<ul>
							<li><a href="/mypage/mypageEntryResponse">받은동행신청</a></li>
							<li><a href="/mypage/mypageEntryRequest">보낸동행신청</a></li>
						</ul></li>
					<li><a href="/mypage/mypageSchedule"> <i
							class="far fa-calendar-check"></i> 내 스케줄
					</a></li>
					<li><a href="/mypage/mypageBoard"><i
							class="far fa-comments"></i> 내 게시물 </a></li>
				</ul>
			</div>
			<!--dasboard-menu end-->

			<!-- <div   class="tfp-btn"><span>Tariff Plan : </span> <strong>Extended</strong></div>
                                <div class="tfp-det">
                                    <p>You Are on <a href="#">Extended</a> . Use link bellow to view details or upgrade. </p>
                                    <a href="#" class="tfp-det-btn color2-bg">Details</a>
                                </div> -->

		</div>
	</div>
</section>
<!-- section end-->


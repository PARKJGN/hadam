<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer class="main-footer">
	<!--footer-inner-->
	<div class="footer-inner">
		<div class="container">
			<!--footer-fw-widget-->
			<div class="footer-fw-widget fl-wrap"></div>
			<!--footer-fw-widget end-->
			<div class="row">
				<!--footer-widget -->
				<div class="col-md-4">
					<div class="footer-widget fl-wrap">
						<h3>About Us</h3>
						<div class="footer-contacts-widget fl-wrap">
							<p>자카드 유사도 알고리즘을 이용하여 사용자의 취향데이터를 분석하고 크롤링한 데이터를 사용성에 맞게 정제하여 일일 스케줄을 추천하는 사용자 맞춤형 서비스를 제공하고 있습니다.</p>
							<ul class="footer-contacts fl-wrap">
								<li><span><i class="fal fa-envelope"></i> Mail :</span><a
									href="#" target="_blank">goldjung9@google.com</a></li>
								<li><span><i class="fal fa-map-marker-alt"></i>
										Adress :</span><a href="#" target="_blank">서울 마포구 백범로 23 3층</a></li>
								<li><span><i class="fal fa-phone"></i> Phone :</span><a
									href="#">+82 02-739-7235</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--footer-widget end-->
				<!--footer-widget -->
				<div class="col-md-4">
					<div class="footer-widget fl-wrap">
						<h3>Our Last News</h3>
						<div class="widget-posts fl-wrap">
							<ul>
								<li class="clearfix"><a href="https://ictedu.co.kr/index.php?main_page=home" class="widget-posts-img"><img
										src="/images/all/news1.jpg" class="respimg" alt="" style="width:100px; height:100px;"></a>
									<div class="widget-posts-descr">
										<a href="#" title="">Ict 최종프로젝트 발표</a> <span
											class="widget-posts-date"> 02 Feb 09:30 </span>
									</div></li>
								
								<li class="clearfix">
									<a href="https://ictedu.co.kr/index.php?main_page=home" class="widget-posts-img">
										<img src="/images/all/news2.png" class="respimg" alt="">
									</a>
									<div class="widget-posts-descr">
										<a href="#" title=""> Ict 수료</a>
										<span class="widget-posts-date"> 08 Feb 09:30 </span>
									</div>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				<!--footer-widget end-->
				<!-- footer-widget  -->
				<div class="col-md-4">
					<div class="footer-widget fl-wrap ">
						<h3>Helpful links</h3>
						<ul class="footer-list fl-wrap">
							<li><a href="about.html">About Our Company</a></li>
							<li><a href="blog.html">Our last News</a></li>
						</ul>
						<a class="contact-btn color-bg" href="메일보내는경로">Get In
							Touch<i class="fal fa-envelope" aria-hidden="true"></i>
						</a>
					</div>
				</div>
				<!-- footer-widget end-->
			</div>
			<div class="clearfix"></div>
			<!--footer-widget -->
			<div class="footer-widget">
				<div class="row">
					<div class="col-md-4"></div>
				</div>
			</div>
			<!--footer-widget end -->
		</div>
	</div>
	<!--footer-inner end -->
	<div class="footer-bg"></div>
	<!--sub-footer-->
	<div class="sub-footer">
		<div class="container">
			<div class="copyright">&#169; HadamProject 2024 . All rights
				reserved.</div>
			<div class="subfooter-lang">
				<div class="subfooter-show-lang">
					<span>Kr</span><i class="fa fa-caret-up"></i>
				</div>
				<ul class="subfooter-lang-tooltip">
					<li><a href="#">Java</a></li>
					<li><a href="#">Python</a></li>
					<li><a href="#">C++</a></li>
					<li><a href="#">MySQL</a></li>
				</ul>
			</div>
			<div class="subfooter-nav">
				<ul>
					<li><a href="#">Terms of use</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Blog</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--sub-footer end -->
</footer>
<!--map-modal -->
<div class="map-modal-wrap">
	<div class="map-modal-wrap-overlay"></div>
	<div class="map-modal-item">
		<div class="map-modal-container fl-wrap">
			<div class="map-modal fl-wrap">
				<div id="singleMap" data-latitude="40.7" data-longitude="-73.1"></div>
			</div>
			<h3>
				<i class="fal fa-location-arrow"></i><a href="#">Hotel Title</a>
			</h3>
			<input id="pac-input" class="controls fl-wrap controls-mapwn"
				type="text" placeholder="What Nearby ?   Bar , Gym , Restaurant ">
			<div class="map-modal-close">
				<i class="fal fa-times"></i>
			</div>
		</div>
	</div>
</div>
<!--map-modal end -->
<!--register form -->
<div class="main-register-wrap modal">
	<div class="reg-overlay"></div>
	<div class="main-register-holder">
		<div class="main-register fl-wrap">
			<div class="close-reg color-bg">
				<i class="fal fa-times"></i>
			</div>
			<ul class="tabs-menu">
				<li class="current"><a href="#tab-1"><i
						class="fal fa-sign-in-alt"></i> 로그인</a></li>
				<li><a href="#tab-2"><i class="fal fa-user-plus"></i> 회원가입</a></li>
			</ul>
			<!--tabs -->
			<div id="tabs-container">
				<div class="tab">
					<!--tab -->
					<div id="tab-1" class="tab-content">
						<h3>
							Sign In <span>HADAM <strong>:)</strong></span>
						</h3>
						<div class="custom-form">

							<label>아이디 <span>*</span> <span class="login_comment"></span>
							</label> <input name="memberId" type="text" id="memberId"> <label>비밀번호
								<span>*</span>
							</label> <input name="password" type="password" id="memberPassword">

							<button class="log-submit-btn color-bg" id="loginbtn">
								<span>로그인</span>
							</button>
							<div class="clearfix"></div>
							<!-- <div class="filter-tags">
                                            <input id="check-a" type="checkbox" name="check">
                                            <label for="check-a">Remember me</label>
                                        </div> -->

							<div class="lost_password">
								<a href="/signup/findInfo">아이디&nbsp;|&nbsp;비밀번호 찾기</a>
							</div>


						</div>
					</div>
					<!--tab end -->
					<!--tab -->
					<div class="tab">
						<div id="tab-2" class="tab-content">
							<h3>
								Sign Up <span>HADAM <strong>:)</strong></span>
							</h3>
							<div class="custom-form">
								<a href="/signup/signup"><input type="button"
									class='hadamsignbtn' value="hadam 회원가입"></a>
							</div>
						</div>
					</div>
					<!--tab end -->
				</div>
				<!--tabs end -->
				<div class="log-separator fl-wrap">
					<!-- <span>or</span> -->
				</div>

				<a id="naverIdLogin_loginButton" href="javascript:void(0)"><button
						class='loginbtn'>
						<img src="/images/sign/naverloginbtn.png" class='naverloginbtn'>
					</button></a> <a id="kakaoLoginBtn"
					href="https://kauth.kakao.com/oauth/authorize?
					response_type=code&
					client_id=1bce4a6cad3104a2d5cc6134e1af3958&
					redirect_uri=http://localhost:8080/signup/kakaoCallback"><button
						class='loginbtn'>
						<img src="/images/sign/kakaologinbtn.png" class='kakaologinbtn'>
					</button></a>

				<div class="log-separator fl-wrap">
					<div class="soc-log fl-wrap"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--register form end -->
<a class="to-top"><i class="fas fa-caret-up"></i></a>

<!-- Main end -->
<!--=============== scripts  ===============-->
<!-- STOMP 소캣 생성을 위한 import -정건일-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- end STOMP 소캣 생성을 위한 import -정건일-->

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/plugins.js"></script>
<script type="text/javascript" src="/js/scripts.js"></script>
<script type="text/javascript" src="/js/sign/signin.js"></script>
<!-- 클릭이벤트 js -정건일 -->
<script src="/js/layout/click_evt.js"></script>
<script src="/js/layout/header.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<!-- <script type="text/javascript" src="/js/layout/logout.js"></script> -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOURAPIKEYHERE&libraries=places&callback=initAutocomplete"></script>  
        <script type="text/javascript" src="/js/map-single.js"></script> -->
</body>
</html>

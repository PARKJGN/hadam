<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypagePassword
	페이지명	비밀번호 변경 페이지
	작성자 	최성익  
-->

<link type="text/css" rel="stylesheet"
	href="/css/mypage/mypagePreference.css">

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

<%-- <c:if test="${msg != null}">
    <div id="msg" hidden><%= request.getAttribute("msg") %></div>
</c:if> --%>

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
						<div class="box-widget-item-header">
							<h3>당신의 취향을 선택해주세요</h3>
						</div>

						<div class="row">
							<div class="col-sm-6 hadam_category eating">
								<label class='midlelabel'>먹기</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="middle" id="한식" /><label
										for="한식">한식</label></li>
									<li><input type="checkbox" class="middle" id="중식" /><label
										for="중식">중식</label></li>
									<li><input type="checkbox" class="middle" id="양식" /><label
										for="양식">양식</label></li>
									<li><input type="checkbox" class="middle" id="일식" /><label
										for="일식">일식</label></li>
									<li><input type="checkbox" class="middle" id="패스트푸드" /><label
										for="패스트푸드">패스트푸드</label></li>
									<li><input type="checkbox" class="middle" id="세계음식" /><label
										for="세계음식">세계음식</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 한식">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한식</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="족발,보쌈"><label
										for="족발,보쌈">족발,보쌈</label></li>
									<li><input type="checkbox" class="small" id="칼국수,만두"><label
										for="칼국수,만두">칼국수,만두</label></li>
									<li><input type="checkbox" class="small" id="국밥"><label
										for="국밥">국밥</label></li>
									<li><input type="checkbox" class="small" id="육류,고기요리"><label
										for="육류,고기요리">육류,고기요리</label></li>
									<li><input type="checkbox" class="small" id="낙지요리"><label
										for="낙지요리">낙지요리</label></li>
									<li><input type="checkbox" class="small" id="닭요리"><label
										for="닭요리">닭요리</label></li>
									<li><input type="checkbox" class="small" id="국수" /><label
										for="국수">국수</label></li>
									<li><input type="checkbox" class="small" id="두부요리"><label
										for="두부요리">두부요리</label></li>
									<li><input type="checkbox" class="small" id="한정식"><label
										for="한정식">한정식</label></li>
									<li><input type="checkbox" class="small" id="곱창,막창,양"><label
										for="곱창,막창,양">곱창,막창,양</label></li>
									<li><input type="checkbox" class="small" id="복어요리"><label
										for="복어요리">복어요리</label></li>
									<li><input type="checkbox" class="small" id="생선회"><label
										for="생선회">생선회</label></li>
									<li><input type="checkbox" class="small" id="찌개,전골"><label
										for="찌개,전골">찌개,전골</label></li>
									<li><input type="checkbox" class="small" id="전,빈대떡"><label
										for="전,빈대떡">전,빈대떡</label></li>
									<li><input type="checkbox" class="small" id="해물,생선요리"><label
										for="해물,생선요리">해물,생선요리</label></li>
									<li><input type="checkbox" class="small" id="뷔페"><label
										for="뷔페">뷔페</label></li>
									<li><input type="checkbox" class="small" id="분식"><label
										for="분식">분식</label></li>
									<li><input type="checkbox" class="small" id="덮밥,컵밥"><label
										for="덮밥,컵밥">덮밥,컵밥</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 중식">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중식</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="중식당" /><label
										for="중식당">중식당</label></li>
									<li><input type="checkbox" class="small" id="양꼬치" /><label
										for="양꼬치">양꼬치</label></li>
									<li><input type="checkbox" class="small" id="마라탕" /><label
										for="마라탕">마라탕</label></li>
									<li><input type="checkbox" class="small" id="딤섬" /><label
										for="딤섬">딤섬</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 양식">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="스파게티,파스타전문" /><label
										for="스파게티,파스타전문">스파게티,파스타전문</label></li>
									<li><input type="checkbox" class="small" id="이탈리아음식" /><label
										for="이탈리아음식">이탈리아음식</label></li>
									<li><input type="checkbox" class="small" id="스테이크,립" /><label
										for="스테이크,립">스테이크,립</label></li>
									<li><input type="checkbox" class="small" id="프랑스음식" /><label
										for="프랑스음식">프랑스음식</label></li>
									<li><input type="checkbox" class="small" id="샌드위치" /><label
										for="샌드위치">샌드위치</label></li>
									<li><input type="checkbox" class="small" id="레스토랑" /><label
										for="레스토랑">"레스토랑"</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 일식">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일식</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="일식당" /><label
										for="일식당">일식당</label></li>
									<li><input type="checkbox" class="small" id="돈가스" /><label
										for="돈가스">돈가스</label></li>
									<li><input type="checkbox" class="small" id="이자카야" /><label
										for="이자카야">이자카야</label></li>
									<li><input type="checkbox" class="small" id="초밥,롤" /><label
										for="초밥,롤">초밥,롤</label></li>
									<li><input type="checkbox" class="small" id="우동,소바" /><label
										for="우동,소바">우동,소바</label></li>
									<li><input type="checkbox" class="small" id="일본식라면" /><label
										for="일본식라면">일본식라면</label></li>
									<li><input type="checkbox" class="small" id="카레" /><label
										for="카레">카레</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 패스트푸드">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;패스트푸드</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="햄버거" /><label
										for="햄버거">햄버거</label></li>
									<li><input type="checkbox" class="small" id="피자" /><label
										for="피자">피자</label></li>
									<li><input type="checkbox" class="small" id="치킨" /><label
										for="치킨">치킨</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category eating small 세계음식">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세계음식</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="베트남음식" /><label
										for="베트남음식">베트남음식</label></li>
									<li><input type="checkbox" class="small" id="아시아음식" /><label
										for="아시아음식">아시아음식</label></li>
									<li><input type="checkbox" class="small" id="태국음식" /><label
										for="태국음식">태국음식</label></li>
									<li><input type="checkbox" class="small" id="인도음식" /><label
										for="인도음식">인도음식</label></li>
									<li><input type="checkbox" class="small" id="멕시코,남미음식" /><label
										for="멕시코,남미음식">멕시코,남미음식</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category drinking">
								<label class='midlelabel'>마시기</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="middle" id="카페" /><label
										for="카페">카페</label></li>
									<li><input type="checkbox" class="middle" id="주류" /><label
										for="주류">주류</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category drinking small 카페">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카페</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="카페,디저트" /><label
										for="카페,디저트">카페,디저트</label></li>
									<li><input type="checkbox" class="small" id="베이커리" /><label
										for="베이커리">베이커리</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category drinking small 주류">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주류</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="포장마차,요리주점" /><label
										for="포장마차,요리주점">포장마차,요리주점</label></li>
									<li><input type="checkbox" class="small" id="맥주,호프" /><label
										for="맥주,호프">맥주,호프</label></li>
									<li><input type="checkbox" class="small" id="와인" /><label
										for="와인">와인</label></li>
									<li><input type="checkbox" class="small" id="칵테일" /><label
										for="칵테일">칵테일</label></li>
									<li><input type="checkbox" class="small" id="바(BAR)" /><label
										for="바(BAR)">바(BAR)</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category playing">
								<label class='midlelabel'>놀기</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="middle" id="이색" /><label
										for="이색">이색</label></li>
									<li><input type="checkbox" class="middle" id="실내활동" /><label
										for="실내활동">실내활동</label></li>
									<li><input type="checkbox" class="middle" id="실외활동" /><label
										for="실외활동">실외활동</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category playing small 이색">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이색</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="테마카페" /><label
										for="테마카페">테마카페</label></li>
									<li><input type="checkbox" class="small" id="방탈출,vr카페" /><label
										for="방탈출,vr카페">방탈출,vr카페</label></li>
									<li><input type="checkbox" class="small" id="사주카페" /><label
										for="사주카페">사주카페</label></li>
									<li><input type="checkbox" class="small" id="보드카페" /><label
										for="보드카페">보드카페</label></li>
									<li><input type="checkbox" class="small" id="플레이스스테이션방" /><label
										for="플레이스스테이션방">플레이스스테이션방</label></li>
									<li><input type="checkbox" class="small" id="플라워카페" /><label
										for="플라워카페">플라워카페</label></li>
									<li><input type="checkbox" class="small" id="공방" /><label
										for="공방">공방</label></li>
									<li><input type="checkbox" class="small" id="암벽등반" /><label
										for="암벽등반">암벽등반</label></li>
									<li><input type="checkbox" class="small" id="힐링카페" /><label
										for="힐링카페">힐링카페</label></li>
									<li><input type="checkbox" class="small" id="애견카페" /><label
										for="애견카페">애견카페</label></li>
									<li><input type="checkbox" class="small" id="키즈카페" /><label
										for="키즈카페">키즈카페</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category playing small 실내활동">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실내활동</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="스케이트장" /><label
										for="스케이트장">스케이트장</label></li>
									<li><input type="checkbox" class="small" id="노래방" /><label
										for="노래방">노래방</label></li>
									<li><input type="checkbox" class="small" id="당구장" /><label
										for="당구장">당구장</label></li>
									<li><input type="checkbox" class="small" id="볼링장" /><label
										for="볼링장">볼링장</label></li>
									<li><input type="checkbox" class="small" id="스크린야구장" /><label
										for="스크린야구장">스크린야구장</label></li>
									<li><input type="checkbox" class="small" id="수영장" /><label
										for="수영장">수영장</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category playing small 실외활동">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실외활동</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="수상,해양레저" /><label
										for="수상,해양레저">수상,해양레저</label></li>
									<li><input type="checkbox" class="small" id="스키장" /><label
										for="스키장">스키장</label></li>
									<li><input type="checkbox" class="small" id="낚시터" /><label
										for="낚시터">낚시터</label></li>
									<li><input type="checkbox" class="small" id="해수욕장,해변" /><label
										for="해수욕장,해변">해수욕장,해변</label></li>
									<li><input type="checkbox" class="small" id="테마파크" /><label
										for="테마파크">테마파크</label></li>
									<li><input type="checkbox" class="small" id="워터파크" /><label
										for="워터파크">워터파크</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category watching">
								<label class='midlelabel'>보기</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="middle" id="영화" /><label
										for="영화">영화</label></li>
									<li><input type="checkbox" class="middle" id="전시" /><label
										for="전시">전시</label></li>
									<li><input type="checkbox" class="middle" id="공연" /><label
										for="공연">공연</label></li>
									<li><input type="checkbox" class="middle" id="책방" /><label
										for="책방">책방</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category watching small 영화">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="영화관" /><label
										for="영화관">영화관</label></li>
									<li><input type="checkbox" class="small" id="DVD" /><label
										for="DVD">DVD</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category watching small 전시">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전시</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="전시회" /><label
										for="전시회">전시회</label></li>
									<li><input type="checkbox" class="small" id="박물관" /><label
										for="박물관">박물관</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category watching small 공연">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공연</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="뮤지컬,극장" /><label
										for="뮤지컬,극장">뮤지컬,극장</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category watching small 책방">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책방</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="서점" /><label
										for="서점">서점</label></li>
									<li><input type="checkbox" class="small" id="만화카페" /><label
										for="만화카페">만화카페</label></li>
									<li><input type="checkbox" class="small" id="북카페" /><label
										for="북카페">북카페</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category walking">
								<label class='midlelabel'>걷기</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="middle small" id="시장" /><label
										for="시장">시장</label></li>
									<li><input type="checkbox" class="middle small" id="공원" /><label
										for="공원">공원</label></li>
									<li><input type="checkbox" class="middle" id="산책" /><label
										for="산책">산책</label></li>
									<li><input type="checkbox" class="middle small" id="문화재" /><label
										for="문화재">문화재</label></li>
								</ul>
							</div>
							<div class="col-sm-6 hadam_category walking small 산책">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산책</label>
								<ul class="ks-cboxtags">
									<li><input type="checkbox" class="small" id="도보코스" /><label
										for="도보코스">도보코스</label></li>
									<li><input type="checkbox" class="small" id="산책로" /><label
										for="산책로">산책로</label></li>
								</ul>
							</div>
						</div>

						<div>
							<span class="fw-separator"></span> <a href="#"
								id="preferenceModefy"
								class="action-button btn color2-bg no-shdow-btn">눌러야 완료!<i
								class="fal fa-angle-right"></i></a>
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
<script type="text/javascript" src="/js/mypage/mypagePreference.js"></script>

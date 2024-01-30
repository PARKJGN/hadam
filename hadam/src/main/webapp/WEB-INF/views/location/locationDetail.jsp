<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<!-- header-->
           <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
           <link type="text/css" rel="stylesheet" href="/css/category/categories.css">
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                	<div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="/">메인 페이지</a><a href="/location/locationList">장소 페이지</a><span>장소 상세 페이지</span></div>
                        </div>
                    </div>
                    <!--  section  -->
                    <section class="grey-blue-bg small-padding scroll-nav-container">
                        <div class="top-dec"></div>
                        <!--  scroll-nav-wrapper  -->
                        <div class="scroll-nav-wrapper fl-wrap">
                            <div class="hidden-map-container fl-wrap">
                                <input id="pac-input" class="controls fl-wrap controls-mapwn" type="text" placeholder="What Nearby ?   Bar , Gym , Restaurant ">
                                <div class="map-container">
                                    <div id="singleMap" data-latitude="40.7427837" data-longitude="-73.11445617675781"></div>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="container">
                                <nav class="scroll-nav scroll-init">
                                    <ul>
                                        <li><a class="act-scrlink" href="#sec1">장소</a></li>
                                        <li><a href="#sec2">소개</a></li>
                                        <li><a href="#sec3">메뉴</a></li>
                                        <li><a href="#sec4">리뷰</a></li>
                                        <li><a href="#sec5">주소</a></li>
                                        <li><a href="#sec6">지도</a></li>
                                    </ul>
                                </nav>                         
                            </div>
                        </div>
                        <!--  scroll-nav-wrapper end  -->                    
                        <!--   container  -->
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="catelist-single-main-container ">
                                        <!-- 장소 이미지 -->                                          
                                        <div class="catelist-single-main-media fl-wrap" id="sec1">
	                                        <div class="slick-slide-item">
	                                        <!-- 이미지 경로 찾아서 출력, 이미지 없을 시 디폴트 이미지도 설정 -->
	                                        <img class="cateimg-good" style="text-align:center;" src="${pageContext.request.contextPath}/images/location/${locationDetail.locationImageOriginalname}"
	                                        onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></div>
                                        </div> 
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- 우측 툴탭 -->
                                    <div class="flat-hero-container fl-wrap" id="locationContainer">
                                        <div class="catebox-widget-item-header fl-wrap ">
                                            <h3>${locationDetail.locationName }</h3>
                                            <div class="listing-rating-wrap">
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="${locationDetail.locationRating }"></div>
                                            </div>
                                        </div>
                                        <div class="rate-class-name-wrap fl-wrap">
                                        	<div class="rate-class-name">
                                            	<span>${locationDetail.locationRating }</span> 
                                            	<div class="score"><strong>Very Good</strong></div>
                                        	</div>
                                        </div>
                                        <div class="catelist-single-hero-price fl-wrap">평균 시간<span> 1 시간 </span></div> 
                                        
                                        <!-- 찜하기 -->
                                        <c:if test="${not empty sessionScope.memberIndex}">
										    <!-- 로그인한 경우 -->
										    <!-- 찜이 아닌경우 -->
										    <c:if test="${locationDetail.locationId != favorites.locationId && sessionScope.memberIndex != favorites.memberIndex}" >
										        <a class="fc-add-button">
										            <i class="fa-regular fa-heart" id="heartIcon"></i>
										        </a>
										    </c:if>
										    <!-- 찜이 된경우 -->
										    <c:if test="${locationDetail.locationId == favorites.locationId && sessionScope.memberIndex == favorites.memberIndex}" >
										        <a class="fc-delete-button">
										            <i class="fa-solid fa-heart" id="heartIcon"></i>
										        </a>
										    </c:if>
										</c:if>
										<c:if test="${empty sessionScope.memberIndex}">
										    <!-- 로그인하지 않은 경우 -->
										    <a class="fc-button">
										        <i class="far fa-heart" id="heartIcon"></i>
										    </a>
										</c:if> 
                                        
                                        <input id="realLocationId" type="hidden" value="${locationDetail.locationId}"/>
                                        <input id="memberIndex" type="hidden" value="${sessionScope.memberIndex}"/>
                                        <!-- 찜하기 end -->
                                        <!-- reviews-score-wrap end -->   
                                    </div>
                                    <!--   flat-hero-container end -->
                                </div>
                            </div>
                            <!--   row  -->
                            <div class="row">
                                <!--   datails -->
                                <div class="col-md-8">
                                    <div class="list-single-main-container"> <!-- css 파일에서 margin auto 줘보기 -->
                                     
                                        <!-- 소개 -->
                                        <div class="list-single-main-item fl-wrap" id="sec2">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3> 소개 </h3>
                                            </div>
                                            <p>${locationDetail.locationContent }</p>
                                 
                                        </div>
                                        <!-- 소개 end -->
                                        
                                        <!-- 메뉴 -->
                                        <div class="list-single-main-item fl-wrap" id="sec3">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3> 메뉴 </h3>
                                            </div>
                                            <div class="listing-features fl-wrap">
                                                <ul>
                                                    <c:forEach var="menuInfo" items="${menuList }" varStatus="loop">                                                    
                                                    	<!-- 인덱스가 2의 배수인 경우 개행 추가 -->
                                                    	<c:if test="${loop.index > 0 && loop.index % 2 == 0}">
                                                    		</ul><ul style="clear: both;">
                                                    	</c:if>
                                                    	<li>${menuInfo.menuName} - ${menuInfo.menuPrice}</li>
                                                    </c:forEach>                                                    
                                                </ul>
                                            </div>             
                                        </div>
                                        <!--   메뉴 end -->                                                     
                                        <!--   리뷰 -->
                                        <div class="list-single-main-item fl-wrap" id="sec4">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3>리뷰</h3>
                                            </div>
                                            <!--  리뷰 container -->
                                            <div class="rooms-container fl-wrap">
                                            	<!-- 리뷰 레코드가 있을 때만 화면 출력 -->
                                            	<c:if test="${locationDetail.locationReviewContent1 != null && locationDetail.locationReviewContent1 != '리뷰없음'}" >
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/유저 프로필 이미지 여기서 받음"
                                                       	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/avatar/avatar-bg.png'">  
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent1 }</p>
                                                   	</div>
                                               	</div>
                                               	</c:if>
                                               	                                           
                                               	<c:if test="${locationDetail.locationReviewContent2 != null && locationDetail.locationReviewContent2 != '리뷰없음'}" >
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/유저 프로필 이미지 여기서 받음"
                                                       	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/avatar/avatar-bg.png'">  
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent2 }</p>
                                                   	</div>
                                               	</div>
                                               	</c:if>
                                               	
                                               	<c:if test="${locationDetail.locationReviewContent3 != null && locationDetail.locationReviewContent3 != '리뷰없음'}" >
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/유저 프로필 이미지 여기서 받음"
                                                       	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/avatar/avatar-bg.png'">  
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent3 }</p>
                                                   	</div>
                                               	</div>
                                               	</c:if>
                                               	
                                               	<c:if test="${locationDetail.locationReviewContent4 != null && locationDetail.locationReviewContent4 != '리뷰없음'}" >
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/유저 프로필 이미지 여기서 받음"
                                                       	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/avatar/avatar-bg.png'">  
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent4 }</p>
                                                   	</div>
                                               	</div>
                                               	</c:if>
                                               	
                                               	<c:if test="${locationDetail.locationReviewContent5 != null && locationDetail.locationReviewContent5 != '리뷰없음'}" >
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/유저 프로필 이미지 여기서 받음"
                                                       	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/avatar/avatar-bg.png'">  
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent5 }</p>
                                                   	</div>
                                               	</div>
                                               	</c:if>
                                        	</div>
                                        <!--   리뷰 container end -->
                                    	</div>
                                        <!-- 리뷰 end -->     
                                        <!-- 주소 -->
                                        <div class="list-single-main-item fl-wrap" id="sec5">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3> 주소 </h3>
                                            </div>
                                            <p> ${locationDetail.locationPlace } </p>
                                           
                                        </div>
                                        <!-- 주소 end -->
                                        <!-- 지도 -->
                                        <div class="list-single-main-item fl-wrap" id="sec6">
                                        
                                        	<div class="catelist-single-main-item-title fl-wrap">
                                                <h3>지도</h3>
                                            </div>
                                        	<div id="map" style="width:100%;height:400px;">
                                        	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=89a5d00a4b30ffdb0b3d0d587201ad3c"></script>
                                        	<script>
                                        		var container = document.getElementById("map");
                                        		var options = {
                                        			center : new kakao.maps.LatLng(${locationDetail.locationLatitude}, ${locationDetail.locationLongitude}), level: 3
                                        		
                                        		};
                                        		var map = new kakao.maps.Map(container, options);
                                        		
                                        		// 마커가 표시될 위치입니다 
                                        		var markerPosition  = new kakao.maps.LatLng(${locationDetail.locationLatitude}, ${locationDetail.locationLongitude}); 

                                        		// 마커를 생성합니다
                                        		var marker = new kakao.maps.Marker({
                                        		    position: markerPosition
                                        		});

                                        		// 마커가 지도 위에 표시되도록 설정합니다
                                        		marker.setMap(map);
                                        	</script>                                       		
                                        	</div>
                                        	<!-- 지도 end -->
                                        </div>
                                        <button class="back-button">이전으로</button>
                                    </div>
                                </div>
                                <!--   datails end  -->
                            </div>
                            <!--   row end  -->
                        </div>
                        <!--   container  end  -->
                    </section>
                    <!--  section  end-->
                </div>
                <!-- content end-->
                <div class="limit-box fl-wrap"></div>
            </div>
            <!--wrapper end -->
            <!--footer -->
            <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>  
            <!--footer end -->
            <script src="/js/favorites/favorites.js"></script>
            <script src="/js/location/locations.js"></script>
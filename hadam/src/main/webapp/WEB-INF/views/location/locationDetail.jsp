<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
                                        <li><a href="#sec3">주소</a></li>
                                        <li><a href="#sec4">메뉴</a></li>
                                        <li><a href="#sec5">리뷰</a></li>
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
                                        <!-- fixed-scroll-column  -->
                                        <div class="fixed-scroll-column">
                                            <div class="fixed-scroll-column-item fl-wrap">
                                                <div class="showshare sfcs fc-button"><i class="far fa-share-alt"></i><span>Share </span></div>
                                                <div class="share-holder fixed-scroll-column-share-container">
                                                    <div class="share-container  isShare"></div>
                                                </div>
                                                	<a class="fc-button" href="addFavorites?locationId=${locationDetail.locationId }&memberIndex='세션아이디 여기 넣으면 됨'">
                                                	<i class="far fa-heart"></i> <span>찜하기</span></a>
                                            </div>
                                        </div>
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
                                    <div class="flat-hero-container fl-wrap">
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
                                        
                                        <a href="" class="btn flat-btn color2-bg big-btn float-btn image-popup">스케줄에 추가</a>
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
                                        <!-- 상세정보 -->
                                        <div class="list-single-main-item fl-wrap" id="sec3">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3> 주소 </h3>
                                            </div>
                                            <p> ${locationDetail.locationPlace } </p>
                                           
                                        </div>
                                        <!-- 상세정보 end -->
                                        <!-- 메뉴 -->
                                        <div class="list-single-main-item fl-wrap" id="sec4">
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
                                        <div class="list-single-main-item fl-wrap" id="sec5">
                                            <div class="catelist-single-main-item-title fl-wrap">
                                                <h3>리뷰</h3>
                                            </div>
                                            <!--  rooms-container -->
                                            <div class="rooms-container fl-wrap">                                            		
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt=""> 
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent }</p>
                                                   	</div>
                                               	</div>
                                               		                                                	                                                                  		                                            		
                                               	<div class="catereviews-comments-item">
                                                   	<div class="catereview-comments-avatar">
                                                       	<img src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt=""> 
                                                   	</div>
                                                   	<div class="catereviews-comments-item-text">                                                        	                                                        	
                                                       	<p>${locationDetail.locationReviewContent }</p>
                                                   	</div>
                                               	</div>	                                                	                                                                                                               	                             
                                        	</div>
                                        <!--   rooms-container end -->
                                    	</div>
                                        <!-- 리뷰 end -->     
                                        <div class="list-single-main-item fl-wrap" id="sec6">
                                        
                                        	<div class="catelist-single-main-item-title fl-wrap">
                                                <h3>지도</h3>
                                            </div>
                                        	<div id="map" style="width:100%;height:400px;">
                                        	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=89a5d00a4b30ffdb0b3d0d587201ad3c"></script>
                                        	<script>
                                        		var container = document.getElementById("map");
                                        		var options = {
                                        			center : new kakao.maps.LatLng(33.450701, 126.570667), level: 3
                                        		};
                                        		var map = new kakao.maps.Map(container, options);
                                        	</script>                                       		
                                        	</div>
                                        </div>
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
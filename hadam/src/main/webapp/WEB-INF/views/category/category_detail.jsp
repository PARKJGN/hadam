<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<!-- header-->
           <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                	<div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="#">메인 페이지</a><a href="#">분류 페이지</a><span>분류 상세 페이지</span></div>
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
                                        <li><a href="#sec3">상세정보</a></li>
                                        <li><a href="#sec4">메뉴</a></li>
                                        <li><a href="#sec5">리뷰</a></li>
                                        <li><a href="#sec6">지도</a></li>
                                    </ul>
                                </nav>
                                <a href="#" class="show-hidden-map">  <span>On The Map</span> <i class="fal fa-map-marked-alt"></i></a>
                            </div>
                        </div>
                        <!--  scroll-nav-wrapper end  -->                    
                        <!--   container  -->
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="list-single-main-container ">
                                        <!-- fixed-scroll-column  -->
                                        <div class="fixed-scroll-column">
                                            <div class="fixed-scroll-column-item fl-wrap">
                                                <div class="showshare sfcs fc-button"><i class="far fa-share-alt"></i><span>Share </span></div>
                                                <div class="share-holder fixed-scroll-column-share-container">
                                                    <div class="share-container  isShare"></div>
                                                </div>
                                                <a class="fc-button" href="#"><i class="far fa-heart"></i> <span>Save</span></a>
                                                
                                            </div>
                                        </div>
                                        <!-- 장소 이미지 -->                                          
                                        <div class="list-single-main-media fl-wrap" id="sec1">
                                                    <div class="slick-slide-item"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- 우측 툴탭 -->
                                    <div class="flat-hero-container fl-wrap">
                                        <div class="box-widget-item-header fl-wrap ">
                                            <h3>~~ 장소명 ~~</h3>
                                            <div class="listing-rating-wrap">
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                            </div>
                                        </div>
                                        <div class="rate-class-name-wrap fl-wrap">
                                        	<div class="rate-class-name">
                                            	<span>4.5</span> 
                                            	<div class="score"><strong>Very Good</strong></div>
                                        	</div>
                                        </div>
                                        <div class="list-single-hero-price fl-wrap">평균 시간<span> 1 시간 </span></div> 
                                        
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
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3> 소개 </h3>
                                            </div>
                                            <p>
                                            나른하고 지치는 오후에 혼자 한 잔의 ‘커피’로 여유를 느낄 수 있는 당신은
                                            하루를 끝내고 마무리하는 저녁에도 혼자 한잔의 ‘술’로 피로를 풀 수도 있을 거에요.
                                            알키미스타로 오세요.
                                            퇴근 후 저녁, 잠 안 오는 ‘아메리카노’ 대신 시원한 진토닉으로 하루를 마무리하도록 도와드릴게요:) 
                                            </p>
                                 
                                        </div>
                                        <!-- 소개 end -->
                                        <!-- 상세정보 -->
                                        <div class="list-single-main-item fl-wrap" id="sec3">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3> 상세정보 </h3>
                                            </div>
                                            <p> 도로명 : 서울시 마포구 ~~로 </p>
                                            <p> 지번 : 서울시 마포구 ~~동 </p>
                                           
                                        </div>
                                        <!-- 상세정보 end -->
                                        <!-- 메뉴 -->
                                        <div class="list-single-main-item fl-wrap" id="sec4">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3> 메뉴 </h3>
                                            </div>
                                            <div class="listing-features fl-wrap">
                                                <ul>
                                                    <li> 아메리카노 1500원 </li>
                                                    <li> 카페라떼 1500원 </li>
                                                    <li> 물 1500원</li>
                                                    <li> 우유 1500원</li>
                                                </ul>
                                            </div>             
                                        </div>
                                        <!--   메뉴 end -->                                                     
                                        <!--   리뷰 -->
                                        <div class="list-single-main-item fl-wrap" id="sec5">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>리뷰</h3>
                                            </div>
                                            <!--   rooms-container -->
                                            <div class="rooms-container fl-wrap">
                                                <div class="rooms-item fl-wrap">  
                                            		<div class="reviews-comments-wrap">
                                                	<!-- reviews-comments-item -->  
                                                	<div class="reviews-comments-item">
                                                    	<div class="review-comments-avatar">
                                                        	<img src="images/avatar/1.jpg" alt=""> 
                                                    	</div>
                                                    	<div class="reviews-comments-item-text">
                                                        	<h4><a href="#">Liza Rose</a></h4>
                                                        	<div class="review-score-user">
                                                            	<span>4.4</span>
                                                            	<strong>Good</strong>
                                                        	</div>
                                                        	<div class="clearfix"></div>
                                                        	<p>" Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. "</p>
                                                        	<div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>12 April 2018</span><a href="#"><i class="fal fa-reply"></i> Reply</a></div>
                                                    	</div>
                                                	</div>
                                                	<!--reviews-comments-item end--> 
                                                	<!-- reviews-comments-item -->  
                                                	<div class="reviews-comments-item">
                                                    	<div class="review-comments-avatar">
                                                        	<img src="images/avatar/1.jpg" alt=""> 
                                                    	</div>
                                                    	<div class="reviews-comments-item-text">
                                                        	<h4><a href="#">Adam Koncy</a></h4>
                                                        	<div class="review-score-user">
                                                            	<span>4.7</span>
                                                            	<strong>Very Good</strong>
                                                        	</div>
                                                        	<div class="clearfix"></div>
                                                        	<p>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. "</p>
                                                        	<div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>03 December 2017</span><a href="#"><i class="fal fa-reply"></i> Reply</a></div>
                                                    	</div>
                                                	</div>
                                                	<!--reviews-comments-item end-->                                                                  
                                            		</div>
                                            	</div>                              
                                        	</div>
                                        <!--   rooms-container end -->
                                    	</div>
                                        <!-- 리뷰 end -->     
                                        <div class="list-single-main-item fl-wrap" id="sec6">
                                        
                                        	<div class="list-single-main-item-title fl-wrap">
                                                <h3>지도</h3>
                                            </div>
                                        	<div id="map" style="width:630px;height:400px;">
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
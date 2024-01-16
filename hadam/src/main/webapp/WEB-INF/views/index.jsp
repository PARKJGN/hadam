<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <!-- index css 임포트 -정건일-->
        	<link type="text/css" rel="stylesheet" href="/css/index.css">
            <!-- index css 임포트 end-정건일-->    	
            <!-- header-->
           	<jsp:include page="../layout/header.jsp"></jsp:include>
 			    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 			
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
				<!-- kakao map -->
				<!-- <div>
					<input id="kakaomapsearch" value=""><button id="kakaomapbtn">찾기</button>
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
	
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5272676073cc971ef5a65eac1fa8919b&libraries=services"></script>
					<script type="text/javascript">
							$(document).ready(function () {
					            // 변수를 전역으로 선언하여 클릭 이벤트 밖에서도 접근 가능하게 합니다.
					            var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
					            var mapContainer = document.getElementById('map');
					            var mapOption = {
					                center: new kakao.maps.LatLng(37.566826, 126.9786567),
					                level: 3
					            };
					            var map = new kakao.maps.Map(mapContainer, mapOption);
					            var ps = new kakao.maps.services.Places();
		
					            $('#kakaomapbtn').click(function () {
					                // 클릭 이벤트 핸들러 안에서 변수를 정의하고 사용합니다.
					                var search_location = $('#kakaomapsearch').val();
					                console.log(search_location);
		
					                // 키워드로 장소를 검색합니다
					                ps.keywordSearch(search_location, placesSearchCB);
		
					                function placesSearchCB(data, status, pagination) {
					                    if (status === kakao.maps.services.Status.OK) {
					                        var bounds = new kakao.maps.LatLngBounds();
		
					                        for (var i = 0; i < data.length; i++) {
					                            displayMarker(data[i]);
					                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
					                        }
		
					                        map.setBounds(bounds);
					                    }
					                }
		
					                function displayMarker(place) {
					                    var marker = new kakao.maps.Marker({
					                        map: map,
					                        position: new kakao.maps.LatLng(place.y, place.x)
					                    });
		
					                    kakao.maps.event.addListener(marker, 'click', function () {
					                        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					                        infowindow.open(map, marker);
					                    });
					                }
					            });
					        });
					</script> -->

           		<!-- kako map end -->
                <!-- content-->
                <div class="content">
                    <!--section -->
                    <section class="hero-section" data-scrollax-parent="true" id="sec1">
                        <div class="hero-parallax">
                            <div class="bg"  data-bg="images/bg/2.jpg" data-scrollax="properties: { translateY: '200px' }"></div>
                            <div class="overlay op7"></div>
                        </div>
                        <div class="hero-section-wrap fl-wrap">
                            <div class="container">
                                <div class="home-intro">
                                    <div class="section-title-separator"></div>
                                    <h2>어휴.. 하기싫어!</h2>
                                    <span class="section-separator"></span>                                    
                                    <h3>Ugh.. I don’t want to do it.!</h3>
                                </div>
                               <div class="main-search-input-container">
                                <div class="main-search-input-wrap">
                                    <div class="main-search-input fl-wrap" style="width:1150px;left:-150px;">
									<form action="AI스케줄 생성페이지로 붙혀주기" method="post" id="">

                                    <!-- 장소정하기 -->
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <span class="inpt_dec"><i class="fal fa-map-marker"></i></span>
                                            <input type="text" placeholder="출발 장소 선택" class="autocomplete-input" id="autocompleteid2"  value=""/>
                                           
                                        </div>
                                    <!-- 장소정하기 -->
                                    <!-- 장소정하기2 -->
                                        <div class="main-search-input-item main-search-input-item_small" id="autocomplete-container2">
                                            <span class="inpt_dec"><i class="fal fa-map-marker"></i></span>
                                            <input type="text" placeholder="스케줄 시작 장소 선택" class="autocomplete-input" id="autocompleteid2"  value=""/>
                                            
                                        </div>
                                    <!-- 장소정하기2 -->
                                    <!-- 날짜정하기 -->
                                        <div class="main-search-input-item main-date-parent main-search-input-item_small">
                                            <span class="inpt_dec"><i class="fal fa-calendar-check"></i></span> <input type="text" placeholder="When" name="main-input-search"   value=""/>
                                        </div>
                            		<!-- 날짜정하기 -->

                                    <!-- 코스 카테고리 선택하기-->
                                         <div class="main-search-input-item">
                                            <div class="qty-dropdown fl-wrap">
												<div class="container333">
	                                                <div class="qty-dropdown-header1 fl-wrap input-wrapper" id="headerDiv">
														<input type="text" value="스케줄을 추가해주세요!" readonly>
	 											     </div>
	 											     <div class="icon-container">
	 											     	<i class="fas fa-plus" style="font-size: 18px;"></i>                                               
	 											     </div>
	 											 </div>
                                                <div class="qty-dropdown-content fl-wrap" id="courseContainer">
													<div class="quantity-item all-item">
														<span class="cours-number">원하는 코스를 추가해주세요!</span>
                                                	<!-- 코스 div 묶음 -정건일 -->
	                                                    <div class="quantity-item quantity-item-label" id="iconOptions">
    														<label><i class="fas fa-icons " data-icon="fa-icons" style="font-size:28px;"></i><span class="cours-name">놀기</span></label>
	                                                        <label><i class="fas fa-shoe-prints " data-icon="fa-shoe-prints" style="font-size:28px;" ></i><span class="cours-name">걷기</span></label>
	                                                        <label><i class="fas fa-ticket " data-icon="fa-ticket" style="font-size:28px;"></i><span class="cours-name">보기</span></label>
	                                                        <label><i class="fas fa-bowl-food " data-icon="fa-bowl-food" style="font-size:28px;"></i><span class="cours-name">먹기</span></label>
	                                                        <label><i class="fas fa-wine-glass " data-icon="fa-wine-glass" style="font-size:28px;"></i><span class="cours-name">마시기</span></label>
								
	                                                    </div>
                                                	<!-- 코스 div 묶음 -정건일 -->
													</div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="main-search-button color2-bg" onclick="window.location.href='listing.html'">AI스케줄 생성하러가기</button>
									</form>
                                    <!-- 코스 카테고리 선택하기-->


                                    </div>
                                </div>
                               </div>
                            </div>
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec2" class="custom-scroll-link color-bg"><i class="fal fa-angle-double-down"></i></a></div>
                        </div>
                    </section>
                    <!-- section end -->                    
                   
                    <!-- section-->
                    <section class="grey-blue-bg">
                        <!-- container-->
                        <div class="container">
                            <div class="section-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2>지금 핫한 장소</h2>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        
                        <!-- container end-->
                        <!-- carousel -->
                        <div class="list-carousel fl-wrap card-listing ">
                            <!--listing-carousel-->
                            <div class="listing-carousel fl-wrap ">
							 <!-- 메인페이지 지금 핫한 장소정보 end -->
							  <c:forEach var="infoList" items="${infoList}">  
                                <div class="slick-slide-item">
                                    <div class="listing-item" style="width:400px;">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <a href="listing-single.html"><img src="images/gal/마포식당.jpg" alt=""></a>

                                                <div class="geodir-category-opt">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="${infoList.locationRating}"></div>
                                                    <div class="rate-class-name">
                                                        <div class="score"><strong>Very Good</strong>${infoList.locationReviewCount} Reviews </div>
                                                        <span>${infoList.locationRating}</span>                                             
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap title-sin_item">
                                                <div class="geodir-category-content-title fl-wrap">
                                                    <div class="geodir-category-content-title-item">
                                                        <h3 class="title-sin_map"><a href="listing-single.html">${infoList.locationName}</a></h3>
                                                        <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 서울 마포구 신수동 81-17</a></div>
                                                    </div>
                                                </div>
                                                <p>${infoList.locationContent}</p>
                                            </div>
                                            
                                        </article>
                                        
                                    </div>
                                </div>
                                </c:forEach>

							 <!-- 메인페이지 지금 핫한 장소정보 end -->                                                                 
                            </div>
                            <!--listing-carousel end-->
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                        </div>
                        <!--  carousel end-->
                    </section>
                    <!-- section end -->
  
  
  <!-- 리뷰마케팅 섹션  -->
                    <section>
                        <div class="container">
                            <div class="section-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2>스케줄 참여 리뷰</h2>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--slider-carousel-wrap -->
                        <div class="slider-carousel-wrap text-carousel-wrap fl-wrap">
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                            <div class="text-carousel single-carousel fl-wrap">
                                <!--slick-item -->
                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">Milka Antony  - <span>Happy Client</span></div>
                                        <p> "In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed diam nonu mmy nibh euismod tincidunt ut laoreet dolore magna aliquam erat."</p>
                                        <a href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div>
                                <!--slick-item end -->
                            </div>
                        </div>
                        <!--slider-carousel-wrap end-->
                    </section>
                    <!-- 리뷰마케팅 섹션 end  -->
 
                    <section class="grey-blue-bg">
                        <!-- container-->
                        <div class="container">
                            <div class="section-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2>나와 비슷한 성향을 가진 유저들이 좋아하는 장소</h2>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        
                        <!-- container end-->
                        <!-- carousel -->
                        <div class="list-carousel fl-wrap card-listing ">
                            <!--listing-carousel-->
                            <div class="listing-carousel fl-wrap ">
							 <!-- 메인페이지 지금 핫한 장소정보 end -->
							  <c:forEach var="infoList" items="${infoList}">  
                                <div class="slick-slide-item">
                                    <div class="listing-item" style="width:400px;">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <a href="listing-single.html"><img src="images/gal/마포식당.jpg" alt=""></a>

                                                <div class="geodir-category-opt">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                    <div class="rate-class-name">
                                                        <div class="score"><strong>Very Good</strong>${infoList.locationReviewCount} Reviews </div>
                                                        <span>${infoList.locationRating}</span>                                             
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap title-sin_item">
                                                <div class="geodir-category-content-title fl-wrap">
                                                    <div class="geodir-category-content-title-item">
                                                        <h3 class="title-sin_map"><a href="listing-single.html">${infoList.locationName}</a></h3>
                                                        <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 서울 마포구 신수동 81-17</a></div>
                                                    </div>
                                                </div>
                                                <p>${infoList.locationContent}</p>
                                            </div>
                                            
                                        </article>
                                        
                                    </div>
                                </div>
                                </c:forEach>

							 <!-- 메인페이지 지금 핫한 장소정보 end -->                                                                 
                            </div>
                            <!--listing-carousel end-->
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                        </div>
                        <!--  carousel end-->
                    </section>
                    <!-- section end -->                                   

                    
<!--section -->     

                  
                    <section class=" middle-padding">
                        <div class="container">
                            <div class="section-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2>20대, 30대에게 인기있는</h2>
                                <span class="section-separator"></span>
                                <p>Browse the latest articles from our blog.</p>
                            </div>
                            <div class="row home-posts">
                                <div class="col-md-4">
                                    <article class="card-post">
                                        <div class="card-post-img fl-wrap">
                                            <a href="blog-single.html"><img  src="images/all/1.jpg"   alt=""></a>
                                        </div>
                                        <div class="card-post-content fl-wrap">
                                            <h3><a href="blog-single.html">Blog Post Title.</a></h3>
                                            <p>In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. </p>
                                            <div class="post-author"><a href="#"><img src="images/avatar/1.jpg" alt=""><span>By , Mery Lynn</span></a></div>
                                            <div class="post-opt">
                                                <ul>
                                                    <li><i class="fal fa-calendar"></i> <span>25 April 2018</span></li>
                                                    <li><i class="fal fa-eye"></i> <span>264</span></li>
                                                    <li><i class="fal fa-tags"></i> <a href="#">Design</a>  </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="col-md-4">
                                    <article class="card-post">
                                        <div class="card-post-img fl-wrap">
                                            <div class="list-single-main-media fl-wrap">
                                                <div class="single-slider-wrapper fl-wrap">
                                                    <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="images/all/1.jpg" alt=""></div>
                                                        <div class="slick-slide-item"><img src="images/all/1.jpg" alt=""></div>
                                                        <div class="slick-slide-item"><img src="images/all/1.jpg" alt=""></div>
                                                    </div>
                                                    <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                                                    <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-post-content fl-wrap">
                                            <h3><a href="blog-single.html">Blog Post Title.</a></h3>
                                            <p>In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. </p>
                                            <div class="post-author"><a href="#"><img src="images/avatar/1.jpg" alt=""><span>By , Mery Lynn</span></a></div>
                                            <div class="post-opt">
                                                <ul>
                                                    <li><i class="fal fa-calendar"></i> <span>25 April 2018</span></li>
                                                    <li><i class="fal fa-eye"></i> <span>264</span></li>
                                                    <li><i class="fal fa-tags"></i> <a href="#">Design</a>  </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="col-md-4">
                                    <article class="card-post">
                                        <div class="card-post-img fl-wrap">
                                            <a href="blog-single.html"><img  src="images/all/1.jpg"   alt=""></a>
                                        </div>
                                        <div class="card-post-content fl-wrap">
                                            <h3><a href="blog-single.html">Blog Post Title.</a></h3>
                                            <p>In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. </p>
                                            <div class="post-author"><a href="#"><img src="images/avatar/1.jpg" alt=""><span>By , Mery Lynn</span></a></div>
                                            <div class="post-opt">
                                                <ul>
                                                    <li><i class="fal fa-calendar"></i> <span>25 April 2018</span></li>
                                                    <li><i class="fal fa-eye"></i> <span>264</span></li>
                                                    <li><i class="fal fa-tags"></i> <a href="#">Design</a>  </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <a href="blog.html" class="btn    color-bg ">Read All News<i class="fas fa-caret-right"></i></a>
                        </div>
                        <div class="section-decor"></div>
                    </section>

 <!-- section-->
                    <!-- section end-->
                   <!--  <section class="parallax-section" data-scrollax-parent="true">
                        <div class="bg"  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '100px' }"></div>
                        <div class="overlay"></div>
                        container
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    column text
                                    <div class="colomn-text fl-wrap">
                                        <div class="colomn-text-title">
                                            <h3>The owner of the hotel or business ?</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                                            <a href="dashboard-add-listing.html" class="btn  color-bg float-btn">Add your hotel<i class="fal fa-plus"></i></a>
                                        </div>
                                    </div>
                                    column text   end
                                </div>
                            </div>
                        </div>
                    </section> -->
                    <!-- section end -->
                    
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
            <jsp:include page="../layout/footer.jsp"></jsp:include>
            <script src="/js/index.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            
          
            <!--footer end -->
           
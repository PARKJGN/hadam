<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

            <!-- header-->
        <!--=============== import-header  ===============-->
           	<jsp:include page="../layout/header.jsp"></jsp:include>
        <!--=============== css  ===============-->
            <!-- index css -정건일-->
        	<link type="text/css" rel="stylesheet" href="/css/index.css">
		<!--=============== script ===============-->
        	<!-- 카카오맵 api -->
        	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5272676073cc971ef5a65eac1fa8919b&libraries=services"></script>



            <div id="wrapper">
            <!-- 모달창 코드 장소 입니다. 구성 : 카카오맵/작성자 : 정건일-->
						<!-- kakao map 출발장소 선택-->
							  <div class="modal kakaomap" id="myModal"> 					
								<div class="map_wrap">
									    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
									
									    <div id="menu_wrap" class="bg_white">
									        <div class="option">
									            <div>
													<form id="searchForm">
													    키워드 : <input type="text" placeholder="장소를 입력하세요." value="" id="keyword" size="15"> 
													    <button type="submit" >검색하기</button> 
													</form>
								            </div>
									        </div>
									        <hr>
									        <ul id="placesList"></ul>
									        <div id="pagination"></div>
									    </div>
									</div>
						         <button  class="btn-two green rounded" id="closeModalBtn">창 닫기</button>
						    </div>
						       <div class="modal-overlay kakaomap" id="modalOverlay"></div> 		
		           		<!-- kakao map 출발장소 end -->
		           		
      					<!-- kakao map 스케줄 시작장소 선택-->
							  <div class="modal kakaomap" id="myModal2"> 					
								<div class="map_wrap2">
									    <div id="map2" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
									
									    <div id="menu_wrap2" class="bg_white">
									        <div class="option">
									            <div>
													<form id="searchForm2">
													    키워드 : <input type="text" placeholder="장소를 입력하세요." value="" id="keyword2" size="15"> 
													    <button type="submit" >검색하기</button> 
													</form>
									            </div>
									        </div>
									        <hr>
									        <ul id="placesList2"></ul>
									        <div id="pagination2"></div>
									    </div>
									</div>
						         <button class="btn-two green rounded" id="closeModalBtn2">창 닫기</button>
						    </div>
						       <div class="modal-overlay kakaomap" id="modalOverlay2"></div> 		
		           		<!-- kakao map 스케줄 시작장소 선택 end -->			
		      <!-- 모달창 코드 장소 입니다. 구성 : 카카오맵/작성자 : 정건일-->
		           		
		           		
                <!-- content-->
                <div class="content">
                    <!--main_header_section -->
                    <!-- 메인 배너/ AI스케줄 정보 입력칸 등 -->
                    <section class="hero-section" data-scrollax-parent="true" id="sec1">
                        <div class="hero-parallax">
                            <div class="bg"  data-bg="images/bg/2.jpg" data-scrollax="properties: { translateY: '200px' }"></div>
                            <div class="overlay op7"></div>
                        </div>
                        <div class="hero-section-wrap fl-wrap">
                            <div class="container">
                                <div class="home-intro">
                                    <div class="section-title-separator"></div>
                                    <h2>당신의 완벽한 하루를 디자인하세요!</h2>
                                    <span class="section-separator"></span>                                    
                                    <h3>Design your perfect day!</h3>
                                </div>
                               <div class="main-search-input-container">
                                <div class="main-search-input-wrap">
                                    <div class="main-search-input fl-wrap" style="width:1150px;left:-150px;">
									<form action="/schedule/pythonsocket" method="get">

                                    <!-- 장소정하기 -->
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <span class="inpt_dec"><i class="fal fa-map-marker"></i></span>
                                            <input type="text" placeholder="스케줄 시작 장소 선택" class="autocomplete-input" id="autocompleteid1"  value="" name="알고리즘 vo에 들어갈 이름으로 바꾸기1" readonly/>
                                        </div>
                                    <!-- 장소정하기 -->
                                    <!-- 장소정하기2 -->
                                     <!--    <div class="main-search-input-item main-search-input-item_small" id="autocomplete-container2">
                                            <span class="inpt_dec"><i class="fal fa-map-marker"></i></span>
                                            <input type="text" placeholder="스케줄 시작 장소 선택" class="autocomplete-input" id="autocompleteid2"  readonly/>
                                            
                                        </div> -->
                                    <!-- 장소정하기2 -->
                                    
                                    <!-- 날짜정하기 -->
                                        <div class="main-search-input-item main-date-parent main-search-input-item_small">
                                            <span class="inpt_dec"><i class="fal fa-calendar-check"></i></span> 
                                            <input type="text" placeholder="When" name="main-input-search77" id= "aistarttime" readonly/>
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
                                        <button type = "button" class="aisubmit main-search-button color2-bg">AI스케줄 생성하러가기</button>
									</form>
                                    <!-- 코스 카테고리 선택하기-->


                                    </div>
                                </div>
                               </div>
                            </div>
                        </div>
                        <div class="header-sec-link">
                        </div>
                    </section>
                    <!-- main_header_section end -->                    
                   

  
  		 <!-- 나와 비슷한 성향을 가진 유저들이 좋아하는 장소 section-->
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
							  <c:forEach var="simiierLocation" items="${simiierLocation}">  
                                <div class="slick-slide-item">
                                    <div class="listing-item" style="width:400px;">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <a href="/location/locationDetail?locationId=${simiierLocation.locationId}"><img src="images/location/${simiierLocation.locationName}.jpg" alt="" style="width:100%; height:270px" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></a>

                                                <div class="geodir-category-opt">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                    <div class="rate-class-name">
                                                        <div class="score"><strong>Very Good</strong>${simiierLocation.locationReviewCount} Reviews </div>
                                                        <span>${simiierLocation.locationRating}</span>                                             
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap title-sin_item">
                                                <div class="geodir-category-content-title fl-wrap">
                                                    <div class="geodir-category-content-title-item">
                                                        <h3 class="title-sin_map"><a href="/location/locationDetail?locationId=${simiierLocation.locationId}">${simiierLocation.locationName}</a></h3>
                                                        <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>${simiierLocation.locationPlace}</a></div>
                                                    </div>
                                                </div>
                                                <p>${simiierLocation.locationContent}</p>
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
                    <!-- 나와 비슷한 성향을 가진 유저들이 좋아하는 장소section end --> 
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
                        <div class="slider-carousel-wrap text-carousel-wrap fl-wrap" style="height:250px margin-top: -15px;">
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                            <div class="text-carousel single-carousel fl-wrap">
                                <!--slick-item -->
                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">마당을 나온 암탉  - <span>신촌방랑식객, 그곳에서 만났던 환상적인 순간들</span></div>
                                        <p  style="font-family: initial;"> 안녕하세요, 저는 "신촌방랑식객"이라는 모임에 참여하게되었습니다."신촌방랑식객"의 모임은 정말 즐거웠어요.다양한 음식, 예술, 문화를 경험하며 새로운 친구들과 소중한 추억을 만들었던 이 날, 정말 특별한 경험이었습니다. 모임을 통해 새로운 사람들을 만나고 다양한 경험을 나누다 보니, 이 도시가 더욱 따뜻하고 아름다워 보였어요. 앞으로도 이런 모임이 더 많이 열렸으면 좋겠다는 소망을 담아 이 만남의 소중함을 기억하며 글을 마치겠습니다. 모두 함께 행복한 순간을 만들어 가자고요!</p>
                                        <a href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div> 
                                
                                                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">마당을 나온 암탉  - <span>신촌방랑식객, 그곳에서 만났던 환상적인 순간들</span></div>
                                        <p style="font-family: initial;"> 안녕하세요, 저는 "신촌방랑식객"이라는 모임에 참여하게되었습니다."신촌방랑식객"의 모임은 정말 즐거웠어요.다양한 음식, 예술, 문화를 경험하며 새로운 친구들과 소중한 추억을 만들었던 이 날, 정말 특별한 경험이었습니다. 모임을 통해 새로운 사람들을 만나고 다양한 경험을 나누다 보니, 이 도시가 더욱 따뜻하고 아름다워 보였어요. 앞으로도 이런 모임이 더 많이 열렸으면 좋겠다는 소망을 담아 이 만남의 소중함을 기억하며 글을 마치겠습니다. 모두 함께 행복한 순간을 만들어 가자고요!</p>
                                        <a href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div> 
                                                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">마당을 나온 암탉  - <span>신촌방랑식객, 그곳에서 만났던 환상적인 순간들</span></div>
                                        <p style="font-family: initial;"> 안녕하세요, 저는 "신촌방랑식객"이라는 모임에 참여하게되었습니다."신촌방랑식객"의 모임은 정말 즐거웠어요.다양한 음식, 예술, 문화를 경험하며 새로운 친구들과 소중한 추억을 만들었던 이 날, 정말 특별한 경험이었습니다. 모임을 통해 새로운 사람들을 만나고 다양한 경험을 나누다 보니, 이 도시가 더욱 따뜻하고 아름다워 보였어요. 앞으로도 이런 모임이 더 많이 열렸으면 좋겠다는 소망을 담아 이 만남의 소중함을 기억하며 글을 마치겠습니다. 모두 함께 행복한 순간을 만들어 가자고요!</p>
                                        <a  href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div> 
                                                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">마당을 나온 암탉  - <span>신촌방랑식객, 그곳에서 만났던 환상적인 순간들</span></div>
                                        <p style="font-family: initial;"> 안녕하세요, 저는 "신촌방랑식객"이라는 모임에 참여하게되었습니다."신촌방랑식객"의 모임은 정말 즐거웠어요.다양한 음식, 예술, 문화를 경험하며 새로운 친구들과 소중한 추억을 만들었던 이 날, 정말 특별한 경험이었습니다. 모임을 통해 새로운 사람들을 만나고 다양한 경험을 나누다 보니, 이 도시가 더욱 따뜻하고 아름다워 보였어요. 앞으로도 이런 모임이 더 많이 열렸으면 좋겠다는 소망을 담아 이 만남의 소중함을 기억하며 글을 마치겠습니다. 모두 함께 행복한 순간을 만들어 가자고요!</p>
                                        <a href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div> 
                                                                <div class="slick-item">
                                    <div class="text-carousel-item">
                                        <div class="popup-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="2"> </div>
                                        <div class="review-owner fl-wrap">마당을 나온 암탉  - <span>신촌방랑식객, 그곳에서 만났던 환상적인 순간들</span></div>
                                        <p style="font-family: initial;"> 안녕하세요, 저는 "신촌방랑식객"이라는 모임에 참여하게되었습니다."신촌방랑식객"의 모임은 정말 즐거웠어요.다양한 음식, 예술, 문화를 경험하며 새로운 친구들과 소중한 추억을 만들었던 이 날, 정말 특별한 경험이었습니다. 모임을 통해 새로운 사람들을 만나고 다양한 경험을 나누다 보니, 이 도시가 더욱 따뜻하고 아름다워 보였어요. 앞으로도 이런 모임이 더 많이 열렸으면 좋겠다는 소망을 담아 이 만남의 소중함을 기억하며 글을 마치겠습니다. 모두 함께 행복한 순간을 만들어 가자고요!</p>
                                        <a href="#" class="testim-link">Via Facebook</a>
                                    </div>
                                </div> 
                                <!--slick-item end -->
                            </div>
                      </div>                   
                        <!--slider-carousel-wrap end-->
                    </section>
                    <!-- 리뷰마케팅 섹션 end  -->
 
 
	                    <!-- 지금 핫한 장소 섹션 section-->
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
                                                <a href="/location/locationDetail?locationId=${infoList.locationId}"><img src="images/location/${infoList.locationName}.jpg" alt="" style="width:100%; height:270px" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></a>

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
                                                        <h3 class="title-sin_map"><a href="/location/locationDetail?locationId=${infoList.locationId}">${infoList.locationName}</a></h3>
                                                        <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>${infoList.locationPlace}</a></div>
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
                    <!--지금 핫한 장소  section end -->                           

                    
<!--section -->     

                  
                    <section class=" middle-padding">
                        <div class="container">
                            <div class="section-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2>20대, 30대에게 인기있는</h2>
                                <span class="section-separator"></span>
                                <p>유저의 나이대에 맞춰서 현재 인기있는 장소들을 출력하고있습니다.</p>
                            </div>
                            <div class="row home-posts">
                                <div class="col-md-4">
                                    <article class="card-post">
                                        <div class="card-post-img fl-wrap">
                                            <a href="blog-single.html"><img src="images/location/${twentyThirtyPop[0].locationName}.jpg" alt="" style="width:100%; height:270px" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></a>
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
                                                        <div class="slick-slide-item"><img src="images/location/${twentyThirtyPop[1].locationName}.jpg" alt="" style="width:100%; height:270px" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></div>
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
            <!-- 외부 js에서 세션에 담긴 멤버 인덱스를 가져오기 위한 내부 스크립트 -->
            <jsp:include page="../layout/footer.jsp"></jsp:include>
              <script>
            	const member = <%= session.getAttribute("memberIndex") %>
            	let msg = "${scheMsg}"
            	if(msg != "") alert(msg)
            </script>
            <script src="/js/index.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="/js/schedule/pythonSocket.js"></script>
            <!--footer end -->
           
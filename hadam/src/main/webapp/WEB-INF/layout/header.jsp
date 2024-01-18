<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="KO">
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>Easybook - Hotel Booking Directory Listing Template </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="robots" content="index, follow"/>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <!--=============== css  ===============-->
        <link type="text/css" rel="stylesheet" href="/css/reset.css">
        <link type="text/css" rel="stylesheet" href="/css/plugins.css">
        <link type="text/css" rel="stylesheet" href="/css/style.css">
        <link type="text/css" rel="stylesheet" href="/css/color.css">
        <!-- 헤더 css 임포트 -정건일-->
        <link type="text/css" rel="stylesheet" href="/css/layout/header.css">
        <!-- 원하는 아이콘을 가져다가 쓰세요 https://fontawesome.com/search -정건일--> 
		<script src="https://kit.fontawesome.com/b2960bc7d5.js" crossorigin="anonymous"></script>	
        <!--=============== favicons ===============-->
        <link rel="shortcut icon" href="/images/favicon.ico">
    </head>

    <body>
        <!--loader-->
        <div class="loader-wrap">
            <div class="pin">
                <div class="pulse"></div>
            </div>
        </div>
        <!--loader end-->
        
        <!-- Main  -->
        <div id="main">
        
 			<header class="main-header">
                <!-- header-top-->
                <div class="header-top fl-wrap">
                    <div class="container">
                        <div class="logo-holder">
                        <!-- 로고 이미지 변경했습니다 01.11 -정건일 -->
                            <a href="/index"><img src="/images/main_logo.png" alt=""></a>
                        <!-- 로고 이미지 변경했습니다 01.11 -정건일 -->
                        </div>
                        <a href="dashboard-add-listing.html" class="add-hotel">스케즐 추가하기<span><i class="far fa-plus"></i></span></a>                     
                        <!-- 로그인 상태 확인 후 헤더 변경 [최성익] -->
                        <c:if test="${sessionScope.memberNickname == null}">
                        	<div class="show-reg-form modal-open"><i class="fa fa-sign-in"></i>로그인</div>
                        </c:if>
                        <c:if test="${sessionScope.memberNickname != null}">
                        	<a href="/signin/logout" class="signout"><div class="show-reg-form"><i class="fa fa-sign-in"></i>로그아웃</div></a>
                        </c:if>
                    </div>
                </div>
                <!-- header-top end-->
                <!-- header-inner-->
                <div class="header-inner fl-wrap">
                    <div class="container">
                        <div class="show-search-button"><span>Search</span> <i class="fas fa-search"></i> </div>
						<c:if test="${sessionScope.memberNickname != null}">
                        <!--1.12 알림표시 자리입니다. click_evt.js에 #alarmLink로 연결되어있습니다. -정건일-->
                        <div class="alarm-link" id="alarmLink">
	                        <i class="fal fa-bell "></i>
	                        <span class="wl_counter">3<!-- 알림갯수로 들어오는 데이터 그냥 빨간불빛으로 전환할 예정입니다.--></span>
                                        <!--second level -->
                                        <ul class="alram-user-menu">
                                            <li><a id="sseOutput" href="index.html">새로운 메세지가 도착했습니다.</a></li>
                                            <li><a href="index2.html">1:1 문의 답변이 완료되었습니다.</a></li>
                                            <li><a href="index3.html">스케줄에 참가신청이 들어왔습니다.</a></li>
                                            <li><a href="index4.html">텐서플로우</a></li>
                                        </ul>
                        </div>
                		<!--1.12 알림표시 자리입니다.  -정건일-->
                		                        
                        		 <!--1.12 채팅창아이콘 자리입니다. -정건일-->
                        <div class="alarm-link" id="alarmLink">
                        <i class="fa-regular fa-comment-dots"></i>
	                      <span class="wl_counter">8<!-- 알림갯수로 들어오는 데이터 --></span>
                                        <!--second level -->
                              <!--           <ul class="alram-user-menu">
                                            <li><a href="index.html">새로운 메세지가 도착했습니다.</a></li>
                                            <li><a href="index2.html">1:1 문의 답변이 완료되었습니다.</a></li>
                                            <li><a href="index3.html">스케줄에 참가신청이 들어왔습니다.</a></li>
                                            <li><a href="index4.html">텐서플로우</a></li>
                                        </ul> -->
                        </div>
                		<!--1.12 채팅창아이콘 자리입니다. -정건일-->
             

                		<!--1.11 마이페이지 토글버튼 입니다. -정건일-->
                        
                        <div class="header-user-menu">
                            <div class="header-user-name">
                                <span><img src="/images/avatar/1.jpg" alt=""></span>
                              	${sessionScope.memberNickname}
                            </div>
                        
                            <ul>
                                <li><a href="dashboard-myprofile.html"> 마이페이지 </a></li>
                                <li><a href="dashboard-add-listing.html"> 즐겨찾기 </a></li>
                                <li><a href="dashboard-bookings.html">  스케줄관리  </a></li>
                                <li><a href="dashboard-review.html"> 게시글관리 </a></li>
                            </ul>
                        </div>
                        </c:if>
                		<!--1.11 마이페이지 토글버튼 입니다.end -정건일-->
                        <!-- nav-button-wrap-->
                        <div class="nav-button-wrap color-bg">
                            <div class="nav-button">
                                <span></span><span></span><span></span>
                            </div>
                        </div>
                        <!-- nav-button-wrap end-->
                        <!--  navigation -->
                        <div class="nav-holder main-menu">
                            <nav>
                                <ul>
                                    <li>                        
                                    <!-- 메뉴탭 이름 변경했습니다. 01.11 -정건일 -->                           
                                        <a href="#">A.I스케줄<i class="fas "></i></a>
<!--                                         second level
                                        <ul>
                                            <li><a href="index.html">Parallax Image</a></li>
                                            <li><a href="index2.html">Slider</a></li>
                                            <li><a href="index3.html">Video</a></li>
                                            <li><a href="index4.html">Slideshow</a></li>
                                        </ul>
                                        second level end -->
                                    </li>
                                    <li>
                                        <a href="schedulepage">스케줄만들기 <i class="fas "></i></a>
<!--                                         second level
                                        <ul>
                                            <li><a href="listing.html">Column map</a></li>
                                            <li><a href="listing6.html">Column map 2</a></li>
                                            <li><a href="listing2.html">Fullwidth Map</a></li>
                                            <li><a href="listing3.html">Fullwidth Map 2</a></li>
                                            <li><a href="listing4.html">Without Map</a></li>
                                            <li><a href="listing5.html">Without Map 2</a></li>
                                            <li>
                                                <a href="#">Single <i class="fas fa-caret-down"></i></a>
                                                third  level 
                                                <ul>
                                                    <li><a href="listing-single.html">Style 1</a></li>
                                                    <li><a href="listing-single2.html">Style 2</a></li>
                                                    <li><a href="listing-single3.html">Style 3</a></li>
                                                    <li><a href="listing-single4.html">Style 4</a></li>
                                                </ul>
                                                third  level end
                                            </li>
                                        </ul>
                                        second level end -->
                                    </li>
                                 
                                    <li>
                                        <a href="#">커뮤니티 <i class="fas fa-caret-down"></i></a>
                                        <!--second level -->
                                        <ul>
                                            <li><a href="/community/boardList">자유게시판</a></li>
                                            <li><a href="scheduleShareList">스케줄공유 게시판</a></li>
                                        </ul>
                                        <!--second level end-->
                                    </li>
                                    <li>
                                        <a href="/category/category">장소찾기 <i class="fas "></i></a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
						 	<!-- endof 메뉴탭 이름 변경했습니다. 01.11 -정건일 -->                           
                        <!-- navigation  end -->
                        <!-- wishlist-wrap-->            
                        <div class="wishlist-wrap scrollbar-inner novis_wishlist">
                            <div class="box-widget-content">
                                <div class="widget-posts fl-wrap">
                                    <ul>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="/images/gal/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Park Central</a>
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                <div class="geodir-category-location fl-wrap"><a href="#"><i class="fas fa-map-marker-alt"></i> 40 JOURNAL SQUARE PLAZA, NJ, US</a></div>
                                                <span class="rooms-price">$80 <strong> /  Awg</strong></span>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="/images/gal/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Holiday Home</a>
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="3"></div>
                                                <div class="geodir-category-location fl-wrap"><a href="#"><i class="fas fa-map-marker-alt"></i> 75 PRINCE ST, NY, USA</a></div>
                                                <span class="rooms-price">$50 <strong> /   Awg</strong></span>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="/images/gal/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Moonlight Hotel</a>
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="4"></div>
                                                <div class="geodir-category-location fl-wrap"><a href="#"><i class="fas fa-map-marker-alt"></i>  70 BRIGHT ST NEW YORK, USA</a></div>
                                                <span class="rooms-price">$105 <strong> /  Awg</strong></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- wishlist-wrap end--> 
                    </div>
                </div>
                <!-- header-inner end-->
                <!-- header-search -->
                <div class="header-search vis-search">
                    <div class="container">
                        <div class="row">
                            <!-- header-search-input-item -->
                            <div class="col-sm-10">
                                <div class="header-search-input-item fl-wrap location autocomplete-container">
                                    <label>location search</label>
                                    <span class="header-search-input-item-icon"><i class="fal fa-map-marker-alt"></i></span>
                                    <input type="text" placeholder="장소를 입력하세요." class="autocomplete-input" id="autocompleteid" value=""/>
                                    <a href="#"><i class="fal fa-dot-circle"></i></a>
                                </div>
                            </div>
                            <!-- header-search-input-item end -->
                            <!-- header-search-input-item -->
<!--                             <div class="col-sm-3">
                                <div class="header-search-input-item fl-wrap date-parent">
                                    <label>Date In-Out </label>
                                    <span class="header-search-input-item-icon"><i class="fal fa-calendar-check"></i></span>
                                    <input type="text" placeholder="When" name="header-search"   value=""/>
                                </div>
                            </div> -->
                            <!-- header-search-input-item end -->                             
                            <!-- header-search-input-item -->
                  <!--           <div class="col-sm-3">
                                <div class="header-search-input-item fl-wrap">
                                    <div class="quantity-item">
                                        <label>Rooms</label>
                                        <div class="quantity">
                                            <input type="number" min="1" max="3" step="1" value="1">
                                        </div>
                                    </div>
                                    <div class="quantity-item">
                                        <label>Adults</label>
                                        <div class="quantity">
                                            <input type="number" min="1" max="3" step="1" value="1">
                                        </div>
                                    </div>
                                    <div class="quantity-item">
                                        <label>Children</label>
                                        <div class="quantity">
                                            <input type="number" min="0" max="3" step="1" value="0">
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- header-search-input-item end -->                             
                            <!-- header-search-input-item -->
                            <div class="col-sm-2">
                                <div class="header-search-input-item fl-wrap">
                                    <button class="header-search-button" onclick="window.location.href='listing.html'">Search <i class="far fa-search"></i></button>
                                </div>
                            </div>
                            <!-- header-search-input-item end -->                                                          
                        </div>
                    </div>
                    <div class="close-header-search"><i class="fal fa-angle-double-up"></i></div>
                </div>
                <!-- header-search  end -->
            </header>
            <!-- 클릭이벤트 js -정건일 -->
	<script src="/js/layout/click_evt.js"></script>
</body>
</html>
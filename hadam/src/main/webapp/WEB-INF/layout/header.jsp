<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="KO">
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>ha:dam </title>
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
        <!--=============== favicons ===============-->
        <link rel="shortcut icon" href="/images/favicon.ico">
	    <!-- 원하는 아이콘을 가져다가 쓰세요 https://fontawesome.com/search -정건일--> 
		<script src="https://kit.fontawesome.com/b2960bc7d5.js" crossorigin="anonymous"></script>	
	
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
                        <a href="/schedule/schedulepage" class="add-hotel">스케즐 추가하기<span><i class="far fa-plus"></i></span></a>                     
                        <!-- 로그인 상태 확인 후 헤더 변경 [최성익] -->
                        <c:if test="${sessionScope.memberNickname == null}">
                        	<div class="show-reg-form modal-open"><i class="fa fa-sign-in"></i>로그인</div>
                        </c:if>
                        <c:if test="${sessionScope.memberNickname != null}">
                        <!-- <div class="show-reg-form signout" id='signout' ><i class="fa fa-sign-in"></i>로그아웃</div> -->
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
	                        <i class="fal fa-bell" style=" position: relative;z-index: 1;"></i>
                        <span class="fa-regular fa-circle" id="alarmCountPointer" style="margin-top: 26px;font-size:10px;right:+36px;position: absolute; z-index: 0;"></span>
	                        <!-- <span class="wl_counter">3알림갯수로 들어오는 데이터 그냥 빨간불빛으로 전환할 예정입니다.</span> -->
                                        <!--second level -->
                                        <ul class="alram-user-menu">
                                        <li id="nonealram">
                                        <a class ="nonealram">새로운 알림이 없습니다.</a>
                                        </li>
                                        <!-- 알림 메세지가 출력될 공간 -->
                                       </ul>
                        </div>
                		<!--1.12 알림표시 자리입니다.  -정건일-->
                		                        
                        <!--1.12 채팅창아이콘 자리입니다. -정건일-->
                        <div class="alarm-link" id="chatlist" onclick="getChatRoomList()">
                        <i class="fa-regular fa-comment-dots"></i>
                        </div>
                		<!--1.12 채팅창아이콘 자리입니다. -정건일-->
             

                		<!--1.11 마이페이지 토글버튼 입니다. -정건일-->
                        
                        <div class="header-user-menu">
                            <div class="header-user-name">
                                <span><img src="/images/profile/${sessionScope.memberUploadImageName}.jpg" onerror="this.onerror=null; this.src='/images/gal/no_image2.jpg';"></span>
                              	${sessionScope.memberNickname}
                            </div>
                        
                            <ul>
                                <li><a href="/mypage/mypagePreference"> 개인정보수정 </a></li>
                                <li><a href="/mypage/mypageFavorites"> 찜 장소 </a></li>
                                <li><a href="/mypage/mypageEntryResponse">  동행신청  </a></li>
                                <li><a href="/mypage/mypageSchedule">  내 스케줄  </a></li>
                                <li><a href="/mypage/mypageBoard"> 내 게시글 </a></li>
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
                                        <!-- <a href="#">A.I스케줄<i class="fas "></i></a> -->
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
                                        <a href="/schedule/schedulepage">스케줄만들기 <i class="fas "></i></a>
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
                                            <li><a href="/community/scheduleShareList/1">스케줄공유 게시판</a></li>
                                        </ul>
                                        <!--second level end-->
                                    </li>
                                    <li>
                                        <a href="/location/locationList">장소찾기 <i class="fas "></i></a>
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
	                        <form action="/searchLoc" method="get">
	                            <!-- header-search-input-item -->
	                            <div class="col-sm-10">
	                                <div class="header-search-input-item fl-wrap location autocomplete-container">
	                                    <label>location search</label>
	                                    <span class="header-search-input-item-icon"><i class="fal fa-map-marker-alt"></i></span>
	                                    <input type="text" name="locKeyword" placeholder="장소를 입력하세요." class="autocomplete-input" id="autocompleteid" value=""/>
	                                </div>
	                            </div>
	                            <div class="col-sm-2">
	                                <div class="header-search-input-item fl-wrap">
	                                    <button class="header-search-button" type="submit">Search </button>
	                                </div>
	                            </div>
	                        </form>
                        </div>
                    </div>
                    <div class="close-header-search"><i class="fal fa-angle-double-up"></i></div>
                </div>
                <input type="hidden" id="hidden_session_idxvalue" value="${sessionScope.memberIndex}"/>
                <input type="hidden" id="hidden_session_nicknamevalue" value="${sessionScope.memberNickname}"/>
                <input type="hidden" id="hidden_session_memberUploadImageNamevalue" value="${sessionScope.memberUploadImageName}"/>
                <!-- header-search  end -->
                <!-- 채팅방 모달창 입니다. -정건일 -->
                
	                  <div class="chattinglistmodal" id="chatRoomList">채팅창
			            
	                 
	                </div>
	                <div class="chattingmodalplace">
	         
	                </div>  
				<!-- end of 채팅방 모달창 입니다. -정건일 -->
				
				
				
			
            </header>
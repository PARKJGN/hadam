<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
     <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
     	<head>
     	<link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
     	<link type="text/css" rel="stylesheet" href="/css/board/scheduleShareList.css">
     	</head>
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!--  section  -->
                    <section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">
                                <div class="section-title-separator"><span></span></div>
                                <h2><span>스케줄 공유 게시판</span></h2>
                                <span class="section-separator"></span>
                                <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec tincidunt arcu, sit amet fermentum sem.</h4>
                            </div>
                             
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec1" class="custom-scroll-link color-bg"><i class="fal fa-angle-double-down"></i></a></div>
                        </div>
                    </section>
                    <!--  section  end-->
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container" id="moveTab">
                            <div class="breadcrumbs fl-wrap"><a href="#">커뮤니티</a><span>스케줄 공유 게시판</span></div>
                        </div>
                    </div>
                    <!--section -->
                    <section class="grey-blue-bg small-padding" id="sec1">
                      
                        <div class="container">
                        
                            <div class="row">
                                <!--listing -->
                                <div class="col-md-12">
                                    <div class="mobile-list-controls fl-wrap mar-bot-cont">
                                        <div class="mlc show-list-wrap-search fl-wrap"><i class="fal fa-filter"></i> Filter</div>
                                    </div>
                                    
                                    <!--col-list-wrap -->
                                    <div class="col-list-wrap fw-col-list-wrap">
                                        <!-- list-main-wrap-->
                                        <div class="list-main-wrap fl-wrap card-listing" id="box">
                                         
                                            <!-- list-main-wrap-opt-->
                                            <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                
                                                <!-- price-opt-->
                                                 <a class="btn btn-primary" href="#" role="button" id="shareBtn">스케줄 공유하기</a> 
                                                <!-- price-opt end-->                               
                                            </div>
                                            <!-- list-main-wrap-opt end-->
                                            <!-- listing-item-container -->
                                            
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox">
                                                <!-- listing-item  -->
                                                 
                                            
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                           
                                                           
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                           
                                                            
                                                        </div>
                                                    </article>
                                                </div>
 												<div class="arrowBox">
 													<div class="arrow"></div>
 													
												</div>
												<div class="timeTaken" >
													<p>소요시간</p>
 													<p class="whatTime">몇분</p>
 												</div>
                                                <!-- listing-item end -->
                                                <!-- listing-item  -->
                                               
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                           
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                    </article>
                                                </div>
												
 												<div class="arrowBox">
 													<div class="arrow"></div>
												</div>
												<div class="timeTaken" >
													<p>소요시간</p>
 													<p class="whatTime">몇분</p>
 												</div>
                                                <!-- listing-item end -->                                                  
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                    </article>
                                                </div>
 											
 												<div class="arrowBox">
 													<div class="arrow"></div>
												</div>
												<div class="timeTaken" >
													<p>소요시간</p>
 													<p class="whatTime">몇분</p>
 												</div>
                                                <!-- listing-item end -->                           
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                         
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    </article>
                                                </div>
   												
   												<div class="arrowBox">
 													<div class="arrow"></div>
												</div>
												<div class="timeTaken" >
													<p>소요시간</p>
 													<p class="whatTime">몇분</p>
 												</div>
                                                <!-- listing-item end --> 
                                                <!-- listing-item  -->
                                                 <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    </article>
                                                </div>
                                                
                                       <!-- listing-item end -->
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="information">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        
                                                        <div class="geodir-category-content fl-wrap title-sin_item"  id ="timeBox"style="border:solid 1px; border-radius:10px; border-color:lightblue">
                                                         
                                                                <div class="geodir-category-content-title-item" >
                                                                    <h3 class="title-sin_map">스케줄일정: 12/25 ~ 12/25</h3>
                                                                    <h3 class="title-sin_map">예상소요시간: 12:00 ~ 18:00</h3>
                                                              
                                                                </div>
                                                      
                                                          
                                                        </div>
                                                    </article>
                                                </div>
                                                
                                              
                                             
                                                
                                            </div>

                                            </div>
                                            <div class="pagination">
                                                <a href="#" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                                <a href="#" >1</a>
                                                <a href="#" class="current-page">2</a>
                                                <a href="#">3</a>
                                                <a href="#">4</a>
                                                <a href="#" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                        </div>
                                        
                                        <!-- list-main-wrap end-->
                                    </div>
                                    <!--col-list-wrap end -->
                                </div>
                                <!--listing  end-->
                            </div>
                            <!--row end-->
                        </div>
                    </section>
                    <!--section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
           <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
           <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
           <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
            
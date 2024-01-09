<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
    <!-- 자유게시판 커뮤니티 페이지 -->
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            	<style>
            		.reviews-comments-item {
            			padding:0 0 30px 0px;
            		}
            		#page {
            			margin-left:330px;
            		}
            		#box {
            			margin-left:-50px;
            		}
            	</style>
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- section-->
                    <section class="flat-header color-bg adm-header">
                        <div class="wave-bg wave-bg2"></div>
                        <div class="container">
                            <div class="dasboard-wrap fl-wrap">
                                <div class="dasboard-breadcrumbs breadcrumbs"><a href="#">Home</a><a href="#">Dashboard</a><span>Profile page</span></div>
                                <!--dasboard-sidebar-->
                                
                                <!--dasboard-sidebar end--> 
                                <!-- dasboard-menu-->
                                <div class="dasboard-menu">
                                    <div class="dasboard-menu-btn color3-bg">Dashboard Menu <i class="fal fa-bars"></i></div>
                                    <ul class="dasboard-menu-wrap">
                                        
                                        <li><a href="dashboard-review.html" class="user-profile-act"><i class="far fa-comments"></i> 자유게시판 </a></li>
                                    </ul>
                                </div>
                                <!--dasboard-menu end-->
                                <!--Tariff Plan menu-->
                                <div   class="tfp-btn"><span>Tariff Plan : </span> <strong>Extended</strong></div>
                                <div class="tfp-det">
                                    <p>You Are on <a href="#">Extended</a> . Use link bellow to view details or upgrade. </p>
                                    <a href="#" class="tfp-det-btn color2-bg">Details</a>
                                </div>
                                <!--Tariff Plan menu end-->
                            </div>
                        </div>
                    </section>
                    <!-- section end-->
                    <!-- section-->
                    <section class="middle-padding">
              <button type="button" class="btn btn-outline-primary" style=margin-left:1100px;>글 작성</button>
                        <div class="container">
         
                            <!--dasboard-wrap-->
                            <div class="dasboard-wrap fl-wrap">
                                        
                                <!-- dashboard-content--> 
                                <div class="dashboard-content fl-wrap">
                                    <div class="dashboard-list-box fl-wrap" id="box">
                                     	
                                       
                                        <!--자유게시판 컬럼명  -->
                                             <div class="dashboard-header fl-wrap">
                                                   <table>
                                               <tr>
                                         	<th width="100"><h3 style=text-align:center>글 번호</h3></th>
                                         	<th width="430"><h3 style=text-align:center>글 제목</h3></th>
                                         	<th width="230"><h3 style=text-align:center>작성자</h3></th>
                                         	<th width="180"><h3 style=text-align:center>작성일</h3></th>
                                         	<th width="80"><h3 style=text-align:center>조회수</h3></th>
                                         </tr>
                                         </table>
                                              </div>
                                   		
                                 
                                     
                                        <div class="reviews-comments-wrap">
                                            <!-- reviews-comments-item -->  
                                            <div class="reviews-comments-item">
                                               
                                          
                                                <!-- 자유게시판 목록출력 -->
                                        	<table>
                                      
                                                	<tr>
                                                	<td width="100">1</td>
                                                    <td width=430 style=text-align:center>안녕하세요asdsaasad</td>
                                             		<td width=230>asdassasadda</td>
                                                    <td width=180><i class="far fa-calendar-check"></i>12 April 2018</td>
                                                    <td width=80 style=text-align:center>0</td>
                                                    </tr>
                                                    </table>
                                        
                                            </div>
                                            
                                            <!--reviews-comments-item end--> 
                                            <!-- reviews-comments-item -->  
                           <!--                  <div class="reviews-comments-item">
                                                <div class="review-comments-avatar">
                                                    <img src="../images/avatar/1.jpg" alt=""> 
                                                </div>
                                               
                                                <div class="reviews-comments-item-text">
                                                  <div class="review-score-user">
                                                        <span>4.7</span>
                                                        <strong>Very Good</strong>
                                                    </div>
                                                    <h4><a href="#">Adam Koncy</a> on <a href="listing-single.html" class="reviews-comments-item-link">Premium Plaza Hotel </a></h4>
                                                   
                                                    <div class="clearfix"></div>
                                                    <p>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. "</p>
                                                    <div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>03 December 2017</span><a href="#"><i class="fal fa-reply"></i> Reply</a></div>
                                                </div>
                                            </div>
                                            reviews-comments-item end  
                                            reviews-comments-item  
                                            <div class="reviews-comments-item">
                                                <div class="review-comments-avatar">
                                                    <img src="../images/avatar/1.jpg" alt=""> 
                                                </div>
                                                <div class="reviews-comments-item-text">
                                                    <h4><a href="#">Liza Rose </a>on  <a href="listing-single.html" class="reviews-comments-item-link">Park Central </a></h4>
                                                    <div class="review-score-user">
                                                        <span>4.4</span>
                                                        <strong>Good</strong>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <p>" Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. "</p>
                                                    <div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>12 April 2018</span><a href="#"><i class="fal fa-reply"></i> Reply</a></div>
                                                </div>
                                            </div>
                                            reviews-comments-item end 
                                            reviews-comments-item  
                                            <div class="reviews-comments-item">
                                                <div class="review-comments-avatar">
                                                    <img src="../images/avatar/1.jpg" alt=""> 
                                                </div>
                                                <div class="reviews-comments-item-text">
                                                    <h4><a href="#">Adam Koncy</a> on  <a href="listing-single.html" class="reviews-comments-item-link">Grand Hero Palace </a></h4>
                                                    <div class="review-score-user">
                                                        <span>4.7</span>
                                                        <strong>Very Good</strong>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <p>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. "</p>
                                                    <div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>03 December 2017</span><a href="#"><i class="fal fa-reply"></i> Reply</a></div>
                                                </div>
                                            </div> -->
                                            <!--reviews-comments-item end-->                                                                                                                    
                                        </div>
                                      
                                    </div>
                            
                                    <!-- pagination-->
                                    <div class="pagination" id="page">
                                        <a href="#" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <a href="#">1</a>
                                        <a href="#" class="current-page">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
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
             
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
            
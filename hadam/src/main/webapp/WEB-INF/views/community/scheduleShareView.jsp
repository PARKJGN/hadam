<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            <link type="text/css" rel="stylesheet" href="/css/board/scheduleShareView.css">
            
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                
                 <section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="/images/board/park.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">
                                
                                <h2><span>스케줄 상세</span></h2>
                                <span class="section-separator"></span>
                                <h4>hadam</h4>
                            </div>
                             
                        </div>
                     
                    </section>
                    <!-- map-view-wrap --> 
                    <div class="map-view-wrap">
                        <div class="container">
                           
                        </div>
                    </div>
                    <!--map-view-wrap end --> 
                    <!-- Map -->
                  
                    <!-- Map end --> 
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="/community/scheduleShareList">커뮤니티</a><a href="/community/scheduleShareList">스케줄 공유 게시판</a><span>스케줄 상세</span></div>
                        </div>
                    </div>
         

                  
                                        <!-- list-main-wrap-->
                                        <div class="list-main-wrap fl-wrap card-listing" id="box">
                                         
                                            <!-- list-main-wrap-opt-->
                                            
                                                <div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                <div class="post-author" id="userInfo"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>사용자명</span></a></div> <!--회원 별명-->
                                                <!-- price-opt-->
                                                <div class="shareBtnBox">
                                                 <a class="btn btn-primary" href="#" role="button" id="shareBtn">스케줄 참가하기</a> 
                                               </div> <!-- price-opt end-->                               
                                     
                                          
                                            
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox">
                                                <!-- listing-item  -->
                                                 
                                            
                                                <div class="listing-item" id="listItem">
                                                
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px;">
                                                        <div class="geodir-category-img listImg" >
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                           
                                                           
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                           
                                                            
                                                        </div>
                                                    </article>
                                                    <div class="arrowBox">
 													<div class="arrow"></div>
 													<div class="timeTaken" >
													
 													<p >몇분</p>
 												</div>
												</div>
                                                </div>
 												
												
                                                <!-- listing-item end -->
                                                <!-- listing-item  -->
                                               
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px;">
                                                        <div class="geodir-category-img listImg">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                           
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                            
                                                        </div>
                                                    </article>
                                                    <div class="arrowBox">
 													<div class="arrow"></div>
 													<div class="timeTaken" >
											
 													<p >몇분</p>
 												</div>
												</div>
                                                </div>
												
 												
												
                                                <!-- listing-item end -->                                                  
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px;">
                                                        <div class="geodir-category-img listImg">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                           
                                                        </div>
                                                    </article>
                                                    <div class="arrowBox">
 													<div class="arrow"></div>
 													<div class="timeTaken" >
											
 													<p >몇분</p>
 												</div>
												</div>
                                                </div>
 											
 												
												
                                                <!-- listing-item end -->                           
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px;">
                                                        <div class="geodir-category-img listImg">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                         
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item" >
                                                                    <h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    </article>
                                                    <div class="arrowBox">
 													<div class="arrow"></div>
 													<div class="timeTaken" >
												
 													<p >몇분</p>
 												</div>
												</div>
                                                </div>
   												
   												
												
                                                <!-- listing-item end --> 
                                                <!-- listing-item  -->
                                                 <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px;">
                                                        <div class="geodir-category-img listImg">
                                                            <a href="listing-single.html"><img src="../images/gal/1.jpg" alt=""></a>
                                                            
                                                            
                                                            <div class="geodir-category-opt">
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item" >
                                                                    <h3 class="title-sin_map" style="white-space:nowrap; margin-left:-10px;">12:00 ~ 13:00</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>장소명</a></div>
                                                                </div>
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    </article>
                                                </div>
                                                
                                       <!-- listing-item end -->
                                                <!-- listing-item  -->
                                                <div class="listing-item" id="information">
                                                    <article class="geodir-category-listing fl-wrap" >
                                                        
                                                        <div class="geodir-category-content fl-wrap title-sin_item"  id ="timeBox"style="border:solid 1px; border-radius:10px; border-color:lightblue">
                                                         
                                                                <div class="geodir-category-content-title-item" >
                                                                    <h3 class="title-sin_map">스케줄일정: 12/25 ~ 12/25</h3>
                                                                    <h3 class="title-sin_map">예상소요시간: 12:00 ~ 18:00</h3>
                                                              
                                                                </div>
                                                      
                                                          
                                                        </div>
                                                    </article>
                                                </div>
                                                
                                              
                                             
                                                
                                            </div>
									 <div class="list-single-main-item fl-wrap" id="writeForm">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>글 내용</h3>
                                        </div>
                                        <div id="contact-form">
                                            <div id="message"></div>
                                            <form  class="custom-form" action="php/contact.php" name="contactform" id="contactform">
                                             
                                                	
                                                	
                                                   
                                                    
                                                    
                                                    <p>내용</p>
                               
                                                	
                                                
                                         
                                                <!-- <button class="btn float-btn color2-bg" style="margin-top:15px;" id="submit">Send Message<i class="fal fa-angle-right"></i></button> -->
                                            	 
 												
 												 
                                            </form>
                                        </div>
                                        <!-- contact form  end--> 
                                    </div>
                            
                  
           
                        <div class="list-single-main-item fl-wrap" id="replyBox">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3> 댓글  <span> 댓글 개수 </span></h3>
                                                </div>
                                                <div class="reviews-comments-wrap">
                                                    <div class="review-comments-avatar" id="replyImage">
                                                            <img src="../images/avatar/1.jpg" alt=""> 
                                                        </div>
                                                    <div class="reviews-comments-item" id="replyinnerBox">
                                                       
                                                        <div class="reviews-comments-item-text" id="chatBox">
                                                            <h4 style=font-size:13px;><a href="#">작성자</a></h4>
                                                            
                                                            <p style=font-size:11px;>댓글 내용</p>
                                                            <div class="reviews-comments-item-date" id="replydateBox"><span><i class="far fa-calendar-check"></i>작성일</span> </div>
                                                       		<div class="dangerBox">
                                                       		<button type="button" id="danger"class="btn btn-danger" >신고</button>
          													</div>
                                                        </div>
                                                    </div>
                                                                                                                
                                                </div>
                                            </div>
                        <div class="list-single-main-item fl-wrap" id="replyWriteBox">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>댓글 등록</h3>
                                                </div>
                                                <!-- Add Review Box -->
                                                <div id="add-review" class="add-review-box">
                                                    <!-- Review Comment -->
                                                    <form id="add-comment" class="add-comment  custom-form" name="rangeCalc" >
                                                        <fieldset>
                                                            <div class="row">
                                                                <!-- <div class="col-md-6">
                                                                    <label><i class="fal fa-user"></i></label>
                                                                    <input type="text" placeholder="Your Name *" value=""/>
                                                                </div> -->
                                                                <div class="col-md-6">
                                                                    <!-- <label><i class="fal fa-envelope"></i>  </label>
                                                                    <input type="text" placeholder="Email Address*" value=""/> -->
                                                                </div>
                                                            </div>
                                                            <textarea cols="40" rows="3" id="COMMENT_CONTENT" name="COMMENT_CONTENT" placeholder="댓글을 입력해주세요"></textarea>
                                                        </fieldset>
                                                        <div class="commentBtn">
                                                       <button class="btn btn-primary" id="comment"type="submit">등록</button>
                                                    	</div>
                                                    </form>
                                                </div>
                                                <!-- Add Review Box / End -->
                                            </div>
                                            <div class="pagination" id="page">
                                            </div>
                                            </div>
                                           
                                        <!-- list-main-wrap end-->
                    

                      
                                
                           
                                   
                        <div class="section-decor"></div>
        

                    <!-- section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            
            <style>
            	#box{
            		margin-left:300px;
            	}
            	
            	#updateBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
            	}
            	
            	#backBtn {
            		width:60px;
            		height:25px;
            		font-size:14px;            
            		text-align : center;
	 				padding : 0 0;
            	}
            	#listBox {
     				 display: flex;
                     justify-content: space-between;
                     background-color: white;
            		 border-radius: 10px;
            		 height:320px;
            		 box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);   
            		 position:relative;
            		 right:-200px;
     			}
     			#listItem {
     				margin-right:30px;
     				width: 280px;
     				position:relative;
     				bottom:-40px;
     				right:-30px;
     			}
     			#box {
     				width:1600px;
     				position:relative;
     				right:-100px;
     			}
     			#information {
     				position: relative;
     				bottom:-130px;
     				width:300px;
     			}
     			#shareBtn {
     				width:120px;
            		height:25px;
            		font-size:14px;     
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 				bottom:-10px;
	 				right:-930px;
	 				
     			}
     			
     			.pagination {
     				position:relative;
     				right:-550px;
     			}
     			
				.arrowBox {
				  display: flex;
				  justify-content: center;
				  align-items: center;
				  height: 50vh;
				  margin: 0;
				}

				.arrow {
				  width: 0;
				  height: 0;
				  border-top: 10px solid transparent;
				  border-bottom: 10px solid transparent;
				  border-left: 20px solid lightblue; /* 화살표의 색상을 여기서 조정하세요 */
				  position:relative;
				  right:-25px;
				  top:-50px;
				}

				.timeTaken {
					position:relative; 
					bottom:-200px; 
					white-space: nowrap;
					
				}
				
				.whatTime {
					position:relative;
					top:-30px;
				}
				
				#scheduleTitle {
					position:relative;
					bottom:-20px;
					right:-200px;
				}
				
				#timeBox h3{
					font-size:13px;
					white-space: nowrap;
				}
				
				#moveTab {
				 position:relative;
				 left:-90px;
				}
				
				#writeForm{
					width:1600px;
					position:relative;
					top:-200px;
					left:-1014px;
				}
				
				#replyBox{
					width: 1600px;
					position:relative;
					top: -500px;
					right:-600px;
					height:250px;
				}
				
				#replyBox h4 {
					position:relative;
					top:-20px;
				}
				
				#replyBox p {
					position:relative;
					left:-40px;
				}
				
				#replyinnerBox {
					width:1650px;
					position:relative;
					left:-100px;
				}
				#replyinnerBox span {
					position:relative;
					top:-100px;
				}
				
				#danger{
            		width:50px;
            		height:20px;
            		font-size:12px;
            		margin-left:610px;
            		text-align : center;
	 				padding : 0 0;
	 				position:relative;
	 			
	 				right:-420px;
	 				top:-70px;
            	}
            	
            	#replydateBox {
            		position:relative;
            		bottom:-50px;
            	}
            	
            	#replyWriteBox {
            		width:1600px;
            		position:relative;
            		right:-600px;
            		top:-500px;
            		height:220px;
            	}
            	
            	#COMMENT_CONTENT {
            		height:80px;
            	}
            	
            	#comment {
          			height:30px;
            		position:relative;
            		top:-210px;
            		right:-900px;
            		font-size:14px;
            	}
            	
            	#chatBox {
            		position:relative;
            		top:-50px;
            		height:100px;
            	}
            	
            	
            </style>
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
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
                            <div class="breadcrumbs fl-wrap"><a href="#">Home</a><a href="#">Pages</a><span>Contacts</span></div>
                        </div>
                    </div>
                    <section  id="sec1" class="grey-b lue-bg middle-padding">
                    	<div class="col-list-wrap fw-col-list-wrap">
                                        <!-- list-main-wrap-->
                                        <div class="list-main-wrap fl-wrap card-listing" id="box">
                                         
                                            <!-- list-main-wrap-opt-->
                                            <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="scheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                
                                                <!-- price-opt-->
                                                 <a class="btn btn-primary" href="#" role="button" id="shareBtn">참가 신청하기</a> 
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
                                           
                                        <!-- list-main-wrap end-->
                                    </div>
                                     <div class="list-single-main-item fl-wrap" id="replyWriteBox">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>제목</h3>
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
                                                            <input type="text" cols="40" rows="3" id="COMMENT_CONTENT" name="COMMENT_CONTENT" placeholder="댓글을 입력해주세요"></input>
                                                        </fieldset>
                                                       
                                                    </form>
                                                </div>
                                                <!-- Add Review Box / End -->
                                            </div>
                        <div class="section-decor"></div>
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-8">
                                    <div class="list-single-main-item fl-wrap" id="writeForm">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>글 내용</h3>
                                        </div>
                                        <div id="contact-form">
                                            <div id="message"></div>
                                            <form  class="custom-form" action="php/contact.php" name="contactform" id="contactform">
                                                <fieldset>
                                                	
                                                	
                                                    <div class="clearfix"></div>
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="BOARD_CONTENT"  id="BOARD_CONTENT" cols="40" rows="3" placeholder="Your Message:" required></textarea>
                               
                                                	
                                                
                                                </fieldset>
                                                <!-- <button class="btn float-btn color2-bg" style="margin-top:15px;" id="submit">Send Message<i class="fal fa-angle-right"></i></button> -->
                                            	 
 												
 												 
                                            </form>
                                        </div>
                                        <!-- contact form  end--> 
                                    </div>
                                </div>
                            </div>
                        </div>
                       <button class="btn btn-primary" id="comment"type="submit">등록</button>
                       
                    </section>
                    <!-- section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
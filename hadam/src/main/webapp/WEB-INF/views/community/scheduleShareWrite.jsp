<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/board/scheduleShareWrite.css">
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
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                                            <!-- list-main-wrap-opt end-->
                                            <!-- listing-item-container -->
                                            
                                      

                                            </div>
                                           
                                            <div class="list-single-main-item fl-wrap" id="writeBox">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>스케줄 게시글 작성</h3>
                                        </div>
                                        <div id="asd">
                                            <form  class="custom-form" action="scheduleSave"  id="contactform" method="post" >
                                      			
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
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="boardTitle" id="boardTitle" placeholder="Your Title *" required/><!-- 게시글 제목 작성 -->                                              	
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="boardContent"  id="boardContent" cols="40" rows="3" placeholder="Your Message:" required></textarea><!-- 내용 작성 -->
                               
                                                	<!-- <input type="file" name="files" class="form-control" aria-label="file example" multiple >파일 첨부
                                                	<div class="invalid-feasdedback">.jpg만 선택해 주세요</div>    -->                                                                                            
                                         			
                                         			
                                         			
                                         			
    												<input type="submit" class="btn btn-primary" id="comment" value="작성" />
				 
                                            </form>
                                            <a class="btn btn-primary" href="/community/scheduleShareList" role="button" id="backBtn">취소</a> <!-- 자유게시판목록으로 이동-->
                                        	 
                                        </div>
                                         <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="shareBtn">
          									스케줄 불러오기
       									 </button>
                                    </div>
                                           
                                           
                                           
                                           
                                           
                                        <!-- list-main-wrap end-->
                                    </div>
                              
             
                       
                    </section>
                    <!-- section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
              
            
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             <div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen modal-dialog-centered">
                <div class="modal-content asdf">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">내 스케줄</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="modalScheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                      
                      <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="modalListBox">
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
                      
                      <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="modalScheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                      
                      <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="modalListBox">
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
                      
                      <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="modalScheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                      
                      <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="modalListBox">
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
                      
                      
                      <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="modalScheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                      
                      <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="modalListBox">
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
                                            
                                            
                                            <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title" id="modalScheduleTitle">
                                                    <h2>Schedule : <span> 스케줄명 </span></h2>
                                                </div>
                                                

                                                <!-- price-opt end-->                               
                                            </div>
                      
                      <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="modalListBox">
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                    </div>
                </div>
            </div>
        </div>



 




			<script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>

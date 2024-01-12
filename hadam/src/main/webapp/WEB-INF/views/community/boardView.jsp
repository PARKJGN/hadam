<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <!--  wrapper  -->
            <head>
     
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <!-- <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css"> -->
            
            <style>
            	#danger{
            		width:50px;
            		height:20px;
            		font-size:12px;
            		margin-left:610px;
            		text-align : center;
	 				padding : 0 0;
            	}
            	#comment{
            		width:50px;
            		height:20px;
            		font-size:13px;
            		margin-left:730px;
            		text-align : center;
	 				padding : 0 0;
            	
            	}
            	#box {
            		margin-left:400px;
            	}
            	#boardlistpage {
            		margin-left:150px;
            		font-size:13px;
            		width:120px;
            		height:30px;
            	}
            	
            	#writepage {
            		width:70px;
            		height:20px;
            		font-size:14px;
            		margin-left:780px;
            		text-align : center;
	 				padding : 0 0;
            	}
            </style>
            
            
            
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!--  section  -->
                    <section class="color-bg middle-padding ">
                        <div class="wave-bg wave-bg2"></div>
                        <div class="container">
                            <div class="flat-title-wrap">
                                <h2><span>자유 게시판</span></h2>
                                <span class="section-separator"></span>
                                <h4>hadam</h4>
                            </div>
                        </div>
                    </section>
                    <!--  section  end-->
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="#">커뮤니티</a><a href="#">자유게시판</a><span>자유게시판 상세보기</span></div>
                        </div>
                    </div>
                    <!-- section-->
           
                    <section  id="sec1" class="middle-padding grey-blue-bg">
                    	
                        <div class="container">
                            <div class="row">
                                <!--blog content -->
                                <div class="col-md-8">
                                    <!--post-container -->
                                    <div class="post-container fl-wrap" id="box">
                                        <!-- article> -->
                                      
                                                    <h3>글 제목</h3>
                                                    <a class="btn btn-primary" href="#" role="button" id="writepage">글 작성</a>
                         
                                        <article class="post-article">
                                       		
                                            <div class="list-single-main-media fl-wrap">
                                                <div class="single-slider-wrapper fl-wrap">
                                                    <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="../images/all/1.jpg" alt=""></div>
                                                       
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                            <div class="list-single-main-item fl-wrap">
                                                
                                                <p>
                                                    
                                                </p>
                                                <p>글 내용</p>
                                                
                                                <div class="post-author"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>사용자 ID</span></a></div>
                                                <div class="post-opt">
                                                    <ul>
                                                        <li><i class="fal fa-calendar"></i> <span>작성일</span></li>
                                                        <li><i class="fal fa-calendar"></i> <span>수정일</span></li>
                                                        <li><i class="fal fa-eye"></i> <span>조회수</span></li>
                                                        
                                                    </ul>
                                                </div>
                                               
                                            </div>
                                            <!-- list-single-main-item -->   
                                            <div class="list-single-main-item fl-wrap" id="sec5">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3> 댓글  <span> 댓글 개수 </span></h3>
                                                </div>
                                                <div class="reviews-comments-wrap">
                                                    <!-- reviews-comments-item -->  
                                                    <div class="reviews-comments-item">
                                                        <div class="review-comments-avatar">
                                                            <img src="../images/avatar/1.jpg" alt=""> 
                                                        </div>
                                                        <div class="reviews-comments-item-text">
                                                            <h4><a href="#">작성자</a></h4>
                                                            <div class="clearfix"></div>
                                                            <p>댓글 내용</p>
                                                            <div class="reviews-comments-item-date"><span><i class="far fa-calendar-check"></i>작성일</span><a href="#"><i class="fal fa-reply"></i> Reply</a> </div>
                                                       		<button type="button" id="danger"class="btn btn-danger">신고</button>
                                                       		<!-- <button type="button" class="btn btn-danger">Danger</button> -->
                                                        </div>
                                                    </div>
                                                                                                                  
                                                </div>
                                            </div>
                                            <!-- list-single-main-item end -->   
                                            <!-- list-single-main-item -->   
                                            <div class="list-single-main-item fl-wrap" id="sec6">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>댓글 등록</h3>
                                                </div>
                                                <!-- Add Review Box -->
                                                <div id="add-review" class="add-review-box">
                                                    <!-- Review Comment -->
                                                    <form id="add-comment" class="add-comment  custom-form" name="rangeCalc" >
                                                        <fieldset>
                                                            
                                                            <textarea cols="40" rows="3" id="COMMENT_CONTENT" name="COMMENT_CONTENT" placeholder="댓글을 입력해주세요"></textarea>
                                                        </fieldset>
                                                       <button class="btn btn-primary" id="comment"type="submit">등록</button>
                                                    </form>
                                                </div>
                                                <!-- Add Review Box / End -->
                                            </div>
                                            <!-- list-single-main-item end -->                                             
                                        </article>
                                        <!-- article end -->                                
                                    </div>
                                    <!--post-container end -->  
                                </div>
                                <!-- blog content end -->
                                <!--   sidebar  -->
                          
                                <!--   sidebar end  -->
                            </div>
                        </div>
                        <div class="limit-box fl-wrap"></div>
                           <a class="btn btn-primary" href="#" role="button" id="boardlistpage">자유게시판으로</a>
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
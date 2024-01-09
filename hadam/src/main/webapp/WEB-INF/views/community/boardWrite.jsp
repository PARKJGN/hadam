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
                        <div class="container">
                            <div class="row">
                                
                                <div class="col-md-8">
                                    <div class="list-single-main-item fl-wrap" id="box">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>게시글 작성</h3>
                                        </div>
                                        <div id="contact-form">
                                            <div id="message"></div>
                                            <form  class="custom-form" action="php/contact.php" name="contactform" id="contactform">
                                                <fieldset>
                                                	
                                                	<label for="validationCustom01" class="form-label">제목</label>
                                                    <input type="text" name="BOARD_TITLE" id="BOARD_TITLE" placeholder="Your Title *" value="" required/>
                                                	
                                                	<label for="validationCustom02" class="form-label">작성자</label>                                               
                                                    <input type="text" name="name" id="name" placeholder="Your Name *" value="" required/>
                                                    <div class="clearfix"></div>
                                                    
                                                    <label for="validationTextarea" class="form-label">글 내용</label>
                                                    <textarea name="BOARD_CONTENT"  id="BOARD_CONTENT" cols="40" rows="3" placeholder="Your Message:" required></textarea>
                               
                                                	<input type="file" class="form-control" aria-label="file example" required>
                                                	<div class="invalid-feedback">선택된 파일이 없습니다.</div>
                                                
                                                </fieldset>
                                                <!-- <button class="btn float-btn color2-bg" style="margin-top:15px;" id="submit">Send Message<i class="fal fa-angle-right"></i></button> -->
                                            	 <div class="col-12">
    												<button class="btn btn-primary" type="submit">등록</button>
    												 <a class="btn btn-primary" href="#" role="button">취소</a>
 												 </div>
 												
 												 
                                            </form>
                                        </div>
                                        <!-- contact form  end--> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section-decor"></div>
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
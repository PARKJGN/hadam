<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypageProfile
	페이지명	비밀번호 변경 페이지
	작성자 	최성익  
-->

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <jsp:include page="/WEB-INF/views/mypage/mypagemenu.jsp"></jsp:include>
                    <!-- section-->
                    <section class="middle-padding">
                        <div class="container">
                            <!--dasboard-wrap-->
                            <div class="dasboard-wrap fl-wrap">
                                <!-- dashboard-content--> 
                                <div class="dashboard-content fl-wrap">
                                    <div class="box-widget-item-header">
                                        <h3> 프로필 수정 </h3>
                                    </div>
                                    <!-- profile-edit-container--> 
                                    <div class="profile-edit-container">
                                        <div class="custom-form">
                                            <label>Nick name<i class="far fa-user"></i></label>
                                            <input type="text" placeholder="Jessie Manrty" />
                                            <label>Phone<i class="far fa-phone"></i>  </label>
                                            <input type="text" placeholder="+7(123)987654" value=""/>
                                            <div class="row">
                                                <div class="col-sm-9">
                                                    <label> Notes</label>                                              
                                                    <textarea cols="40" rows="3" placeholder="About Me"></textarea>                                                    
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Change Avatar</label> 
                                                    <div class="add-list-media-wrap">
															<form class="fuzone">
																<div class="fu-text">
																	<span><i class="far fa-cloud-upload-alt"></i> Click here or drop files to upload</span>
																	<div class="photoUpload-files fl-wrap"></div>
																</div>
																<input type="file" class="upload">
															</form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- profile-edit-container end--> 
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
<!--footer end -->         
            
            
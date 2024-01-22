<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypagePassword
	페이지명	비밀번호 변경 페이지
	작성자 	최성익  
-->

<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->
 
<c:if test="${msg != null}">
    <div id="msg" hidden><%= request.getAttribute("msg") %></div>
</c:if>
 
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
                                        <h3>비밀번호 변경</h3>
                                    </div>
                                    <form action="/mypage/passwordChange" method="post">
                                    <div class="custom-form no-icons">
                                        <div class="pass-input-wrap fl-wrap">
                                            <label>현재 비밀번호</label>
                                            <input type="password" class="pass-input" placeholder="" value="" name="password"/>
                                            <span class="eye"><i class="far fa-eye" aria-hidden="true"></i> </span>
                                        </div>
                                        <div class="pass-input-wrap fl-wrap">
                                            <label>새 비밀번호</label>
                                            <input type="password" class="pass-input" placeholder="" value="" name="newPassword"/>
                                            <span class="eye"><i class="far fa-eye" aria-hidden="true"></i> </span>
                                        </div>
                                        <div class="pass-input-wrap fl-wrap">
                                            <label>새 비밀번호 확인</label>
                                            <input type="password" class="pass-input" placeholder="" value=""/>
                                            <span class="eye"><i class="far fa-eye" aria-hidden="true"></i> </span>
                                        </div>
                                        <button class="btn  big-btn  color2-bg flat-btn float-btn">Save Changes<i class="fal fa-save"></i></button>
                                    </form>
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
<!--footer end -->

<!--=============== 개인 js  ===============-->
<script type="text/javascript" src="/js/mypage/mypage.js"></script>

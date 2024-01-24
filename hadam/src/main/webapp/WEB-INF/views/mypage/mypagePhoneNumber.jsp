<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	mypagePhoneNumber
	페이지명	전화번호 변경 페이지
	작성자 	최성익  
-->

<!-- 개인 css -->
<link type="text/css" rel="stylesheet" href="/css/mypage/mypagePhoneNumber.css">

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
                	<!-- mypage header 추가 -->
                    <jsp:include page="/WEB-INF/views/mypage/mypageHeader.jsp"></jsp:include>
                    <!-- section-->
                    <section class="middle-padding">
                        <div class="container">
                            <!--dasboard-wrap-->
                            <div class="dasboard-wrap fl-wrap">
                                <!-- dashboard-content--> 
                                <div class="dashboard-content fl-wrap">
                                    <div class="box-widget-item-header">
                                        <h3>전화번호 변경</h3>
                                    </div>
                                   <form action="/mypage/phoneNumberChange" method="post">
                                    <div class="custom-form no-icons">
                                        <div class="pass-input-wrap fl-wrap">
                                            <label>전화번호 </label>
                                            <input type="number" id="member_phone" class="mypage phoneinput" placeholder="${memberPhoneNumber}" name="phoneNumber" />
											<input type="button" id="member_phone_check" class="mypage phonecheck" value="인증하기" >
                                        </div>
                                    </div>
                                   
                                    <div class="custom-form no-icons">
                                        <div class="pass-input-wrap fl-wrap">
                                            <label>인증번호 <span id="check_phone_count"></span></label>
                                            <input type="text" id="member_phone_checknum" class="mypage phonecheckinput" placeholder=""/>
											<input type="button" id="btn_member_phone_checknum" class="mypage phonechecknum" value="확인" >
                                        </div>
                                        <button class="btn  big-btn  color2-bg flat-btn float-btn disa" id="btn_phonenumber_change_completion">완료하기<i class="fal fa-save"></i></button>
                                    </div>
                                    </form>
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
<script type="text/javascript" src="/js/mypage/mypagePhoneNumber.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="KO">
<!-- header -->
<jsp:include page="/WEB-INF/layout/adminHeader.jsp"></jsp:include>
<!-- header of end -->
<!-- sidebar -->
<jsp:include page="/WEB-INF/layout/adminSidebar.jsp"></jsp:include>
<!-- sidebar of end -->

        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title"> 계정 관리 </h2>
                                <div class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">
                    	<div class="table-responsive">
	                        <table class="table">
	                            <thead class="bg-light">
	                                <tr class="border-0">
	                                    <th class="border-0">No</th>
	                                    <th class="border-0">관리자여부</th>
	                                    <th class="border-0">닉네임</th>
	                                    <th class="border-0">아이디</th>
	                                    <th class="border-0">가입일</th>
	                                    <th class="border-0">작성스케줄 수</th>
	                                    <th class="border-0">작성글 수</th>
	                                    <th class="border-0">신고여부</th>
	                                    <th class="border-0">상태</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                            	<c:forEach var="member" items="${memberList}">
	                                	<tr>
		                                    <td>${member.memberIndex}</td>
		                                    <td>${member.adminStatus}</td>
		                                    <td>${member.memberNickname}</td>
		                                    <td>${member.memberId}</td>
		                                    <td>${member.memberRegisteDate}</td>
		                                    <td></td>
		                                    <td></td>
		                                    <td></td>
		                                    <!-- <td>스케줄수 받아오기${member.memberIndex}</td>
		                                    <td>작성글 수 받아오기${member.memberIndex}</td> 
		                                    <td>신고여부 boolean 받아오기${member.memberIndex}</td>-->
	                                    	<td>
	                                    	<c:if test="${member.memberStatus == '정상' }">
	                                    	<span class="badge-dot badge-success mr-1"></span>
	                                    	</c:if>
	                                    	<c:if test="${member.memberStatus == '정지' }">
	                                    	<span class="badge-dot badge-brand mr-1"></span>
	                                    	</c:if>
	                                    	<c:if test="${member.memberStatus == '탈퇴' }">
	                                    	<span class="badge-dot badge-danger mr-1"></span>
	                                    	</c:if>
	                                    	${member.memberStatus}
	                                    	</td>
		                                    
		                                </tr>
	                            	</c:forEach>
	                            </tbody>
	                        </table>
                    	</div>
                    </div>
                </div>
            </div>

<!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->

<div class="modal" id="accountModal"> 					
<div class="member_wrap">
	    <div id="menu_wrap" class="bg_white">
	    	<div>asdasd</div>
	    	<div>asdasd</div>
	    	<div>asdasd</div>
	        <div class="option">
            	<select>
            		<option>정상</option>
            		<option>정지</option>
            	</select>
	        </div>
	    </div>
	    <div id="memberInfo">
	    	<table class="table">
	            <thead class="bg-light">
	                <tr class="border-0">
	                    <th class="border-0">No</th>
	                    <th class="border-0">관리자여부</th>
	                    <th class="border-0">닉네임</th>
	                    <th class="border-0">상태</th>
	                </tr>
	            </thead>
	            
	            <tbody>
	            <c:forEach var="member" items="${memberList}">
	                <c:if test="${member.memberId eq clickedMemberId}">
	                    <tr>
	                        <td>${member.memberIndex}</td>
	                        <td>${member.adminStatus}</td>
	                        <td>${member.memberNickname}</td>
	                        <td>${member.memberStatus}</td>
	                    </tr>
	                </c:if>
            	</c:forEach>
	            </tbody>
	        </table>
	    </div>
	</div>
       <button  class="btn-two green rounded" id="closeModalBtn">창 닫기</button>
  </div>
     <div class="modal-overlay" id="modaloverlay"></div>



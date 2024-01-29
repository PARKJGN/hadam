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
<link type="text/css" rel="stylesheet" href="/css/admin/admins.css">

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
	                                    <th class="border-0">작성댓글 수</th>
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
		                                    <td><a class="accountModal" value="${member.memberId}">${member.memberId}</a></td>
		                                    <td>${member.memberRegisteDate}</td>
		                                    <td>${member.scheduleCnt}</td>
		                                    <td>${member.boardCnt}</td>
		                                    <td>${member.commentCnt}</td> 
		                                    <!-- <td>신고여부 boolean 받아오기</td> -->
		                                    <td></td>
	                                    	<td>
	                                    	<c:choose>
	                                    		<c:when test="${member.memberStatus == '정상' }"><span class="badge-dot badge-success mr-1"></span></c:when>
	                                    		<c:when test="${member.memberStatus == '정지' }"><span class="badge-dot badge-brand mr-1"></span></c:when>
	                                    		<c:when test="${member.memberStatus == '탈퇴' }"><span class="badge-dot badge-danger mr-1"></span></c:when>
	                                    	</c:choose>
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

<!-- 모달 창 -->
<div id="accountModal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 class="memInfo"></h2>
    <form>
      <label for="nickname">닉네임:</label>
      <input type="text" name="nickname" id="nickname" readonly>

      <label for="id">아이디:</label>
      <input type="text" name="id" id="id" readonly>

      <label for="phone">전화번호:</label>
      <input type="text" name="phone" id="phone" readonly>
      
      <label for="adminStatus">관리자여부:</label>
      <input type="text" name="adminStatus" id="adminStatus" readonly>
      
      <label for="memberStatus">회원상태:</label>
      <input type="text" name="memberStatus" id="memberStatus" readonly>
    </form>
  </div>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->
<script src="/js/admin/admins.js"></script>

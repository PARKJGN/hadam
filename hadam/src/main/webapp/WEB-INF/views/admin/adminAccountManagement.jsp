<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		                                    <td>
	                                    	<fmt:formatDate value="${member.memberRegisteDate}" pattern="yyyy/MM/dd" />
	                                    	</td>
		                                    <td>${member.memberScheduleCnt}</td>
		                                    <td>${member.memberBoardCnt}</td>
		                                    <td>${member.memberCommentCnt}</td> 
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
	<div class="accountModal-header">
		<span class="close">&times;</span>
    	<h2 class="memInfo"></h2><button class="modifyAccountBtn">수정하기</button>
	</div>
	<div class="modal-content">	
   		<form>
		    <label for="accountNickname">닉네임:</label>
		    <input type="text" id="accountNickname" readonly>
		
		    <label for="accountId">아이디:</label>
		    <input type="text" id="accountId" readonly>
		
		    <label for="accountPhone">전화번호:</label>
		    <input type="text" id="accountPhone" readonly>
		    
		    <label for="accountAdminStatus">관리자여부:</label>
		    <input type="text" id="accountAdminStatus" readonly>
		    
		    <label for="accountStatus">회원상태:</label>
		    <input type="text" id="accountStatus" readonly>
   		</form>
	</div>
</div>

<!-- 수정 모달창 -->
<div id="modifyModal">
	<div class="accountModal-header">
		<span class="close">&times;</span>
    	<h2 class="memInfo"></h2><button class="modifyComBtn">수정완료</button> <button class="cancelBtn">취소</button>
	</div>
	<div class="modifyModal-content">	
   		<form>
		    <label for="modifyAccountNickname">닉네임:</label>
		    <input type="text" id="modifyAccountNickname" placeholder="${member.memberNickname }">
		
		    <label for="modifyAccountAdminStatus">관리자여부:</label>
		    <select id="modifyAccountAdminStatus" required>
		    	<option value="" selected disabled hidden>선택</option>
		    	<option value="0">회원</option>
		    	<option value="1">관리자</option>
		    </select>
		    <label for="modifyAccountStatus">회원상태:</label>
		    <select id="modifyAccountStatus" required>
		    	<option value="" selected disabled hidden>선택</option>
		    	<option value="정상">정상</option>
		    	<option value="정지">정지</option>
		    </select>
   		</form>
	</div>
</div>

<!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->
<script src="/js/admin/admins.js"></script>

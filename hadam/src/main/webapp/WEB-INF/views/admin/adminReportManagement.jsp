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
                                <h2 class="pageheader-title"> 신고 관리 </h2>
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
	                                    <th class="border-0">댓글번호</th>
	                                    <th class="border-0">신고된 댓글 내용</th>
	                                    <th class="border-0">신고대상자</th>
	                                    <th class="border-0">신고자</th>
	                                    <th class="border-0">신고일자</th>
	                                    <th class="border-0">신고처리상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach var="report" items="${reportList }">
	                                <tr>
	                                    <td>${report.boardCommentReportId }</td>
	                                    <td>${report.commentId }</td>
	                                    <td>${report.commentContent }</td>
	                                    <td>${report.reportedMember }</td>
	                                    <td>${report.boardCommentReporter }</td>
	                                    <td>
	                                    <fmt:formatDate value="${report.boardCommentReportRegisteDate }" pattern="yyyy/MM/dd" />
	                                    </td>
	                                    <c:choose>
	                                    	<c:when test="${report.boardCommentReportStatus != 0 }">
	                                    		<td><span class="badge-dot badge-success mr-1"></span><button class="suspendBtn" value="${report.commentId }">정지</button></td>
	                                    	</c:when>
	                                    	<c:when test="${report.boardCommentReportStatus == 0 }">
	                                    		<td><span class="badge-dot badge-brand mr-1"></span><button class="releaseBtn" value="${report.commentId }">해제</button></td>
	                                    	</c:when>
	                                    </c:choose>
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
<script src="/js/admin/admins.js"></script>
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
                                <h2 class="pageheader-title"> 게시판 관리 </h2>
                                <div class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                    	<li class="breadcrumb-item active" aria-current="page">스케줄공유게시판</li>
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
	                                    <th class="border-0">제목</th>
	                                    <th class="border-0">작성자</th>
	                                    <th class="border-0">조회수</th>
	                                    <th class="border-0">작성일</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach var="scheduleTable" items="${scheduleTableList}">
		                                <tr>
		                                    <td>${scheduleTable.scheduleTableId }</td>
		                                    <td>${scheduleTable.scheduleTableName }</td>
		                                    <td>${scheduleTable.memberNickname }</td>
		                                    <td>${scheduleTable.boardViews }</td>
		                                    <td>${scheduleTable.scheduleTableRegisteDate }</td>
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
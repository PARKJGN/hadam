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
                                <h2 class="pageheader-title"> Dashboard </h2>
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
                    
                    	<div class="row">
                            <!-- ============================================================== -->
                            <!-- sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-20 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                    	<div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                            <i class="fa fa-users fa-fw fa-sm text-primary"></i>
                                        </div>
                                        <h5 class="text-muted">총 회원 수</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${dashboard.memberCnt }</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end sales  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- new customer  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-20 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                   		<div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
                                            <i class="fa fa-user-plus fa-fw fa-sm text-primary"></i>
                                        </div>
                                        <h5 class="text-muted">오늘 회원가입 수</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${dashboard.todayMemberCnt }</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end new customer  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- visitor  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-20 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                    	<div class="float-right icon-circle-medium  icon-box-lg  bg-success-light mt-1">
                                            <i class="fa fa-clipboard-list fa-fw fa-sm text-primary"></i>
                                        </div>
                                        <h5 class="text-muted">총 스케줄 수</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${dashboard.scheduleCnt }</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end visitor  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- total orders  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-20 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                    	<div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
                                            <i class="fa fa-edit fa-fw fa-sm text-primary"></i>
                                        </div>
                                        <h5 class="text-muted">오늘 생성된 게시글</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${dashboard.todayBoardCnt }</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-20 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                    	<div class="float-right icon-circle-medium  icon-box-lg  bg-danger-light mt-1">
                                            <i class="fa fa-exclamation-circle fa-fw fa-sm text-primary"></i>
                                        </div>
                                        <h5 class="text-muted">오늘 신고된 건수</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${dashboard.todayReportCnt }</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end total orders  -->
                            <!-- ============================================================== -->
                            
                        </div>
                        <div class="row">
                        	
                        	<!-- ============================================================== -->
              				<!-- product category  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                		<h5 class="mb-0">성비 통계</h5>
                                	</div>
                                    <div class="card-body" style="height:400px">
                                    	<canvas id="sexChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- ============================================================== -->
                            <!-- end product category  -->
                            <!-- ============================================================== -->
                        	
                        	
                        	<!-- ============================================================== -->
                            <!-- category revenue  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                		<h5 class="mb-0">스케줄별 선호 카테고리</h5>
                                	</div>
                                    <div class="card-body" style="height:400px">
                                    	<canvas id="cateChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end category revenue  -->
                            <!-- ============================================================== -->
                            
                        </div>
                        <div class="row">
                        	<!-- ============================================================== -->
                            <!-- recent orders  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-12 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                    <a href="/admin/adminReportManagement" class="btn btn-outline-light float-right" style="padding: 0px 7px">상세 보기</a>
                                        <h5 class="mb-0"> 미확인 신고건</h5>
                                    </div>
                                    <div class="card-body p-0" style="height:400px">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">No</th>
					                                    <th class="border-0">댓글번호</th>
					                                    <th class="border-0">신고대상자</th>
					                                    <th class="border-0">신고자</th>
					                                    <th class="border-0">신고일자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
					                            	<c:forEach var="uReport" items="${uReportList }">
					                                <tr>
					                                    <td>${uReport.boardCommentReportId }</td>
					                                    <td>${uReport.commentId }</td>
					                                    <td>${uReport.reportedMember }</td>
					                                    <td>${uReport.reporterMember }</td>
					                                    <td>
					                                    <fmt:formatDate value="${uReport.boardCommentReportRegisteDate }" pattern="yyyy/MM/dd" />
					                                    </td>
					                                </tr>
					                                </c:forEach>
					                            </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end recent orders  -->
                            <!-- ============================================================== -->
                            
                            <!-- ============================================================== -->
                            <!-- product sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"> 생성된 게시글</h5>
                                    </div>
                                    <div class="card-body" style="height:400px">
                                    	<canvas id="boardChart" ></canvas>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end product sales  -->
                            <!-- ============================================================== -->
                            
                        </div>
                    </div>
                </div>
            </div>
<!-- footer -->
<jsp:include page="/WEB-INF/layout/adminFooter.jsp"></jsp:include>
<!-- footer of end -->
<script src="/js/admin/admins.js"></script>
<script src="/js/charts.js"></script>
<!-- 차트 날짜형식 변경 위해 추가 -->
<script src="https://cdn.jsdelivr.net/npm/moment/moment.min.js"></script>
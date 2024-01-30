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
	                                    <th class="border-0">사진</th>
	                                    <th class="border-0">장소명</th>
	                                    <th class="border-0">장소 주소</th>
	                                    <th class="border-0">별점</th>
	                                    <th class="border-0">리뷰수</th>
	                                    <th class="border-0">소분류</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach var="location" items="${locationList }">
		                                <tr>
		                                    <td>${location.locationId }</td>
		                                    <td><img src="${pageContext.request.contextPath}/images/location/${location.locationImageOriginalname}"
		                                    	onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></td>
		                                    <td>${location.locationName }</td>
		                                    <td>${location.locationPlace }</td>
		                                    <td>${location.locationRating }</td>
		                                    <td>${location.locationReviewCount }</td>
		                                    <td>${location.smallCategory }</td>
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
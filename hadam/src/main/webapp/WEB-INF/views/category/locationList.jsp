<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<!-- header-->
           <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
           <link type="text/css" rel="stylesheet" href="/css/category/categories.css">
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container">
                            <div class="breadcrumbs fl-wrap"><a href="#">메인 페이지</a><span>분류 페이지</span></div>
                        </div>
                    </div>
                    <!--section -->
                    <section class="grey-blue-bg small-padding" id="sec1">
                        <div class="container">
                            <div class="row">
                                <!--listing -->
                                <div class="col-md-12">
                                    <!-- 카테고리별 목록 -->
                                    <div class="list-wrap-search lisfw fl-wrap">
                                        <div class="container">
                                            <div class="row">
                                                <!-- col-list-search-input-item -->
                                                <div style="text-align:left;">
                                                	<div>
                                                        <label>먹기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList?middleCategory=한식">한식</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=중식">중식</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=양식">양식</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=일식">일식</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=패스트푸드">패스트푸드</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=세계음식">세계음식</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>마시기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList?middleCategory=카페">카페</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=주류">주류</a>&nbsp;                                                        	
                                                    </div>
                                                    <div>
                                                        <label>놀기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList?middleCategory=이색">이색</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=실내활동">실내활동</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=실외활동">실외활동</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>보기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList?middleCategory=영화">영화</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=전시">전시</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=공연">공연</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=책방">책방</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>걷기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList?middleCategory=시장">시장</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=공원">공원</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=산책">산책</a>&nbsp;
                                                        	<a href="categoryLocList?middleCategory=명소">명소</a>&nbsp;
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--카테고리별 목록 end -->              
                                    <!--col-list-wrap -->
                                    <div class="col-list-wrap fw-col-list-wrap">
                                        <!-- list-main-wrap-->
                                        <div class="list-main-wrap fl-wrap card-listing">
                                            <!-- list-main-wrap-opt-->
                                            <div class="list-main-wrap-opt fl-wrap">
                                                <div class="list-main-wrap-title fl-wrap col-title">
                                                    <h2>검색 결과</h2>
                                                </div>
                                                <!-- 검색 결과 필터-->
                                                <div class="price-opt">
                                                    <span class="price-opt-title">정렬순 :</span>
                                                    <div class="listsearch-input-item">
                                                        <select data-placeholder="Popularity" class="chosen-select no-search-select" >
                                                            <option>최신순</option>
                                                            <option>인기순</option>
                                                            <option>별점순</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- 검색 결과 필터 end-->
                                                <!-- 목록 정렬 방법 -->
                                                <div class="grid-opt">
                                                    <ul>
                                                        <li><span class="two-col-grid act-grid-opt"><i class="fas fa-th-large"></i></span></li>
                                                        <li><span class="one-col-grid"><i class="fas fa-bars"></i></span></li>
                                                    </ul>
                                                </div>
                                                <!-- 목록 정렬 방법 end-->                               
                                            </div>
                                            <!-- list-main-wrap-opt end-->                                           

                                            <!-- 검색 결과 목록 container -->
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid">
                                            	             
                                                <!-- 검색 결과 목록  -->
                                                <c:forEach var="location" items="${locationList}">
	                                                <div class="listing-item">
	                                                    <article class="geodir-category-listing fl-wrap">
	                                                        <div class="catedir-category-img">	                                                        	
	                                                            <a href="locationDetail?locationId=${location.locationId }">
	                                                            <!-- 이미지 경로 찾아서 출력, 이미지 없을 시 디폴트 이미지도 설정 -->
	                                                            <img src="${pageContext.request.contextPath}/locationImages/${location.locationImageName}" 
	                                                            onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/1.jpg'"></a>
	                                                            <div class="geodir-category-opt">
	                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="${location.locationRating }"></div>
	                                                                <div class="rate-class-name"> 
	                                                                    <span>${location.locationRating }</span>                                             
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                        <!-- 이미지 없애기 위해 기본 css 카피 후 categories.css 파일 생성해서 수정 -->
	                                                        <div class="catedir-category-content fl-wrap">
	                                                            <div class="catedir-category-content-title fl-wrap">
	                                                                <h3 class="title-sin_map"><a href="locationDetail?locationId=${location.locationId }">${location.locationName }</a></h3> 
	                                                            </div>
	                                                            	<p>${location.locationPlace }</p>                                                            
	                                                        </div>
	                                                    </article>
	                                                </div>
	                                            </c:forEach>
                                                <!-- 검색결과 목록 end -->                                     
                                            </div>
                                            <!-- 검색결과 목록 container end-->
                                            
                                            
                                            <!-- 페이지 설정 -->
                                            <div class="pagination" id="page">
		                                        <a href="locationList?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
		                                        <a href="locationList?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
		                                        <c:forEach items="${numList}" var="num">
		                                        <a href="locationList?page=${num}">${num}</a>
		                                       
		                                        </c:forEach>
		                                        <a href="locationList?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
		                                        <a href="locationList?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
		                                    </div>									                                          
                                            <!-- 페이지 설정 end-->                                           
											
                                        </div>
                                        <!-- list-main-wrap end-->
                                    </div>
                                    <!--col-list-wrap end -->
                                </div>
                                <!--listing  end-->
                            </div>
                            <!--row end-->
                        </div>
                    </section>
                    <!--section end -->
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
            <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>   
            <!--footer end -->
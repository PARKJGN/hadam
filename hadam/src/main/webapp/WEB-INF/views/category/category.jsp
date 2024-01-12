<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
                                                        	<a href="category?middleCategory=한식">한식</a>&nbsp;
                                                        	<a href="category?middleCategory=중식">중식</a>&nbsp;
                                                        	<a href="category?middleCategory=양식">양식</a>&nbsp;
                                                        	<a href="category?middleCategory=일식">일식</a>&nbsp;
                                                        	<a href="category?middleCategory=패스트푸드">패스트푸드</a>&nbsp;
                                                        	<a href="category?middleCategory=세계음식">세계음식</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>마시기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList">카페</a>&nbsp;
                                                        	<a href="categoryLocList">주류</a>&nbsp;                                                        	
                                                    </div>
                                                    <div>
                                                        <label>놀기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList">이색</a>&nbsp;
                                                        	<a href="categoryLocList">실내활동</a>&nbsp;
                                                        	<a href="categoryLocList">실외활동</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>보기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList">영화</a>&nbsp;
                                                        	<a href="categoryLocList">전시</a>&nbsp;
                                                        	<a href="categoryLocList">공연</a>&nbsp;
                                                        	<a href="categoryLocList">책방</a>&nbsp;
                                                    </div>
                                                    <div>
                                                        <label>걷기</label>&nbsp;&nbsp;
                                                        	<button>전체</button>&nbsp;&nbsp;
                                                        	<a href="categoryLocList">시장</a>&nbsp;
                                                        	<a href="categoryLocList">공원</a>&nbsp;
                                                        	<a href="categoryLocList">산책</a>&nbsp;
                                                        	<a href="categoryLocList">명소</a>&nbsp;
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
                                            
<!-- <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a> 이미지 띄우는 용 pageContext 어떻게 쓰는지 까먹을까봐 기록 -->

                                            <!-- 검색 결과 목록 container -->
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid">
                                            	             
                                                <!-- 검색 결과 목록  -->
                                                <c:forEach var="location" items="${locationList}">
	                                                <div class="listing-item">
	                                                    <article class="geodir-category-listing fl-wrap">
	                                                        <div class="geodir-category-img">
	                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
	                                                            <div class="geodir-category-opt">
	                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
	                                                                <div class="rate-class-name"> 
	                                                                    <span>${location.locationRating }</span>                                             
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                        <!-- 이미지 없애기 위해 기본 css 카피 후 categories.css 파일 생성해서 수정 -->
	                                                        <div class="catedir-category-content fl-wrap">
	                                                            <div class="catedir-category-content-title fl-wrap">
	                                                                <h3 class="title-sin_map"><a href="#">${location.locationName }</a></h3> 
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
											<%-- <div class="pagination" id="page">
                                        		<a href="category?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        		<a href="category?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        		<c:forEach items="${numList}" var="num">
                                        			<a href="category?page=${num}">${num}</a>
                                        		</c:forEach>
                                        		<a href="category?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                        		<a href="category?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                    		</div> --%>
                                    		<div class="pagination" id="page">
											    <c:if test="${currentPage > 1}">
											        <a href="category?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
											        <a href="category?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
											    </c:if>
											    <c:forEach items="${numList}" var="num">
											   		<c:if test="${num <= lastPage}">
											        	<c:choose>
											            	<c:when test="${num eq currentPage}">
											                	<a href="#" class="active">${num}</a>
											            	</c:when>
											            	<c:otherwise>
											                	<a href="category?page=${num}">${num}</a>
											            	</c:otherwise>
											        </c:choose>
											        </c:if>
											    </c:forEach>
											    <c:if test="${currentPage < lastPage}">
											        <a href="category?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
											        <a href="category?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
											    </c:if>
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
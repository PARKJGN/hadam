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
                            <div class="breadcrumbs fl-wrap"><a href="/">메인 페이지</a><span>장소 페이지</span></div>
                        </div>
                    </div>
                    <!--section -->
                    <section class="grey-blue-bg small-padding" id="sec1">
                        <div class="container">
                            <div class="row">
                                <!--listing -->
                                <div class="col-md-12">
                                    <!-- 카테고리별 목록 -->
                                    <div class="catelist-wrap-search">
	                                    <table>
	                                    	<colgroup>
	                                    		<col style="width:100px;">
	                                    		<col>
	                                    	</colgroup>
	                                    	<tbody>
	                                    		<tr>
	                                    			<th style="vertical-align: middle;">
	                                    				<span>먹기</span>
	                                    				<span>마시기</span>
	                                    				<span>놀기</span>
	                                    				<span>보기</span>
	                                    				<span>걷기</span>
	                                    			</th>
	                                    			<td>
	                                    				<div class="catelist-wrap-search lisfw fl-wrap">
						                                	<div class="catelist-cate">
					                                        	<a class="catelist-wrap-search lisfw a all" href="/location/categoryLocList?largeCategory=먹기">전체</a>&nbsp;&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=한식">한식</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=중식">중식</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=양식">양식</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=일식">일식</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=패스트푸드">패스트푸드</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=먹기&middleCategory=세계음식">세계음식</a>&nbsp;
						                                    </div>
						                                    <div class="catelist-cate">
					                                        	<a class="catelist-wrap-search lisfw a all" href="/location/categoryLocList?largeCategory=마시기">전체</a>&nbsp;&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=마시기&middleCategory=카페">카페</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=마시기&middleCategory=주류">주류</a>&nbsp;                                                        	
						                                    </div>
						                                    <div class="catelist-cate">
					                                        	<a class="catelist-wrap-search lisfw a all" href="/location/categoryLocList?largeCategory=놀기">전체</a>&nbsp;&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=놀기&middleCategory=이색">이색</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=놀기&middleCategory=실내활동">실내활동</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=놀기&middleCategory=실외활동">실외활동</a>&nbsp;
						                                    </div>
						                                    <div class="catelist-cate">
					                                        	<a class="catelist-wrap-search lisfw a all" href="/location/categoryLocList?largeCategory=보기">전체</a>&nbsp;&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=보기&middleCategory=영화">영화</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=보기&middleCategory=전시">전시</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=보기&middleCategory=공연">공연</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=보기&middleCategory=책방">책방</a>&nbsp;
						                                    </div>
						                                    <div class="catelist-cate">
					                                        	<a class="catelist-wrap-search lisfw a all" href="/location/categoryLocList?largeCategory=걷기">전체</a>&nbsp;&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=걷기&middleCategory=시장">시장</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=걷기&middleCategory=공원">공원</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=걷기&middleCategory=산책">산책</a>&nbsp;
					                                        	<a class="catelist-wrap-search lisfw a" href="/location/categoryLocList?largeCategory=걷기&middleCategory=명소">명소</a>&nbsp;
						                                    </div>
					                                    </div>
	                                    			</td>
	                                    		</tr>
	                                    	</tbody>
	                                    </table>
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
                                            </div>
                                            <!-- list-main-wrap-opt end-->
                                            <!-- 검색 결과 목록 container -->
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid">
                                            	             
                                                <!-- 검색 결과 목록  -->
                                                <c:forEach var="categoryLoc" items="${categoryLocList}">
	                                                <div class="listing-item">
	                                                    <article class="geodir-category-listing fl-wrap">
	                                                        <div class="geodir-category-img">		                                                        	
	                                                            <a href="/location/locationDetail?locationId=${categoryLoc.locationId }">
	                                                            <!-- 이미지 경로 찾아서 출력, 이미지 없을 시 디폴트 이미지도 설정 -->
	                                                            <img style="width:100%;  height:270px;" src="${pageContext.request.contextPath}/images/location/${categoryLoc.locationImageOriginalname}"
	                                                            onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/gal/no_image.jpg'"></a>
	                                                            <div class="geodir-category-opt">
	                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="${categoryLoc.locationRating }"></div>
	                                                                <div class="rate-class-name"> 
	                                                                    <span>${categoryLoc.locationRating }</span>                                             
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                        <!-- 이미지 없애기 위해 기본 css 카피 후 categories.css 파일 생성해서 수정 -->
	                                                        <div class="catedir-category-content fl-wrap">
	                                                            <div class="catedir-category-content-title fl-wrap">
	                                                                <h3 class="title-sin_map"><a href="/location/locationDetail?locationId=${categoryLoc.locationId }">${categoryLoc.locationName }</a></h3> 
	                                                            </div>
	                                                            	<p>${categoryLoc.locationPlace }</p>                                                            
	                                                        </div>
	                                                    </article>
	                                                </div>
	                                            </c:forEach>
                                                <!-- 검색결과 목록 end -->                                     
                                            </div>
                                            <!-- 검색결과 목록 container end-->
                                            
                                            <!-- 페이지 설정 -->
                                            <div class="pagination" id="page" >
                                            <c:choose>
                                            	<c:when test ="${middleCategory == null}">
                                            		<a href="/location/categoryLocList?largeCategory=${largeCategory }&page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                            		<a href="/location/categoryLocList?largeCategory=${largeCategory }&page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                            		<c:forEach items="${numList}" var="num">
		                                        		<a href="/location/categoryLocList?largeCategory=${largeCategory }&page=${num}">${num}</a>		                                       
		                                        	</c:forEach>
		                                        	<a href="/location/categoryLocList?largeCategory=${largeCategory }&page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
		                                        	<a href="/location/categoryLocList?largeCategory=${largeCategory }&page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<a href="/location/categoryLocList?largeCategory=${largeCategory }&middleCategory=${middleCategory }&page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
		                                        	<a href="/location/categoryLocList?largeCategory=${largeCategory }&middleCategory=${middleCategory }&page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                            		<c:forEach items="${numList}" var="num">
		                                        		<a href="/location/categoryLocList?largeCategory=${largeCategory }&middleCategory=${middleCategory }&page=${num}">${num}</a>		                                       
		                                        	</c:forEach>
		                                        	<a href="/location/categoryLocList?largeCategory=${largeCategory }&middleCategory=${middleCategory }&page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
		                                        	<a href="/location/categoryLocList?largeCategory=${largeCategory }&middleCategory=${middleCategory }&page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                            	</c:otherwise>
                                            </c:choose>                                        
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
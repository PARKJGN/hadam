<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<!-- header-->
           <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
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
                                                        	<a href="categoryLocList">중식</a>&nbsp;
                                                        	<a href="categoryLocList">양식</a>&nbsp;
                                                        	<a href="categoryLocList">일식</a>&nbsp;
                                                        	<a href="categoryLocList">패스트푸드</a>&nbsp;
                                                        	<a href="categoryLocList">세계음식</a>&nbsp;
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
                                            <!-- listing-item-container -->
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid">
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="sale-window">Sale 20%</div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong>Very Good</strong>27 Reviews </div>
                                                                    <span>5.0</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Premium Plaza Hotel</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 27th Brooklyn New York, USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p>Sed interdum metus at nisi tempor laoreet. Integer gravida orci a justo sodales.</p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-category-price">Awg/Night <span>$ 320</span></div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.72956781" data-newlongitude="-73.99726866"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end -->
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="listing-avatar"><a href="author-single.html"><img src="images/avatar/1.jpg" alt=""></a>
                                                                <span class="avatar-tooltip">Added By  <strong>Julie Cramp</strong></span>
                                                            </div>
                                                            <div class="sale-window big-sale">Sale 50%</div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="4"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong>Good</strong>12 Reviews </div>
                                                                    <span>4.2</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Grand Hero Palace</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> W 85th St, New York,  USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p> Morbi suscipit erat in diam bibendum rutrum in nisl. Aliquam et purus ante.</p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-opt-link">
                                                                    <div class="geodir-category-price">Awg/Night <span>$ 120</span></div>
                                                                </div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.76221766" data-newlongitude="-73.96511769"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end -->                                                  
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="listing-avatar"><a href="author-single.html"><img src="images/avatar/1.jpg" alt=""></a>
                                                                <span class="avatar-tooltip">Added By  <strong>Andy Moore</strong></span>
                                                            </div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong>Good</strong>6 Reviews </div>
                                                                    <span>4.7</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Park Central</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i>40 Journal Square Plaza, NJ,  USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p> Sed tempor iaculis massa faucibus feugiat. In fermentum facilisis massa.</p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-opt-link">
                                                                    <div class="geodir-category-price">Awg/Night <span>$ 80</span></div>
                                                                </div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.88496706" data-newlongitude="-73.88191222"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end -->                           
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="listing-avatar"><a href="author-single.html"><img src="images/avatar/1.jpg" alt=""></a>
                                                                <span class="avatar-tooltip">Added By  <strong>Mary Jones</strong></span>
                                                            </div>
                                                            <div class="sale-window">Sale 20%</div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="3"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong>Pleasant</strong>10 Reviews </div>
                                                                    <span>3.2</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Holiday Home</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 75 Prince St,  NY, USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p>  Mauris ac maximus neque. Nam in mauris quis libero sodales eleifend.</p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-opt-link">
                                                                    <div class="geodir-category-price">Awg/Night <span>$ 50</span></div>
                                                                </div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.72228267" data-newlongitude="-73.99246214"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end --> 
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="listing-avatar"><a href="author-single.html"><img src="images/avatar/1.jpg" alt=""></a>
                                                                <span class="avatar-tooltip">Added By  <strong>Fider Mamby</strong></span>
                                                            </div>
                                                            <div class="sale-window">Sale 10%</div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong>Very Good</strong>102 Reviews </div>
                                                                    <span>4.7</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Gold Plaza Hotel</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 34-42 Montgomery St , NY, USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec tincidunt arcu, sit amet . </p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-opt-link">
                                                                    <div class="geodir-category-price">Awg/Night <span>$ 210</span></div>
                                                                </div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.94982541" data-newlongitude="-73.84357452"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end -->
                                                <!-- listing-item  -->
                                                <div class="listing-item">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        <div class="geodir-category-img">
                                                            <a href="listing-single.html"><img src="${pageContext.request.contextPath}/images/gal/1.jpg" alt=""></a>
                                                            <div class="listing-avatar"><a href="author-single.html"><img src="images/avatar/1.jpg" alt=""></a>
                                                                <span class="avatar-tooltip">Added By  <strong>Alisa Noory</strong></span>
                                                            </div>
                                                            <div class="sale-window big-sale">Sale 70%</div>
                                                            <div class="geodir-category-opt">
                                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="4"></div>
                                                                <div class="rate-class-name">
                                                                    <div class="score"><strong> Good</strong>8 Reviews </div>
                                                                    <span>4.1</span>                                             
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map"><a href="listing-single.html">Moonlight Hotel</a></h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"><i class="fas fa-map-marker-alt"></i> 70 Bright St New York, USA</a></div>
                                                                </div>
                                                            </div>
                                                            <p> Class aptent taciti  Mauris ac maximus neque. Nam in mauris quis libero sodales eleifend.</p>
                                                            <ul class="facilities-list fl-wrap">
                                                                <li><i class="fal fa-wifi"></i><span>Free WiFi</span></li>
                                                                <li><i class="fal fa-parking"></i><span>Parking</span></li>
                                                                <li><i class="fal fa-smoking-ban"></i><span>Non-smoking Rooms</span></li>
                                                                <li><i class="fal fa-utensils"></i><span> Restaurant</span></li>
                                                            </ul>
                                                            <div class="geodir-category-footer fl-wrap">
                                                                <div class="geodir-opt-link">
                                                                    <div class="geodir-category-price">Awg/Night <span>$ 105</span></div>
                                                                </div>
                                                                <div class="geodir-opt-list">
                                                                    <a href="#" class="single-map-item" data-newlatitude="40.90261483" data-newlongitude="-74.15737152"><i class="fal fa-map-marker-alt"></i><span class="geodir-opt-tooltip">On the map</span></a>
                                                                    <a href="#" class="geodir-js-favorite"><i class="fal fa-heart"></i><span class="geodir-opt-tooltip">Save</span></a>
                                                                    <a href="#" class="geodir-js-booking"><i class="fal fa-exchange"></i><span class="geodir-opt-tooltip">Find Directions</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <!-- listing-item end -->                        
                                            </div>
                                            <!-- listing-item-container end-->
                                            <!-- pagination-->
                                            <div class="pagination">
                                                <a href="#" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                                <a href="#" >1</a>
                                                <a href="#" class="current-page">2</a>
                                                <a href="#">3</a>
                                                <a href="#">4</a>
                                                <a href="#" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                            </div>
                                            <!-- pagination end-->
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
            
            
            
<!-- 페이지 나눌 때 아이템 수 반환하는 함수 fn 사용하기 위한 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            
            <!-- 한 페이지에 표시할 아이템 수 -->
												<c:set var="itemsPerPage" value="12" />
												
												<!-- 전체 아이템 수 -->
												<c:set var="totalItems" value="${fn:length(locationList)}" />
												
												<!-- 전체 페이지 수 계산 -->
												<c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />
												
												<!-- 현재 페이지 번호, 기본값은 1 -->
												<c:param name="currentPage" value="${param.currentPage}" />
												<c:choose>
												    <c:when test="${empty currentPage}">
												        <c:set var="currentPage" value="1" />
												    </c:when>
												    <c:otherwise>
												        <c:set var="currentPage" value="${currentPage}" />
												    </c:otherwise>
												</c:choose>
												
												<!-- 현재 페이지의 시작 아이템 인덱스 계산 -->
												<c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" />
												
												<!-- 현재 페이지에 표시할 아이템만 추출 -->
												<c:set var="pagedList" value="${locationList.subList(startIndex, Math.min(startIndex + itemsPerPage, totalItems))}" />
                                            	
            
            <!-- 이전 페이지 링크 -->
											<c:url value="" var="prevPageUrl">
											    <c:param name="currentPage" value="${currentPage - 1}" />
											</c:url>
											<a href="${prevPageUrl}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                            <!-- 이전 페이지 링크 end -->
                                            
                                            <!-- 페이지 설정 -->
                                            <div class="pagination">
											    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
											        <c:url value="" var="pageUrl">
											            <c:param name="currentPage" value="${pageNumber}" />
											        </c:url>
											        <a href="${pageUrl}" class="${pageNumber == currentPage ? 'current-page' : ''}">${pageNumber}</a>
											    </c:forEach>
											</div>
                                            <!-- 페이지 설정 end-->
                                            
                                            <!-- 다음 페이지 링크 -->
											<c:url value="" var="nextPageUrl">
											    <c:param name="currentPage" value="${currentPage + 1}" />
											</c:url>
											<a href="${nextPageUrl}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
											<!-- 다음 페이지 링크 end -->
											
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
     <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
     	<head>
     	<link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
     	<link type="text/css" rel="stylesheet" href="/css/board/scheduleShareList.css">
     	</head>
            <!--  header end -->
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!--  section  -->
                    <section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="/images/board/park.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">
                                
                                <h2><span>스케줄 공유 게시판</span></h2>
                                <span class="section-separator"></span>
                                <h4>hadam</h4>
                            </div>
                             
                        </div>
                     
                    </section>
                    <!--  section  end-->
                    <div class="breadcrumbs-fs fl-wrap">
                        <div class="container" id="moveTab">
                            <div class="breadcrumbs fl-wrap"><a href="#">커뮤니티</a><span>스케줄 공유 게시판</span></div>
                              
                        </div>
                    </div>
                    
                                 
                                       
                                       <div class="list-main-wrap fl-wrap card-listing" id="box">
                                         <div class="shareBtnBox">
                                              <a class="btn btn-primary" href="/community/scheduleShareWrite" role="button" id="shareBtn">스케줄 공유하기</a>
                                 		 </div>
                                         
                               		
                                         <c:forEach items="${map}" var="map" varStatus="outerIndex">
                                         
                                                <div class="scheduleTitle" id="scheduleTitle">
                                                    <h5>Schedule : <span><a href="">${map.key.boardTitle} </a></span></h5>
                                                </div>
                                                                   
                                    	
                                            <div class="listing-item-container init-grid-items fl-wrap three-columns-grid" id="listBox">
                                      <c:forEach items="${map.value}" var="schedule" varStatus="innerIndex">
                                               
                                               	
                                               

                                                <div class="listing-item" id="listItem">
                                                    <article class="geodir-category-listing fl-wrap" style="width:120px">
                                                        <div class="geodir-category-img listImg" >
                                                            <a href=""><img src="/images/location/${schedule.locationName}.jpg" alt=""></a>
                                                                                                                    
                                                            <div class="geodir-category-opt">
                                                                               
                                                            </div>
                                                        </div>
                                                        <div class="geodir-category-content fl-wrap title-sin_item" style="height:90px;">
                                                            <div class="geodir-category-content-title fl-wrap">
                                                                <div class="geodir-category-content-title-item">
                                                                    <h3 class="title-sin_map">${schedule.scheduleStartTime}~${schedule.scheduleEndTime }</h3>
                                                                    <div class="geodir-category-location fl-wrap"><a href="#" class="map-item"  ><i class="fas fa-map-marker-alt" ></i>${schedule.locationName }</a></div>
                                                                </div>
                                                            </div>
                                                                                                                     
                                                        </div>
                                                    </article>
                                                <c:if test="${!innerIndex.last}">
                                                    <div class="arrowBox1">
 													<div class="arrow"></div>											 
												</div>
												</c:if>
                                                </div>

                                             
                                                
                                              
                                             
                                                      </c:forEach> 		
                                                      <div class="listing-item" id="information">
                                                    <article class="geodir-category-listing fl-wrap">
                                                        
                                                        <div class="geodir-category-content fl-wrap title-sin_item"  id ="timeBox"style="border:solid 1px; border-radius:10px; border-color:lightblue">
                                                         
                                                                <div class="geodir-category-content-title-item" >												 
                                                                    <h3 class="title-sin_map">
                                                                    
                                                                   
                                                                    <fmt:formatDate value="${map.key.scheduleTableRegisteDate}" pattern="yyyy/MM/dd" />~
                                                                     <fmt:formatDate value="${map.key.scheduleTableRegisteDate}" pattern="yyyy/MM/dd" />
                                                                    </h3>
                                                                   <h3>예상 소요시간: 5시간 </h3>
                                                              
                                                                </div>
                                                      
                                                          
                                                        </div>
                                                    </article>
                                                </div> 	
                                                
                                            </div>
                                  			<button type="button" class="btn btn-primary modalBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="openDetailModal(${map.key.boardId},${sessionScope.memberIndex})">상세보기</button>
                                          </c:forEach>
							
                                  <!-- 페이징 처리-->
                                    <div class="pagination" id="page">
                                    	<!-- 페이지 맨처음으로 이동 -->
                                        <a href="/community/scheduleShareList?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <!-- 전페이지로 이동 -->
                                        <a href="/community/scheduleShareList?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <!-- 페이지 리스트 3으로 설정하면 3개나옴 -->
                                        <c:forEach items="${numList}" var="num">
                                        <a href="/community/scheduleShareList?page=${num}">${num}</a>
                                       
                                        </c:forEach>
                                        <!-- 다음페이지 이동 -->
                                        <a href="/community/scheduleShareList?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                        <!-- 마지마페이지 이동 -->
                                        <a href="/community/scheduleShareList?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                    </div>
                                        
                             
                                    	    </div>
       
            
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
           <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
           
           <div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen ">
	
		<div class="modal-content asdf" style="height:1000px;">
		
			<div class="modal-header">
				
				<h1 class="modal-title fs-5" id="staticBackdropLabel">상세보기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
			<!-- 첫번째 모달창 가져오기 -->
			<div id="modalScheduleDetail"></div>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

			</div>
		</div>
	</div>
</div>

<!-- 스케줄 참가하기 모달창 -->
         <div class="modal " id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen ">
	
		<div class="modal-content asdf2" style="height:500px;">
		
			<div class="modal-header">
			
				<h1 class="modal-title fs-5" id="staticBackdropLabel">스케줄 참가신청</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<div id="scheduleAttend"></div>
			<div class="post-author" id="userInfo1"><a href="#"><img src="../images/avatar/1.jpg" alt=""><span>${sessionScope.memberNickname }</span></a></div>
			<form class="custom-form" action="scheduleAttendWrite" id="contactform" method="post">
			
			<!-- boardId, scheduleTableId, memberIndex 값 가져오기 -->
			<c:forEach items="${map}" var="map" varStatus="outerIndex">
			<input type="hidden" name="boardId" value="${map.key.boardId}"/>
			<input type="hidden" name="scheduleTableId" value="${map.key.scheduleTableId}"/>
			</c:forEach>
			<input type="hidden" name="memberIndex" value="${sessionScope.memberIndex }"/>
			
			<label for="validationTextarea" class="form-label">글 내용</label>
			<textarea name="entryApplicationContent" id="boardContent" cols="40" rows="3" placeholder="메시지를 입력해주세요" required></textarea>		
			<input type="submit" class="btn btn-primary" id="comment1" value="신청" data-bs-dismiss="modal" onclick="scheduleAttendWrite()"/>
			
			</form>
			</div>
			
		</div>
	</div>
</div>
           
           <script type="text/javascript" src="/js/board/scheduleShareList.js"></script>
           <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
          
            
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
    <!-- 자유게시판 커뮤니티 페이지 -->
            <!--  header end -->
            <!--  wrapper  -->
            <head>
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
            <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
            	<style>
            		.reviews-comments-item {
            			padding:0 0 30px 0px;
            		}
            		#page {
            			position:relative;
            			right:-300px;
            		}
            		#box {
            			
            			width:1400px;
            			position:relative;
            			left:-300px;
            			height:100px;
            		}
            		
            	
            		
            		#boardTap {
            			position:relative;
            			left:-300px;
            		}
            		#boardTh {
            			height:50px;
            			border-radius:10px;
            		}
            		
            		#boardTd td{
            			position:relative;
            			top:-20px;
            		}
            		
            		#writeButton {
            			text-align : center;
	 					padding : 0 0;
            			position:relative;
            			font-size:13px;
            			right:-500px;
            			width:60px;
            			height:20px;
            		}
            		#table {
            			position:relative;
            			left:-100px;
            		}
            	</style>
            </head>
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- section-->
                    <section class="flat-header color-bg adm-header">
                        <div class="wave-bg wave-bg2"></div>
                        <div class="container" id="full">
                            <div class="dasboard-wrap fl-wrap">
                                <div class="dasboard-breadcrumbs breadcrumbs"><a href="#">커뮤니티</a><span><a href="boardList">자유게시판</a></span></div>
                                <!--dasboard-sidebar-->
                                
                                <!--dasboard-sidebar end--> 
                                <!-- dasboard-menu-->
                                <div class="dasboard-menu">
                                    <div class="dasboard-menu-btn color3-bg">Dashboard Menu <i class="fal fa-bars"></i></div>
                                    <ul class="dasboard-menu-wrap" >
                                        
                                        <li><a href="dashboard-review.html" class="user-profile-act" id="boardTap"><i class="far fa-comments"></i> 자유게시판 </a></li>
                                    </ul>
                                </div>
                                <!--dasboard-menu end-->
                                <!--Tariff Plan menu-->
                                <div   class="tfp-btn"><span>Tariff Plan : </span> <strong>Extended</strong></div>
                                <div class="tfp-det">
                                    <p>You Are on <a href="#">Extended</a> . Use link bellow to view details or upgrade. </p>
                                    <a href="#" class="tfp-det-btn color2-bg">Details</a>
                                </div>
                                <!--Tariff Plan menu end-->
                            </div>
                        </div>
                    </section>
                    <!-- section end-->
                    <!-- section-->
                    <section class="middle-padding">
              <a class="btn btn-primary" href="boardWrite" role="button" id="writeButton">글 작성</a>
                        <div class="container">
         
                            <!--dasboard-wrap-->
                            <div class="dasboard-wrap fl-wrap">
                                        
                                <!-- dashboard-content--> 
                                <div class="dashboard-content fl-wrap">
                              
                                     <div id="table">
                                        <!--자유게시판 컬럼명  -->
                                       <div class="dashboard-header fl-wrap" id="boardTh">
                                          <table border="1">
                                               <tr>
                                         	<th width="200"><h3 style=text-align:center>글 번호</h3></th>
                                         	<th width="530"><h3 style=text-align:center>글 제목</h3></th>
                                         	<th width="330"><h3 style=text-align:center>작성자</h3></th>
                                         	<th width="280"><h3 style=text-align:center>작성일</h3></th>
                                         	<th width="180"><h3 style=text-align:center>조회수</h3></th>
                                         </tr>
                                         </table>
                                              </div>
                                   		
                                 
                                  
                                        <div class="reviews-comments-wrap" id="boardTd">
                                            
                                          
                                               <c:forEach items="${boardList}" var="board">
                                          
                                           <!-- 자유게시판 목록출력 -->
                                        	<table border="1">
                                      			
                                                	<tr>
                                                	<td width="200">${board.boardId} </td>
                                                    <td width=530 style=text-align:center><a href="boardView?boardId=${board.boardId}">${board.boardTitle}</a></td>
                                             		<td width=330>${board.memberNickname}</td>
                                                    <td width=280><i class="far fa-calendar-check"></i>${board.boardRegisterDate}</td>
                                                    <td width=180 style=text-align:center>${board.boardViews}</td>
                                                    </tr>
                                             
                                                    </table>
                                         </c:forEach>     
                          
                                            
                                                                                                                                                          
                                        </div>
                              
                     
                            
                                    <!-- 페이징 처리-->
                                    <div class="pagination" id="page">
                                        <a href="boardList?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <a href="boardList?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <c:forEach items="${numList}" var="num">
                                        <a href="boardList?page=${num}">${num}</a>
                                       
                                        </c:forEach>
                                        <a href="boardList?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                        <a href="boardList?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                    </div>
                                </div>
                                <!-- dashboard-list-box end--> 
                                 </div>           
                            </div>
                            <!-- dasboard-wrap end-->
            
                        </div>
                   
                    </section>
                    <div class="limit-box fl-wrap"></div>
                </div>
                <!-- content end-->
            </div>
            <!--wrapper end -->
            <!--footer -->
             <jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
             
             <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
             <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
            
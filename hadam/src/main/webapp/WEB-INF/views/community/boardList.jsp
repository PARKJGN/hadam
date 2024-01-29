<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 작성일 문자형식으로 포맷팅하려고 import 했습니다 -->
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/css/board/boardList.css">
    <!-- 자유게시판 커뮤니티 페이지 -->
       
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- section-->
                   	<section class="parallax-section single-par" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="/images/board/back7.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align big-title">
                                
                                <h2><span>Hadam(하루를 담다)</span></h2>
                                <span class="section-separator"></span>
                                <h4>당신의 완벽한 하루를 작성하세요!</h4>
                            </div>
                             
                        </div>
                        
                    </section>
                    <section class="flat-header color-bg adm-header" style="background-color:white">
                   		 
                        <div class="container" id="full">
                           <div class="breadcrumbs-fs fl-wrap " id="tabTab">
								<div class="container" id="moveTab">
									<div class="breadcrumbs fl-wrap">
										<a href="#" style="text-decoration:none; font-size:16px;">커뮤니티</a><span style="font-size:16px;">자유 게시판</span>
									</div>
					
								</div>
							</div>
                            <div class="dasboard-wrap fl-wrap">
                           
                                <div class="dasboard-menu">
                                    <div class="dasboard-menu-btn color3-bg">Dashboard Menu <i class="fal fa-bars"></i></div>
                                    <ul class="dasboard-menu-wrap" >         
                                        <li><a href="/community/boardList" class="user-profile-act" id="boardTap"><i class="far fa-comments"></i> 자유게시판 </a></li>
                                    </ul>
                                </div>
                                
                                <!--Tariff Plan menu end-->
                            </div>
                        </div>
                    </section>
                    <section class="middle-padding">
             
                        <div class="container">
         
                            <!--검색기능-->
                            <div class="dasboard-wrap fl-wrap">
								<form action="/community/searchBoards" name="searchForm" method="get" style="margin-top:-40px;">
								                    <div class="fields">
								                        <div class="field">
								                            <div id="searchWarp">
								                                <select name="searchType" class="searchType">
								                                    <option value="">검색 기준</option>
								                                    <option value="T">제목</option>
								                                    <option value="W">글쓴이</option>
								                                    <option value="TW">제목 또는 글쓴이</option>
								                                </select>
								                                <div class="search">
								  <input type="text" name="keyword" placeholder="검색어 입력">
								  <button type="submit" ><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></button>
								</div>
								                            </div>
								                        </div>
								                    </div>
								                              
								
								  </form> 
  
                              
                                     <div id="table">
                                        <!--자유게시판 컬럼명  -->
                        
                                          <table border="1" id="tableTh">
                                               <tr>
                                         	<th width="200" style=font-weight:bold>번호</th>
                                         	<th width="530" style=font-weight:bold>제목</th>
                                         	<th width="330" style=font-weight:bold>글쓴이</th>
                                         	<th width="280" style=font-weight:bold>날짜</th>
                                         	<th width="180" style=font-weight:bold>조회수</th>
                                         </tr>
                                         </table>
                       						<hr style=opacity:0.1;/>
 										<c:forEach items="${boardList}" var="board">
                                        <div class="reviews-comments-wrap" id="boardTd">
                                             
                                           <!-- 자유게시판 목록출력 -->
                                        	<table border="1" id="tableList">
                                                	<tr>
                                                	<!-- 글 번호 -->
                                                	<td width="200" id="tdBoardId">${board.boardId} </td>
                                                	<!-- 제목 클릭시 상세페이지 이동 및 글 제목 -->
                                                    <td width=530 ><a href="/community/boardView?boardId=${board.boardId}" style="text-decoration:none; color:black;">${board.boardTitle}</a></td>
                                             		<!-- 게시글 올린 회원의 닉네임 -->
                                             		<td width=330>${board.memberNickname}</td>
                                             		<!-- 게시글 작성일 -->											<!-- 작성일 문자형식으로 포맷팅  -->
                                                    <td width=280> 
                                                    <fmt:formatDate value="${board.boardRegisterDate}" pattern="yyyy/MM/dd" />
                                                    </td>
                                                    <!-- 게시글 조회수 -->
                                                    <td width=180 >${board.boardViews}</td>
                                                    </tr> 
                                                                                           
                                  			</table>
                             				     <hr style=opacity:0.1;/> 
                                                                                                                                
                                         </div>
                                       </c:forEach>  
                                          <a style="text-decoration:none; color:black;" href="/community/boardWrite"  id="writeButton" style=color:blue;> <i class="fa-solid fa-pen-to-square" style=color:rgba(124,150,255,1)>글 작성</i></a>
                                    <!-- 페이징 처리-->
                                    <div class="pagination" id="page">
                                    	<!-- 페이지 맨처음으로 이동 -->
                                        <a href="/community/boardList?page=1" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <!-- 전페이지로 이동 -->
                                        <a href="/community/boardList?page=${prevMax}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
                                        <!-- 페이지 리스트 3으로 설정하면 3개나옴 -->
                                        <c:forEach items="${numList}" var="num">
                                        <a href="/community/boardList?page=${num}">${num}</a>
                                       
                                        </c:forEach>
                                        <!-- 다음페이지 이동 -->
                                        <a href="/community/boardList?page=${nextMin}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                        <!-- 마지마페이지 이동 -->
                                        <a href="/community/boardList?page=${lastPage}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>
                                    </div>
                                </div>
                                <!-- dashboard-list-box end--> 
                            
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
			 <script type="text/javascript" src="/js/board/boardList.js"></script>
            
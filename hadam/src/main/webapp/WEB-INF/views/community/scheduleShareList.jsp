<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

            <!-- header-->
    		 <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
            <!--  header end -->
            <head>
             <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
             <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
             <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
           	
           	 <style>
           	 	#box {
           	 		width:1750px;
           	 		margin-left:-500px;
           	    }
           	  	#scheduleImg {
           	  		display: flex;           	  
           	  	}
           	  	#scheduleImg img{
           	  		padding:50px;
           	  		width:300px;
           	  		height:auto;
           	  	}
           	  	#locationList {
           	  		
           	  		display: flex;
           	  		position:relative;
           	  		top:-100px;
    
           	  	
           	  	}
           	  	#locationList > td > a {
           	  		
           	  		display:inline-block;
           	  		font-size:12px;
           	  		/* margin-right:280px;  */
           	  		position:relative;
           	  		right: -50px;
           	  		white-space: nowrap;
           	  		text-align:center;
           	  	}
           	  	#page {
           	  		position:relative;
           	  		right:-650px;
           	  	}
           	  	#shareButton {
           	  		position:relative;
           	  		right:-1620px;
           	  		height:auto;
           	  		font-size:13px;
           	  		
           	  	}
           	  	#timeSchedule {
           	  		display:flex;
           	  		margin-bottom:-75px;
           	  		font-size:13px;
           	  		position:relative;
           	  		bottom:-10px;
           	  		right: -50px;
           	  		white-space: nowrap;
           	  	}
           	  	#scheduleDate {
           	  		position:relative;
           	  		right:-1500px;
           	  		top: -170px;
           	  		font-size:13px;
           	  	}
           	  	#predictTime {
           	  	    position:relative;
           	  		right:-1500px;
           	  		top:-140px;
           	  		font-size:13px;
           	  	}
           	  	#dashboardList {
           	  		display:flex;
           	  		margin-bottom:-100px;
           	  	}
           	  	#doingTime {
           	  		font-size:13px;
           	  		display:flex;
           	  		position:relative;
           	  		right:-260px;
           	  		bottom:-130px;
           	  	}
           	  	
           	  	#updateButton {
           	  		display:flex;
           	  		position:relative;
           	  		right:-800px;
           	  		height: auto;
           	  		font-size:13px;
           	  	}
           	 </style>
                                            
            </head>
            <!--  wrapper  -->
            <div id="wrapper">
                <!-- content-->
                <div class="content">
                    <!-- section-->
                    <section class="flat-header color-bg adm-header">
                        <div class="wave-bg wave-bg2"></div>
                        <div class="container">
                            <div class="dasboard-wrap fl-wrap">
                                <div class="dasboard-breadcrumbs breadcrumbs"><a href="#">Home</a><a href="#">Dashboard</a><span>Profile page</span></div>
                                <!--dasboard-sidebar-->
                                <div class="dasboard-sidebar">
                                   
                                </div>
                                <!--dasboard-sidebar end--> 
                                <!-- dasboard-menu-->
                                <div class="dasboard-menu">
                                    <div class="dasboard-menu-btn color3-bg">Dashboard Menu <i class="fal fa-bars"></i></div>
                                    <ul class="dasboard-menu-wrap">
                                        <li>
                                            <a href="dashboard.html"><i class="far fa-user"></i>Profile</a>
                                            <ul>
                                                <li><a href="dashboard-myprofile.html">Edit profile</a></li>
                                                <li><a href="dashboard-password.html">Change Password</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="dashboard-messages.html"><i class="far fa-envelope"></i> Messages <span>3</span></a></li>
                                        <li>
                                            <a href="dashboard-listing-table.html" class="user-profile-act"><i class="far fa-th-list"></i> My listigs  </a>
                                            <ul>
                                                <li><a href="#">Active</a><span>5</span></li>
                                                <li><a href="#">Pending</a><span>2</span></li>
                                                <li><a href="#">Expire</a><span>3</span></li>
                                            </ul>
                                        </li>
                                        <li><a href="dashboard-bookings.html"> <i class="far fa-calendar-check"></i> Bookings <span>2</span></a></li>
                                        <li><a href="dashboard-review.html"><i class="far fa-comments"></i> Reviews </a></li>
                                    </ul>
                                </div>
                                <!--dasboard-menu end-->
                                <!--Tariff Plan menu-->
                                <div class="tfp-btn"><span>Tariff Plan : </span> <strong>Extended</strong></div>
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
                        <div class="container">
                            <!--dasboard-wrap-->
                            <div class="dasboard-wrap fl-wrap">
                                <!-- dashboard-content--> 
                                <div class="dashboard-content fl-wrap" id="box">
                                 <a class="btn btn-primary" href="#" role="button" id="shareButton">스케줄 공유하기</a>
                                    <div class="dashboard-list-box fl-wrap">                                      
                                        <div class="dashboard-header fl-wrap">
                                            <h3>스케쥴 공유 게시판</h3>
                                        </div>
                                        <!-- dashboard-list  -->    
                                        <div class="dashboard-list" id="dashboardList" >
                                            <div class="dashboard-message">
                                            <span class="new-dashboard-item">New</span>
                                              <table>
                                               
                                              	<tr>                                               
                                                <!-- <div class="dashboard-listing-table-image" > -->
                                                 <td><h6><a href="listing-single.html">스케쥴 제목</a></h6></td>
                                                 </tr>
                                                <tr id="timeSchedule">
                                                 	<td class="dashboard-listing-table-address">시작시간</td>
                                                 	<td class="dashboard-listing-table-address" width="250px">끝나는시간</td>
                                                 	
                                                 	<td class="dashboard-listing-table-address">시작시간</td>
                                                 	<td class="dashboard-listing-table-address" width="250px">끝나는시간</td>
                                                 	
                                                 	<td class="dashboard-listing-table-address">시작시간</td>
                                                 	<td class="dashboard-listing-table-address" width="250px">끝나는시간</td>
                                                 	
                                                 	<td class="dashboard-listing-table-address">시작시간</td>
                                                 	<td class="dashboard-listing-table-address" width="250px">끝나는시간</td>
                                                 	
                                                 	<td class="dashboard-listing-table-address">시작시간</td>
                                                 	<td class="dashboard-listing-table-address" width="250px">끝나는시간</td>
                                                </tr>
                                                
                                                <tr id="doingTime">
                                                	<td class="dashboard-listing-table-address" width="300">소요시간 </td>
                                                	<td class="dashboard-listing-table-address" width="300">소요시간 </td>
                                                	<td class="dashboard-listing-table-address" width="300">소요시간 </td>
                                                	<td class="dashboard-listing-table-address" width="300">소요시간 </td>
                                                	
                                                
                                                </tr>
                                                <tr id="scheduleImg">
                                                
                                                    <td><a href=""><img src="../images/gal/1.jpg" alt=""></a></td>
                                                    <td><a href=""><img src="../images/gal/1.jpg" alt=""></a></td>
                                                    <td><a href=""><img src="../images/gal/1.jpg" alt=""></a></td>
                                                    <td><a href=""><img src="../images/gal/1.jpg" alt=""></a></td>
                                                    <td><a href=""><img src="../images/gal/1.jpg" alt=""></a></td>
                                                    
                                                </tr>
                                                <tr id="scheduleDate">
                                                	<td class="dashboard-listing-table-address">스케줄 일정</td>
                                                </tr>
                                                
                                                 <tr id="predictTime">
                                                	<td class="dashboard-listing-table-address">예상 소요시간</td>
                                                </tr>
                                          <!--       </div> -->
                                                <tr id="locationList">
                                            
                                                    <td class="dashboard-listing-table-address" width="300"><a  href="#">asdsadadsadasds</a></td>
                                                    <td class="dashboard-listing-table-address" width="300"><a  href="#">asdssadsadsadsadsa</a></td>
                                                    <td class="dashboard-listing-table-address" width="300"><a  href="#">장소명</a></td>
                                                    <td class="dashboard-listing-table-address" width="300"><a  href="#">장소명</a></td>
                                                    <td class="dashboard-listing-table-address" width="300"><a  href="#">장소명</a></td>
                                                    <!-- <ul class="dashboard-listing-table-opt  fl-wrap"><
                                                        <li><a href="#">Edit <i class="fal fa-edit"></i></a></li>
                                                        <li><a href="#" class="del-btn">Delete <i class="fal fa-trash-alt"></i></a></li>
                                                    </ul>
 -->                                                </tr>
                                                </table>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                       			
									<!-- 모달 버튼 끝 -->
                                 <!-- 주문내역 팝업 띄우기-->

                                 <!-- 팝업창 내용 -->
								<!-- 모달 시작 -->

										
                                    <!-- pagination-->
                                    <button class="btn btn-primary" type="submit" id="updateButton">참가 신청하기</button>
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
   <!--         footer end -->
   <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
   <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
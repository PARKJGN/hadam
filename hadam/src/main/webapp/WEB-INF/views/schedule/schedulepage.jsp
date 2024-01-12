<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link type="text/css" rel="stylesheet" href="/css/schedule/schedule.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
            <!-- header-->
           <jsp:include page="../../layout/scheduleheader.jsp"></jsp:include>
            <!--  header end -->
           
            <!--  wrapper  -->
            <div id="wrapper" >
                <!-- content-->
                <div class="content">
                    <!-- Map -->
                     
                    <div class="map-container  fw-map big_map hid-mob-map">
                        <div id="map-main" ></div>
                        <div class="map-close"><i class="fas fa-times"></i></div>
                    </div>
                    <!-- Map end -->
                    
                    <!--section -->
                    <section class="grey-blue-bg small-padding">
                        <div class="container">
                            <div class="row">
                                <!--listing -->
                                <div class="col-md-12">
                                    <!--list-wrap-search   -->
                                    <div class="list-wrap-search lisfw fl-wrap lws_mobile">
                                        <div class="container ">
                                        	<div class = "scheduleSummary"><img src="/images/schedule/bg/red.jpg" alt="">
                                        		</div>
                                        </div>
                                    </div>
                                    <!--list-wrap-search end -->                    
                                    <!--col-list-wrap -->
                                        <!-- list-main-wrap-->
                                        
                                            <!-- listing-item-container -->
                                          
                                            <!-- listing-item-container end-->
                                            <div class = "aa">
                                            	<div class="table-responsive">
                   								 <table class="table table-bordered text-center">
                        							<thead>
                            							<tr class="bg-light-gray">
                            							</tr>
                        							</thead>
                        							<tbody>
                           							<tr class = "scheduleTable">
                               
                            						</tr>
                        							</tbody>
                    								</table>
                							</div>
                							<div class="list-wrap-search lisfw fl-wrap lws_mobile">
                                        <div class="container ">
                                        	<div class = "scheduleinven"><img src="/images/schedule/bg/red.jpg" alt="">
                                        		</div>
                                        </div>
                                    </div>
                                    </div>
                                        <!-- list-main-wrap end-->
                                    <!--col-list-wrap end -->
                                </div>
                                <!--listing  end-->
                            </div>
                            <!--row end-->
                        </div>
                    </section>
                </div>
                <!-- content end-->
            </div>
            <!-- modal start -->
            
            
            <!--wrapper end -->
             <!--footer -->
            <jsp:include page="../../layout/footer.jsp"></jsp:include>
            
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog modal-xl">
    				<div class="modal-content scheduleaddform">
      					<div class="modal-header">
       						 <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      					</div>
      					<div class="modal-body">
      					
      						<div>asd</div>
       					 ...
      					</div>
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        					<button type="button" class="btn btn-primary scheduleadd">Save changes</button>
      					</div>
   				 	</div>
  				</div>
			</div>
          
            <!--footer end -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/js/schedule/Tmap.js"></script>
<script type="text/javascript" src="/js/schedule/schedule-timeline.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja"></script>
           
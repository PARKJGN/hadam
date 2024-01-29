<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="KO">
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <div class="nav-left-sidebar sidebar-dark">
        <div class="menu-list">
            <nav class="navbar navbar-expand-lg navbar-light">
                <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-divider">
                            메뉴
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" ><i class="fas fa-fw fa-home"></i> DashBoard </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link " href="dashboard-user.html"><i class="fa fa-fw fa-user-circle"></i>계정 관리</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="#"><i class="fas fa-fw fa-map-marker-alt"></i>장소 관리</a>
                        </li>	
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-fw fa-table"></i>게시판 관리</a>
                            <div id="submenu-2" class="collapse submenu" style="">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link" href="">자유게시판</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="">스케줄공유게시판</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item ">
                        	<a class="nav-link" href="#" ><i class="fas fa-fw fa-headphones"></i>문의 관리</a>
                        </li>
                        <li class="nav-item ">
                        	<a class="nav-link" href="#" ><i class="fas fa-fw fa-exclamation-circle"></i>신고 관리</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end left sidebar -->
    <!-- ============================================================== -->
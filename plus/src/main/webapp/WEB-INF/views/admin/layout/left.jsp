﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



	<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: black;">
            <a class="navbar-brand ps-3" href="#">원데이 플러스 +</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
            </button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input type="hidden">
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link">
                            <i class="fas fa-user fa-fw"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Admin</div>
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    관리자 페이지
                                </a>
                                <div class="sb-sidenav-menu-heading">main</div>
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    사용자 페이지
                                </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#MemberLayout" aria-expanded="false" aria-controls="MemberLayout">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                사용자 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="MemberLayout" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/memberManage/list'/>">회원 관리</a>
                                    <a class="nav-link" href="#">사업자 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                통계
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">원데이플러스 통계</a>
                                    <a class="nav-link" href="#">가입자 수 통계</a>
                                    <a class="nav-link" href="#">원데이 클래스 통계</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#communityLayouts" aria-expanded="false" aria-controls="communityLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                커뮤니티 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="communityLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/eventManage/all/list'/>">이벤트 게시판 관리</a>
                                    <a class="nav-link" href="#">리뷰 관리</a>
                                    <a class="nav-link" href="#">커뮤니티 게시판</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#onedayPages" aria-expanded="false" aria-controls="onedayPages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                원데이 클래스 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="onedayPages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        원데이 클래스
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">인기 클래스</a>
                                            <a class="nav-link" href="#">이벤트 클래스</a>
                                            <a class="nav-link" href="#">할인/특가 클래스</a>
                                            <a class="nav-link" href="#">전체 클래스</a>
                                        </nav>
                                    </div>
                                        <a class="nav-link" href="#">카테고리 관리</a>
                                </nav>
                            </div>

                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#FAQLayout" aria-expanded="false" aria-controls="FAQLayout">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                고객센터
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="FAQLayout" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="https://pf.kakao.com/_cbxcnG">채팅(1:1문의)</a>
                                    <a class="nav-link" href="<c:url value='/admin/noticeManage/list'/>">공지사항</a>
                                    <a class="nav-link" href="#">FAQ</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <i class="fas fa-user fa-fw"></i>&nbsp;&nbsp;
                         <a href="#" style="text-decoration: none; color: white;">홍길동 관리자님</a>
                    </div>
                </nav>
            </div>
            


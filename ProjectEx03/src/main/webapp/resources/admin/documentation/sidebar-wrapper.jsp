<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="sidebar" data-color="purple" data-image="../assets/img/sidebar-1.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <!-- <a href="http://www.creative-tim.com" class="simple-text"> </a> -->
                    <a class="simple-text">C S M 관리자 모드</a>
            </div>
            
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="/admin/adminmain">
                            <i class="material-icons">dashboard</i>
                            <p>관리자 메인</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/aduser/userList">
                            <i class="material-icons">person</i>
                            <p>유저 관리하기</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/adcommunity/adcoBoardAlllist">
                            <i class="material-icons">content_paste</i>
                            <p>community게시판 관리</p>
                        </a>
                    </li>
                    <li>	      
                        <a href="/admin/adcustomer/adcuBoardAlllist">
                            <i class="material-icons">content_paste</i>
                            <p>customer게시판 관리</p>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="./user2.jsp">
                            <i class="material-icons">content_paste</i>
                            <p>권한 관리하기</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/adStatistics/statistics">
                            <i class="material-icons">library_books</i>
                            <p>통계</p>
                        </a>
                    </li> -->
                    <!-- <li>
                        <a href="./icons.jsp">
                            <i class="material-icons">bubble_chart</i>
                            <p>Icons</p>
                        </a>
                    </li> -->
                   <!-- 지도 부분 삭제  
                    <li>
                        <a href="./maps.jsp">
                            <i class="material-icons">location_on</i>
                            <p>Maps</p>
                        </a>
                    </li>
                    -->
                    <!-- <li>
                        <a href="./notifications.jsp">
                            <i class="material-icons text-gray">notifications</i>
                            <p>Notifications</p>
                        </a>
                    </li> -->
                </ul>
            </div>
        </div>
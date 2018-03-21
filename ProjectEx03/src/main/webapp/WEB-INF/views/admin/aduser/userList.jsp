<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>유저관리</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="/resources/admin/assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/admin/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>


<title>회원 목록</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/admin/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/admin/notice/noticewrite";
		});
	});

$(function(){	
	$("#btnmain").click(function(){
		location.href = "/admin/adminmain";
	});	
});
</script>
<!-- <link rel="stylesheet" href="/admin/resources/css/style.css"> -->
</head>
<body>
	
	<div class="wrapper">
    <%@ include file="/resources/admin/documentation/sidebar-wrapper.jsp" %><!-- 사이드 바  -->
        
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> User 관리 </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">dashboard</i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="hidden-lg hidden-md">Notifications</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Mike John responded to your email</a>
                                    </li>
                                    <li>
                                        <a href="#">You have 5 new tasks</a>
                                    </li>
                                    <li>
                                        <a href="#">You're now friend with Andrew</a>
                                    </li>
                                    <li>
                                        <a href="#">Another Notification</a>
                                    </li>
                                    <li>
                                        <a href="#">Another One</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group  is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">유저 관리</h4>
                                    <p class="category">Here is a subtitle for this table</p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>아이디</th>
											<th>이름</th>
											<th>성별</th>
											<th>생일</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>우편번호</th>
											<th>도로명주소</th>
											<th>상세주소</th>
											<th>아이디생성일</th>
											<th>권한</th>
											<th>포인트</th>
											<th>권한주기</th>
											<th>권한뺏기</th>
											<th>회원삭제</th>
											<th>권한요청</th>
                                        </thead>
                                        <tbody>
                                           <c:choose>
											<c:when test="${not empty userList }">
												<c:forEach var="userList" items="${userList}">
													<%-- 
													<input type="hidden" id="user_number" name="user_number" value="${userList.user_number }"> 
													--%>
													<tr>
														<td>${userList.user_id }</td>
														<td>${userList.user_name }</td>
														<td>${userList.user_gender }</td>
														<td>${userList.user_birthday}</td>
														<td>${userList.user_email }</td>
														<td>${userList.user_phone }</td>
														<td>${userList.user_mailNumber }</td>
														<td>${userList.user_streetAddr }</td>
														<td>${userList.user_detailedAddr }</td>
														<td>${userList.user_regdate } </td>
														<td>${userList.user_authority } </td>
														<td>${userList.user_point  }</td>
														<td><button id="btnchangeSeller" value="${userList.user_id }" class="userAuthority">권한주기</button></td>
														<td><button id="btnchangeUser" value="${userList.user_id }" class="userAuthorityDelete">권한뺏기</button></td>
														<td><button id="btnDelete" value="${userList.user_id }" class="userDelete">삭제</button></td>
														<c:if test="${userList.reqAuthority eq 1 }">
														<th style="color: blue;">신청</th>
														</c:if>
														<c:if test="${userList.reqAuthority eq 0 }">
														<td >미신청</td>
														</c:if>
													</tr>
												</c:forEach>
					
											</c:when>
											<c:otherwise>
												<td colspan="16">등록된 회원이 없습니다.</td>
											</c:otherwise>
										</c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
$(function(){
	$(".userAuthorityDelete").click(function(){
		var user_id = $(this).val();
		if(confirm("판매자 권한을 뺏겠습니까?")) {
			$.ajax({
		 		type:'post',
				url : '/admin/aduser/adminuserchangeUser',
				dataType : 'text',
				data : {user_id : user_id},
				success: function(result){
					
					if(result=='success') {
						alert("삭제 되었습니다.");
					}
				}
			});
		}
	});
	$(".userDelete").click(function(){
		var user_id = $(this).val();
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
		 		type:'post',
				url : '/admin/aduser/adminuserdelete',
				dataType : 'text',
				data : {user_id : user_id},
				success: function(result){
					
					if(result=='success') {
						alert("삭제 되었습니다.");
					}
				}
			});
		}
	});
	$(".userAuthority").click(function(){
		var user_id = $(this).val();
		if(confirm("판매자 권한을 주시겠습니까?")){
			$.ajax({
		 		type:'post',
				url : '/admin/aduser/adminuserchangeSeller',
				dataType : 'text',
				data : {user_id : user_id},
				success: function(result){
					
					if(result=='success') {
						alert("권한이 변경되었습니다.");
					}
				}
			});
		}
	});
});
</script>
<!-- 뷰 적용 -->
<!--   Core JS Files   -->
<script src="/resources/admin/assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/resources/admin/assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/resources/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/admin/assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="/resources/admin/assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="/resources/admin/assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="/resources/admin/assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/resources/admin/assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="/resources/admin/assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/admin/assets/js/demo.js"></script>
<!-- 뷰 적용 -->
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/admin/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="/resources/admin/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Material Dashboard by Creative Tim</title>
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
<style>
.card img {
    width: 3%;
    height: auto;
}
</style>
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
                        <a class="navbar-brand" href="#"> community 게시판 관리 </a>
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
                                    <h4 class="title">자유게시판</h4>
                                    <p class="category">Here is a subtitle for this table</p>
                                </div>
                                
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </thead>
                                        <tbody>
					                        <c:choose>
												<c:when test="${not empty freeList }">
						
												<c:forEach var="freeList" items="${freeList}">
						
														<tr>
															<td>${freeList.bno }</td>
															<td><a href="/admin/adcommunity/freeread/${freeList.bno }">${freeList.title }</a></td>
															<td>${freeList.writer }</td>
															<td>${freeList.regdate }</td>
															<td>${freeList.viewcount }</td>
														</tr>
						
												</c:forEach>
						
												</c:when>
												<c:otherwise>
													<td colspan="4">등록된 회원이 없습니다.</td>
												</c:otherwise>
											</c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                         <!-- 페이지 -->
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMakerBestM.cri.perPageNum}">
		<input type='hidden' name="perPageNum" value="${pageMakerBestM.cri.perPageNum}">
	</form>
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${UnderPage.prev}">
						<li><a
							href="listPage${UnderPage.makeSearch(UnderPage.startPage-1) }">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${UnderPage.startPage }"
						end="${UnderPage.endPage }" var="idx">
						<li
							<c:out value="${UnderPage.pm.page == idx?'class =active':''}"/>>
							<a href="listPage${UnderPage.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${UnderPage.next && UnderPage.endPage > 0}">
						<li><a
							href="listPage${UnderPage.makeSearch(UnderPage.endPage+1) }">&raquo;</a></li>
					</c:if>
	</ul>
</div>
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title"> 지식인 </h4>
                                    <p class="category"></p>
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
	                                        <thead>
	                                            <th>번호</th>
	                                            <th>제목</th>
	                                            <th>작성자</th>
	                                            <th>작성일</th>
	                                            <th>조회수</th>
	                                        </thead>
	                                        <tbody>
                                            <c:choose>
												<c:when test="${empty quList}">
													<tr>
														<td colspan="5">등록된 quList가 없다</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${quList}" var="quList" >
														<tr>
															<td class="no">${quList.bno}</td>
															<%-- <td style="width: 8%;">${row.notice_bno}</td> --%>
															
															<td style="width: 50%;"><a href="/admin/adcommunity/quread/${quList.bno}">${quList.title}</a></td>
															<td style="width: 9%;">${quList.writer}</td>
															<td style="width: 25%;">
																<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
																	value="${quList.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
															</td>
															<td class="no" style="width: 8%;">${quList.viewcount}</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 페이지 -->
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${UnderPage2.prev}">
						<li><a
							href="listPage${UnderPage2.makeSearch(UnderPage.startPage-1) }">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${UnderPage2.startPage }"
						end="${UnderPage2.endPage }" var="idx">
						<li
							<c:out value="${UnderPage2.pm.page == idx?'class =active':''}"/>>
							<a href="listPage${UnderPage2.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${UnderPage2.next && UnderPage2.endPage > 0}">
						<li><a
							href="listPage${UnderPage2.makeSearch(UnderPage2.endPage+1) }">&raquo;</a></li>
					</c:if>
	</ul>
</div>
                    </div>
                </div>
            </div>
         
        </div>
    </div>
</body>
<!--   Core JS Files   -->
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

</html></html>
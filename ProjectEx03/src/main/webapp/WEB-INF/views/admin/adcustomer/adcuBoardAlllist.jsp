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
                        <a class="navbar-brand" href="#"> customer 게시판 관리 </a>
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
                                    <h4 class="title">1:1문의</h4>
                                    <p class="category">Here is a subtitle for this table</p>
                                </div>
                                
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>문의번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>답변여부</th>
                                        </thead>
                                        <tbody>
					                        <c:choose>
												<c:when test="${not empty bestmlist }">
						
												<c:forEach var="bestmlist" items="${bestmlist}">
						
														<tr>
															<td>${bestmlist.bestm_bno }</td>
															<td><a href="/admin/adcustomer/bestmread/${bestmlist.bestm_bno }">${bestmlist.bestm_title }</a></td>
															<td>${bestmlist.bestm_writer }</td>
															<td>${bestmlist.bestm_regidate }</td>
															<td>
																<c:choose>
																		<c:when test="${bestmlist.answer == 'N' }">
																			<font style="color: red">답변대기</font>
																		</c:when>
																		<c:when test="${bestmlist.answer == 'Y' }">
																			<font style="color: black;">답변완료</font>
																		</c:when>
																		<c:otherwise>
																		</c:otherwise>
																</c:choose> 
															</td>
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
		
		<c:if test="${pageMakerBestM.prev}">
			<li><a href="${pageMakerBestM.makeSearch(pageMakerBestM.startPage - 1)}">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageMakerBestM.startPage }"
			end="${pageMakerBestM.endPage }" var="idx">
			<li
				<c:out value="${pageMakerBestM.cri.page == idx?'class =active':''}"/>>
				<a href="${pageMakerBestM.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMakerBestM.next && pageMaker.endPage > 0}">
			<li><a href="${pageMakerBestM.makeSearch(pageMakerBestM.endPage +1)}">&raquo;</a></li>
		</c:if>
	</ul>
</div>
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">공지 사항</h4>
                                    <p class="category">
                                    		<button class="btn btn-info" onclick="location.href='/admin/adcustomer/register'">공지 사항 쓰기</button>
                                   </p>
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
												<c:when test="${empty notlist}">
													<tr>
														<td colspan="5">등록된 Notice가 없다</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${notlist}" var="noticelist" >
														<tr>
															<td class="no">${noticelist.notice_bno}</td>
															<%-- <td style="width: 8%;">${row.notice_bno}</td> --%>
															
															<td style="width: 50%;"><a href="/admin/adcustomer/noticeread/${noticelist.notice_bno}">${noticelist.notice_title}</a></td>
															<td style="width: 9%;">${noticelist.notice_writer}</td>
															<td style="width: 25%;">
																<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
																	value="${noticelist.notice_regidate}" pattern="yyyy-MM-dd HH:mm:ss" />
															</td>
															<td class="no" style="width: 8%;">${noticelist.notice_viewcnt}</td>
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
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMakerNotice.cri.perPageNum}">
		<input type='hidden' name="perPageNum" value="${pageMakerNotice.cri.perPageNum}">
	</form>
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMakerNotice.prev}">
			<li><a href="${pageMakerNotice.makeSearch(pageMakerNotice.startPage - 1)}">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageMakerNotice.startPage }"
			end="${pageMakerNotice.endPage }" var="idx">
			<li
				<c:out value="${pageMakerNotice.cri.page == idx?'class =active':''}"/>>
				<a href="${pageMakerNotice.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMakerNotice.next && pageMakerNotice.endPage > 0}">
			<li><a href="${pageMakerNotice.makeSearch(pageMakerNotice.endPage +1)}">&raquo;</a></li>
		</c:if>
	</ul>
</div>
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">자주찾는 질문</h4>
                                    <p class="category">
                                    <button class="btn btn-info" onclick="location.href='/admin/adcustomer/register1'">자주찾는 질문 작성</button>
                                    </p>
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
										<c:when test="${ empty bestqlist}">
											<tr>
												<td colspan="5">등록된 자주찾는 질문이 없다</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="bestqlist" items="${bestqlist}">
												<tr>
													<td class="no">${bestqlist.bestq_bno}</td>
													<td style="width: 50%;"><a href="/admin/adcustomer/bestqread/${bestqlist.bestq_bno}">${bestqlist.bestq_title}</td>
													<td style="width: 9%;">${bestqlist.bestq_writer}</td>
													<td style="width: 25;%;">
														<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
															value="${bestqlist.bestq_regidate}" pattern="yyyy-MM-dd HH:mm:ss" />
													</td>
													<td class="no" style="width: 8%;">${bestqlist.bestq_viewcnt}</td>
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
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMakerBestQ.cri.perPageNum}">
		<input type='hidden' name="perPageNum" value="${pageMakerBestQ.cri.perPageNum}">
	</form>
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMakerBestQ.prev}">
			<li><a href="${pageMakerBestQ.makeSearch(pageMakerBestQ.startPage - 1)}">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageMakerBestQ.startPage }"
			end="${pageMakerBestQ.endPage }" var="idx">
			<li
				<c:out value="${pageMakerBestQ.cri.page == idx?'class =active':''}"/>>
				<a href="${pageMakerBestQ.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMakerBestQ.next && pageMakerBestQ.endPage > 0}">
			<li><a href="${pageMakerBestQ.makeSearch(pageMakerBestQ.endPage +1)}">&raquo;</a></li>
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
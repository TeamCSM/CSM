<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>관리자 모드</title>
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
                        <a class="navbar-brand" href="/"> CSM 홈페이지로 이동 </a>
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
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">content_copy</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">오늘 가입한 회원 수</p>
                                    <h3 class="title"> ${joinCount.count } 명 </h3>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
                                    <i class="material-icons">store</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">오늘 판매 금액</p>
                                    <h3 class="title">${dailySum.item_price } 원</h3>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="fa fa-twitter"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">오늘 판매 건수 </p>
                                    <h3 class="title">${dailyCount.count } 건</h3>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
                                    <i class="material-icons">info_outline</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">오늘 제출된 이력서</p>
                                    <h3 class="title">${dailyResume.count } 건</h3>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
                                    <div class="ct-chart" id="dailySalesChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 접속자수</h4>
                                    <p class="category">
                                        <c:if test="${conm.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${conm.result }% </span>
                                        </c:if>
                                        <c:if test="${conm.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${conm.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="orange">
                                    <div class="ct-chart" id="dailySalesChart2"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 회원가입 수</h4>
                                    <p class="category">
                                        <c:if test="${createm.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${createm.result }% </span>
                                        </c:if>
                                        <c:if test="${createm.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${createm.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">
                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                    <div class="ct-chart" id="completedTasksChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 탈퇴 회원 수</h4>
                                    <p class="category">
                                        <c:if test="${deletem.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${deletem.result }% </span>
                                        </c:if>
                                        <c:if test="${deletem.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${deletem.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                          <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
                                    <div class="ct-chart" id="emailsSubscriptionChart2"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 판매 금액</h4>
                                    <p class="category">
                                    	<c:if test="${conp.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${conp.result }% </span>
                                        </c:if>
                                        <c:if test="${conp.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${conp.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">
                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="orange">
                                    <div class="ct-chart" id="emailsSubscriptionChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 판매 건수</h4>
                                    <p class="category">
                                    	<c:if test="${cons.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${cons.result }% </span>
                                        </c:if>
                                        <c:if test="${conp.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${cons.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                    <div class="ct-chart" id="emailsSubscriptionChart3"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">월별 이력서 제출 건수</h4>
                                    <p class="category">
                                    	<c:if test="${resumem.check_status eq '증가' }">
                                        	전월 대비 <span class="text-danger"><i class="fa fa-long-arrow-up"></i> ${resumem.result }% </span>
                                        </c:if>
                                        <c:if test="${resumem.check_status eq '감소' }">
                                        	전월 대비 <span class="text-info"><i class="fa fa-long-arrow-down"></i> ${resumem.result }% </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                   <!--
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="purple">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Tasks:</span>
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                                <li class="active">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">bug_report</i> Bugs
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">code</i> Website
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">cloud</i> Server
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                           <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Create 4 Invisible User Experiences you Never Knew About</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="messages">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="settings">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes" checked>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" name="optionsCheckboxes">
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>Sign contract for "What are conference organizers afraid of?"</td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  -->
                </div>
            </div>
<!--             <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                    </p>
                </div>
            </footer>
-->
        </div>
    </div>
</body>
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
<!-- Material Dashboard javascript methods -->
<script src="/resources/admin/assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/admin/assets/js/demo.js"></script>
<!-- 뷰 적용 -->
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

    });
</script>

<script type="text/javascript">
type = ['', 'info', 'success', 'warning', 'danger'];


demo = {
    initPickColor: function() {
        $('.pick-class-label').click(function() {
            var new_class = $(this).attr('new-class');
            var old_class = $('#display-buttons').attr('data-class');
            var display_div = $('#display-buttons');
            if (display_div.length) {
                var display_buttons = display_div.find('.btn');
                display_buttons.removeClass(old_class);
                display_buttons.addClass(new_class);
                display_div.attr('data-class', new_class);
            }
        });
    },

    initDocumentationCharts: function() {
        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

        dataDailySalesChart = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [
            	[parseInt('${conn.jan }'), parseInt('${conn.feb }'), parseInt('${conn.mar }'), parseInt('${conn.apr }'), parseInt('${conn.may }'), parseInt('${conn.jun }'), parseInt('${conn.jul }'), parseInt('${conn.aug }'), parseInt('${conn.sep }'), parseInt('${conn.oct }'), parseInt('${conn.nov }'), parseInt('${conn.dec }')]
            ]
        };

        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
           
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);
    },

    initDashboardPageCharts: function() {

        /* ----------==========     Daily Sales Chart initialization    ==========---------- */

        dataDailySalesChart = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [
            	[parseInt('${conn.jan }'), parseInt('${conn.feb }'), parseInt('${conn.mar }'), parseInt('${conn.apr }'), parseInt('${conn.may }'), parseInt('${conn.jun }'), parseInt('${conn.jul }'), parseInt('${conn.aug }'), parseInt('${conn.sep }'), parseInt('${conn.oct }'), parseInt('${conn.nov }'), parseInt('${conn.dec }')]
            ]
        };

        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
           
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);
        
        
        dataDailySalesChart2 = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                series: [
                	[parseInt('${create.jan }'), parseInt('${create.feb }'), parseInt('${create.mar }'), parseInt('${create.apr }'), parseInt('${create.may }'), parseInt('${create.jun }'), parseInt('${create.jul }'), parseInt('${create.aug }'), parseInt('${create.sep }'), parseInt('${create.oct }'), parseInt('${create.nov }'), parseInt('${create.dec }')]
                ]
            };

            optionsDailySalesChart2 = {
                lineSmooth: Chartist.Interpolation.cardinal({
                    tension: 0
                }),
               
                chartPadding: {
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                },
            }

            var dailySalesChart2 = new Chartist.Line('#dailySalesChart2', dataDailySalesChart2, optionsDailySalesChart2);

            md.startAnimationForLineChart(dailySalesChart2);



        /* ----------==========     Completed Tasks Chart initialization    ==========---------- */

        dataCompletedTasksChart = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [
            	[parseInt('${delete.jan }'), parseInt('${delete.feb }'), parseInt('${delete.mar }'), parseInt('${delete.apr }'), parseInt('${delete.may }'), parseInt('${delete.jun }'), parseInt('${delete.jul }'), parseInt('${delete.aug }'), parseInt('${delete.sep }'), parseInt('${delete.oct }'), parseInt('${delete.nov }'), parseInt('${delete.dec }')]
            ]
        };

        optionsCompletedTasksChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            
            chartPadding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            }
        }

        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

        // start animation for the Completed Tasks Chart - Line Chart
        md.startAnimationForLineChart(completedTasksChart);


        /* ----------==========     Emails Subscription Chart initialization    ==========---------- */

        var dataEmailsSubscriptionChart = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [
                [parseInt('${sell.jan }'), parseInt('${sell.feb }'), parseInt('${sell.mar }'), parseInt('${sell.apr }'), parseInt('${sell.may }'), parseInt('${sell.jun }'), parseInt('${sell.jul }'), parseInt('${sell.aug }'), parseInt('${sell.sep }'), parseInt('${sell.oct }'), parseInt('${sell.nov }'), parseInt('${sell.dec }')]

            ]
        };
        var optionsEmailsSubscriptionChart = {
            axisX: {
                showGrid: true
            },
            chartPadding: {
                top: 0,
                right: 5,
                bottom: 0,
                left: 0
            }
        };
        var responsiveOptions = [
            ['screen and (max-width: 640px)', {
                seriesBarDistance: 5,
                axisX: {
                    labelInterpolationFnc: function(value) {
                        return value[0];
                    }
                }
            }]
        ];
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

        md.startAnimationForBarChart(emailsSubscriptionChart);
        
        var dataEmailsSubscriptionChart2 = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                series: [
                	[parseInt('${price.jan }'), parseInt('${price.feb }'), parseInt('${price.mar }'), parseInt('${price.apr }'), parseInt('${price.may }'), parseInt('${price.jun }'), parseInt('${price.jul }'), parseInt('${price.aug }'), parseInt('${price.sep }'), parseInt('${price.oct }'), parseInt('${price.nov }'), parseInt('${price.dec }')]

                ]
            };
            var optionsEmailsSubscriptionChart2 = {
                axisX: {
                    showGrid: true
                },
                chartPadding: {
                    top: 0,
                    right: 5,
                    bottom: 0,
                    left: 20
                }
            };
            var responsiveOptions2 = [
                ['screen and (max-width: 640px)', {
                    seriesBarDistance: 5,
                    axisX: {
                        labelInterpolationFnc: function(value) {
                            return value[0];
                        }
                    }
                }]
            ];
            var emailsSubscriptionChart2 = Chartist.Bar('#emailsSubscriptionChart2', dataEmailsSubscriptionChart2, optionsEmailsSubscriptionChart2, responsiveOptions2);

            //start animation for the Emails Subscription Chart
            md.startAnimationForBarChart(emailsSubscriptionChart2);
            
        var dataEmailsSubscriptionChart3 = {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    series: [
                    	[parseInt('${resume.jan }'), parseInt('${resume.feb }'), parseInt('${resume.mar }'), parseInt('${resume.apr }'), parseInt('${resume.may }'), parseInt('${resume.jun }'), parseInt('${resume.jul }'), parseInt('${resume.aug }'), parseInt('${resume.sep }'), parseInt('${resume.oct }'), parseInt('${resume.nov }'), parseInt('${resume.dec }')]

                    ]
                };
                var optionsEmailsSubscriptionChart3 = {
                    axisX: {
                        showGrid: true
                    },
                    chartPadding: {
                        top: 0,
                        right: 5,
                        bottom: 0,
                        left: 20
                    }
                };
                var responsiveOptions3 = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function(value) {
                                return value[0];
                            }
                        }
                    }]
                ];
                var emailsSubscriptionChart3 = Chartist.Bar('#emailsSubscriptionChart3', dataEmailsSubscriptionChart3, optionsEmailsSubscriptionChart3, responsiveOptions3);

                //start animation for the Emails Subscription Chart
                md.startAnimationForBarChart(emailsSubscriptionChart3);

    },

    initGoogleMaps: function() {
        var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
        var mapOptions = {
            zoom: 13,
            center: myLatlng,
            scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
            styles: [{
                "featureType": "water",
                "stylers": [{
                    "saturation": 43
                }, {
                    "lightness": -11
                }, {
                    "hue": "#0088ff"
                }]
            }, {
                "featureType": "road",
                "elementType": "geometry.fill",
                "stylers": [{
                    "hue": "#ff0000"
                }, {
                    "saturation": -100
                }, {
                    "lightness": 99
                }]
            }, {
                "featureType": "road",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "color": "#808080"
                }, {
                    "lightness": 54
                }]
            }, {
                "featureType": "landscape.man_made",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ece2d9"
                }]
            }, {
                "featureType": "poi.park",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ccdca1"
                }]
            }, {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": [{
                    "color": "#767676"
                }]
            }, {
                "featureType": "road",
                "elementType": "labels.text.stroke",
                "stylers": [{
                    "color": "#ffffff"
                }]
            }, {
                "featureType": "poi",
                "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "landscape.natural",
                "elementType": "geometry.fill",
                "stylers": [{
                    "visibility": "on"
                }, {
                    "color": "#b8cb93"
                }]
            }, {
                "featureType": "poi.park",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.sports_complex",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.medical",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.business",
                "stylers": [{
                    "visibility": "simplified"
                }]
            }]

        }
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            title: "Hello World!"
        });

        // To add the marker to the map, call setMap();
        marker.setMap(map);
    },

    showNotification: function(from, align) {
        color = Math.floor((Math.random() * 4) + 1);

        $.notify({
            icon: "notifications",
            message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."

        }, {
            type: type[color],
            timer: 4000,
            placement: {
                from: from,
                align: align
            }
        });
    }



}
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%@include file="../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@include file="/resources/include/header.jsp"%>
<!-- 게시물 읽기 시작 { -->
<%@include file="/resources/community/include/replyCss.jsp"%>
<section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">공지사항<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<div id="bo_v_table">bestq</div>

<form role="form" method="post">

	<input type='hidden' name='bno' value="${list.notice_bno}" readonly="readonly"/>
	<input type="hidden" name="page" value="${cri.page }" /> 
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }" /> 
	<input type='hidden' name='searchType' value="${cri.searchType}"/>
	<input type='hidden' name='keyword' value="${cri.keyword}"/> 

</form>

<article id="bo_v" class="container">
    <div class="panel panel-success">
    <header class="panel-heading">
        <h1 id="bo_v_title">
            ${list.notice_title}</h1>
    </header>
    <div class="panel-body">
    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <strong><span class="sv_guest">제목 : ${list.notice_title}</span></strong><br/>
        <span class="sound_only"></span><strong>18-02-26 18:33</strong>
        view<strong>5</strong>
        Comment<strong>0</strong>
    </section>

    
    
         <!-- 관련링크 시작 { -->
    <section id="bo_v_link">
        <ul>
            <li>
             <div class="box-body">
				<div class="form-group">
				<label for="exampleInputEmail1">제목</label><br/>
					${list.notice_title}
				</div>
			</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1">작성자</label><br/>
					${list.notice_writer}
				</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1">GitHub 주소</label><br/>
					<a href="">asd</a>
				</div>
            </li>
            <li>
            <label for="exampleInputEmail1"><h4>글내용</h4></label>
            <section>
              <div class="form-group">
			   <br/>
					${list.notice_content}
				</div>
			</section>
            </li>
          </ul>
    </section>
    <!-- } 관련링크 끝 -->
    
    <!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">
	  
	  <ul class="bo_v_nb pager">
	  <li><a href="#" class="next">next<span aria-hidden="true"> &rarr;</span></a></li>        </ul>
        
        <ul class="bo_v_com">
           <li><button type="submit" id="golist" class="btn btn-sm btn-success">목록</button></li>  
        </ul>
            </div>
<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$("#modify").on("click", function(){
		formObj.attr("action", "/customer/sNotice/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#remove").on("click", function(){
		formObj.attr("action", "/customer/sNotice/removePage");
		formObj.submit();
	});
	
	$("#golist").on("click", function(){
		formObj.attr("action", "/customer/sNotice/list");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
});

</script>
    </div>
    </div>
</article>
<!-- } 게시판 읽기 끝 -->

<%@include file="/resources/include/footer.jsp"%>
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
<style>
img{
	margin-top:0%;
}
</style>
<section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">자유 게시판<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<div id="bo_v_table">notice</div>

<form role="form" method="post">

	<input type='hidden' name='bno' value="${boardVO.bno}">
	<input type='hidden' name='page' value="${pm.page}">
	<input type='hidden' name='perPageNum' value="${pm.perPageNum}">
	<input type="hidden" name='searchType' value="${pm.searchType }" />
	<input type="hidden" name='keyword' value="${pm.keyword }" />

</form>

<article id="bo_v" class="container">
    <div class="panel panel-success">
    <header class="panel-heading">
        <h1 id="bo_v_title">
            ${boardVO.title}</h1>
    </header>
    <div class="panel-body">
    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <strong><span class="sv_guest">제목 : ${boardVO.title}</span></strong><br/>
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
					${boardVO.title}
				</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1">작성자</label><br/>
					${boardVO.writer}
				</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1">GitHub 주소</label><br/>
					<a href="${boardVO.github}">${boardVO.github}</a>
				</div>
            </li>
            <li>
            <label for="exampleInputEmail1"><h4>글내용</h4></label>
            <section>
              <div class="form-group">
			   <br/>
					${boardVO.content}
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
  
        <c:if test="${login.user_id == boardVO.writer }">
            <li><button type="submit" id="modify" class="btn btn-sm btn-primary">수정</button></li>
            <li><button type="submit" id="remove" class="btn btn-sm btn-primary">삭제</a></li>
        </c:if>
            <li><button type="submit" id="golist" class="btn btn-sm btn-success">목록</button></li>
            
        </ul>
            </div>
    </section>

<!-- 댓글 쓰기 시작 { -->
<aside id="bo_vc_w">
    <h2>댓글쓰기</h2>
    <form class="form-horizontal" name="fviewcomment" autocomplete="off">
    <input type="hidden" name="w" value="c" id="w">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="wr_id" value="2">
    <input type="hidden" name="comment_id" value="" id="comment_id">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="page" value="">
    <input type="hidden" name="is_good" value="">
    
    <c:if test="${not empty login }">
    <div class="form-group">
        <label for="newReplyWriter" class="col-sm-2 control-label">이름<strong class="sound_only">필수</strong></label>
        <div class="col-sm-8">
            <input type="text" id="newReplyWriter" required class="form-control required" size="5" 
            maxLength="20" value="${login.user_id }" >
        </div>
    </div>
    
    <div class="form-group">
    <label for="newReplyText" class="col-sm-2 control-label">댓글 내용<strong class="sound_only">필수</strong></label>
            <div class="col-sm-8">
              <textarea id="newReplyText" maxlength="100000" required class="required form-control" rows="3" title="내용"
                        ></textarea>
                      
               <script>
                 $(document).on( "keyup change", "textarea#wr_content[maxlength]", function(){
                     var str = $(this).val()
                     var mx = parseInt($(this).attr("maxlength"))
                     if (str.length > mx) {
                         $(this).val(str.substr(0, mx));
                         return false;
                     }
                 });
                </script>
            </div>
        </div>
 
            <div class="form-group">
          <div class="col-sm-offset-2 col-sm-8">
          <span class="no-inline">

		</span>
          </div>
      </div>
          
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <button type="button" id="replyAddBtn" class="btn btn-primary btn-block" >댓글등록</button>
            </div>
        </div>
         </c:if>
    </form>
   
</aside>

<!-- 댓글 시작 { -->
<section id="bo_vc" class="clearfix">
   <ul class="timeline">
		<!-- timeline time label -->
	<div class="time-label">
		<button class="btn btn-sm btn-primary" id="repliesDiv" style="text-align: left;"><h2>댓글 목록</h2></button>
	</div>
	</ul>

	<div class='text-center'>
		<ul id="pagination" class="pagination pagination-sm no-margin ">

		</ul>
	</div>
</section>
<!-- } 댓글 끝 -->

	<!-- modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- modal-content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<input type='hidden' id='replybgroup'/>
					<input type='hidden' id='replyindent'/>
					<p><input type="text" id="replytext" class="form-control" /></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- modal -->
	<div id="registModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- modal-content -->
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
				<div class="modal-body" data-rno>
					<label for="exampleInputEmail1">작성자</label> 
					<input class="form-control" type="text" placeholder="USER ID"
					id="newReplyWriter2" value="${login.user_id}" readonly="readonly" }>
					<label for="exampleInputEmail1">댓글 내용</label>
					<input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText2">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="registAddBtn">
					댓글 등록</button>
				</div>
			</div>
		</div>
	</div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<!-- Contenedor Principal -->
   <div class="comments-container">
      {{#check indent}}
      <ul id="comments-list" class="comments-list">
         <li class="replyLi" data-rno={{rno}}>
         <input type='hidden' class='bgroupNum' value={{bgroup}}>
         <input type='hidden' class='indentNum' value={{indent}}>


            <div class="comment-main-level">
               <!-- Avatar -->
               <div class="comment-avatar"><img src="/resources/community/img/img_avatar1.png" alt=""></div>
               <!-- Contenedor del Comentario -->
               <div class="comment-box">
                  <div class="comment-head">
                     <h6 class="comment-name">${login.user_id}</h6>
                     <div class="timeline-footer">
                        <div class="timeline-footer">
                     {{#eqReplyer replyer}}
                     <a class="comment-name by-author" data-toggle="modal" data-target="#modifyModal">수정하기</a>
                     {{/eqReplyer}}
                     <a class="comment-name by-author" data-toggle="modal" data-target="#registModal">댓글달기</a>
                        </div>
                     </div>
                     <span><i class="fa fa-clock-o"></i>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     {{prettifyDate regdate}}</span>
                     <i class="fa fa-reply"></i>
                     <i class="fa fa-heart"></i>
                  </div>
                  <div class="comment-content">
                    {{replytext}}
                  </div>
               </div>
            </div>
            
            <!-- 대댓글 -->
         {{else}}
            <ul class="comments-list reply-list">
               <li class="replyLi" data-rno={{rno}}>
               <input type='hidden' class='bgroupNum' value={{bgroup}}>
               <input type='hidden' class='indentNum' value={{indent}}>

                  <!-- Avatar -->
                  <div class="comment-avatar"><img src="/resources/community/img/img_avatar1.png" alt=""></div>
                  <!-- Contenedor del Comentario -->
                  <div class="comment-box">
                     <div class="comment-head">
                        <h6 class="comment-name">
                              ${login.user_id}</h6>
                        <div class="timeline-footer">
                           <div class="timeline-footer">
                           {{#eqReplyer replyer}}
                           <a class="comment-name by-author" data-toggle="modal" data-target="#modifyModal">수정하기</a>
                           {{/eqReplyer}}
                           </div>
                        </div>
                        <span><i class="fa fa-clock-o"></i>{{prettifyDate regdate}}</span>
                        <i class="fa fa-reply"></i>
                        <i class="fa fa-heart"></i>
                     </div>
                     <div class="comment-content">
                        {{replytext}}
                     </div>
                  </div>
               </li>
            </ul>
            {{/check}}
         </li>
      </ul>
   </div>


	{{/each}}
</script>

<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});

/* 인덴트값 확인 */
Handlebars.registerHelper('check', function(indent, options) {
	
	  if (indent==0) {
	    return options.fn(this);
	  } else {
	    return options.inverse(this);
	  }
	});
	
Handlebars.registerHelper("eqReplyer", function(replyer, block){
	var accum = "";
	if(replyer == "${login.user_id}"){
			accum += block.fn();
	}
	return accum;
});
	
var printData = function(replyArr, target, templateObject){
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

var bno=${boardVO.bno};
var replyPage = 1;

function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.UnderPage, $(".pagination"));
		
		$("#modifyModal").modal('hide');
		$("#registModal").modal('hide');
		$("#replycntSmall").html("["+data.UnderPage.totalCount+"]");
	});
}

var printPaging = function(UnderPage, target){
	var str = "";
	
	if(UnderPage.prev){
		str += "<li><a href='"+(UnderPage.startPage-1)+"'> << </a></li>";
	}
	for(var i=UnderPage.startPage, len = UnderPage.endPage; i<= len; i++){
		var strClass = UnderPage.pm.page == i?'class=active':'';
		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	if(UnderPage.next){
		str += "<li><a href='"+(UnderPage.endPage+1)+"'> >> </a></li>";
	}
	
	target.html(str);
};

$("#repliesDiv").on("click", function(){
	
	getPage("/replies/"+bno+"/1/free");
});

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPage("/replies/"+bno+"/"+replyPage+"/free");
});

$("#replyAddBtn").on("click", function() {
	
	
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext = replytextObj.val();
 	var type = 'free';
	
	$.ajax({
 		type:'post',
		url : '/replies/',
		headers : {
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType : 'text',
		data : JSON.stringify({bno:bno,replyer:replyer, replytext:replytext, typeboard:type}),
		success: function(result){
			
			if(result=='success') {
				alert("등록되었습니다.");
				replyPage=1;    
				getPage("/replies/"+bno+"/"+replyPage+"/free");
				replyerObj.val("");   
				replytextObj.val("");
			}
		}
	});
});

$("#registAddBtn").on("click", function() {
	
	var bgroup = $('#replybgroup').val();
	
	var indent = $('#replyindent').val();
	var replyerObj = $("#newReplyWriter2");
	var replytextObj = $("#newReplyText2");
	var replyer = replyerObj.val();
	var replytext = replytextObj.val();
 
	$.ajax({
 		type:'post',
		url : '/replies/reply',
		headers : {
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType : 'text',
		data : JSON.stringify({bno:bno,bgroup:bgroup,indent:indent,replyer:replyer,replytext:replytext}),
		success: function(result){
			console.log("result:"+result);
			if(result=='success') {
				replyPage=1;    
				getPage("/replies/"+bno+"/"+replyPage+"/free");
				replyerObj.val("");   
				replytextObj.val("");
			}
		}
	});
});

$(".timeline").on("click", ".replyLi", function(event) {
	
	var reply = $(this);
	
	$('#replybgroup').val(reply.find('.bgroupNum').val());
	$('#replyindent').val(reply.find('.indentNum').val());
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});
$("#replyDelBtn").on("click", function(){
	 
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type : 'delete',
		url : '/replies/'+rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result){
			console.log("result: "+result);
			if(result == 'success'){
				alert("삭제 되었습니다");
				getPage("/replies/"+bno+"/"+replyPage+"/free");
			}
		}
	});
});
$("#replyModBtn").on("click",function(){
		
	var rno = $(".modal-title").html();
	
	var replytext = $("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data:JSON.stringify({replytext:replytext}),
		dataType:'text',
		success:function(result){
			console.log("result: "+result);
			if(result == 'success'){
				alert("수정 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage+"/free");
			}
		}
	});
});
</script>

<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$("#modify").on("click", function(){
		formObj.attr("action", "/community/freeboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#remove").on("click", function(){
		formObj.attr("action", "/community/freeboard/removePage");
		formObj.submit();
	});
	
	$("#golist").on("click", function(){
		formObj.attr("action", "/community/freeboard/listPage");
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
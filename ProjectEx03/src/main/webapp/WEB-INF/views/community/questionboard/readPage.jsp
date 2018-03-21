<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@include file="/resources/include/header.jsp"%>
<%@include file="/resources/community/include/replyCss.jsp"%>

<style>
img{
   margin-top: 0px;
}
.fa-fw {
    width: 1.28571429em;
    text-align: center;
    margin-top: 14px;
}
</style>
<div id="bo_v_table">notice</div>
<section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">지식 In<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<form role="form" method="post">

	<input type='hidden' name='bno' value="${boardVO.bno}">
	<input type='hidden' name='bgroup' value="${boardVO.bgroup}">
	<input type='hidden' name='bstep' value="${boardVO.bstep}">
	<input type='hidden' name='indent' value="${boardVO.indent}">
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
        <span class="sound_only"></span><strong>${boardVO.regdate}</strong>
        view <strong>${boardVO.viewcount}</strong>
        Comment <strong>${boardVO.replycount}</strong>
        Point <strong>${boardVO.point}</strong>
    </section>

<section id="bo_v_link">
        <ul>
            <li>
             <div class="box-body">
				<div class="form-group">
				<label for="exampleInputEmail1"><h4>질문 종류</h4></label><br/><br/>
					${boardVO.question}
				</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1"><h4>제목</h4></label><br/><br/>
					${boardVO.title}
				</div>
            </li>
            <li>
               <div class="form-group">
			   <label for="exampleInputEmail1"><h4>작성자</h4></label><br/><br/>
					${boardVO.writer}
				</div>
            </li>
            <li>
            <label for="exampleInputEmail1"><h4>글내용</h4></label>
            <section>
              <div class="form-group">
			   <br/>
					${boardVO.content}
					<%-- ${answerList.checkcount} --%>
				</div>
			</section>
            </li>
          </ul>
    </section>

<div class="box-body">

	<!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">

        
        <ul class="bo_v_com">
        
        <c:if test="${login.user_id == boardVO.writer }">
            <li><button type="submit" id="modify" class="btn btn-sm btn-primary">수정</button></li>
            <li><button type="submit" id="remove" class="btn btn-sm btn-primary">삭제</li>
        </c:if>
        <c:choose>
        	<c:when test="${login.user_id == boardVO.writer }">
            
        	</c:when>
        	<c:otherwise>
        		<li><button type="submit" id="answer" class="btn btn-sm btn-primary">답글달기</a></li>
        	</c:otherwise>
        </c:choose>
            <li><button type="submit" id="golist" class="btn btn-sm btn-success">목록</button></li>
            
        </ul>
     </div>
</div>

<!-- /.box-body -->

<!-- /.row -->
	
	<!-- 채택 관련 ajax -->
	<script>
		$().ready(function() {
			$(".choice").on("click", function(){
				
				var choiceWriter = $(this).val();
				
			 	var choice_writer = $("#"+choiceWriter).find('[name=choice_writer]').val();
			 	var choice_bno = $("#"+choiceWriter).find('[name=choice_bno]').val();
				//폼을 꼭써라(폼안에 name 쓰기)
			 	
				$.ajax({
			 		type:'post',
					url : '/community/questionboard/choiceId',
					dataType : 'text',
					data : {
							user_id:choiceWriter,
							user_point:'${boardVO.point}',
							bno:'${boardVO.bno}',
							choice_writer:choice_writer,
							choice_bno:choice_bno
					},
					success: function(result){
						
						if(result=='success') {
							alert("채택완료");
							location.reload();
						}
						else{
							alert("채택실패");
		
						}
					}
				});
			});
			
			/* 좋아요 ajax */
			$(".like").on("click", function() {
				
				var likeTarget = $(this).val();
				
			 	var like_writer = $("#"+likeTarget).find('[name=choice_writer]').val();
			 	var like_bno = $("#"+likeTarget).find('[name=choice_bno]').val();
			 	var likeCount = $('#'+likeTarget).find('[name=likeCount]').val();
				 
				$.ajax({
			 		type:'get',
					url : '/community/questionboard/likenum',
					dataType : 'json',
					contentType : "text/html; charset:utf-8",
					data : {
						bno : like_bno,
						writer : like_writer
					},
					success: function(data){
						
						if(data.result=='fail'){
					 		alert("로그인후 사용가능");
					 	}else if(data.result=='success') {
					 		alert("좋아요 성공");
					 		$('#'+likeCount).html("&nbsp;&nbsp;"+data.likeNumGain);
					 		
					 	}else if(data.result='limit'){
					 		alert("'좋아요' 는 한번만 가능합니다.");
					 	}
					}
				}); 
			});
		});
		
	</script>
	
	<!-- 답변 리스트 -->
	<section>
	<div>
		<div class="form-group" style="text-align:center;">
        <label for="newReplyWriter" >
        	<h2>답변 리스트</h2></label>
    	</div>
			<c:forEach items="${answerList}" var="answerList" varStatus="loop">
				<form id="choiceId_${loop.index}">
						<input type="hidden" name="choice_writer" value="${answerList.writer}"/>
						<input type="hidden" name="choice_bno" value="${answerList.bno}"/>
						<input type="hidden" name="likeCount" value="likeCount_${loop.index}"/>
				</form>
				<hr/>
				
				<div>
				<tr name="choiceId" >
					<td>
						<h3>
						<c:choose>
							<c:when test="${answerList.checkcount eq 1 }">
								<img src="/resources/community/img/채택.png" />${answerList.writer} 님의 답변입니다.
							</c:when>
							<c:otherwise>
								${answerList.writer} 님의 답변입니다.
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${login.user_id eq boardVO.writer}" >
								<c:if test="${boardVO.checkcount eq 0}">
									<button type="button" class="btn btn-primary choice" value="choiceId_${loop.index}">채택</button>
									
								</c:if>
							</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
					</h3>
					</td>
					
					<%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${answerList.regdate}" /></td><br/>
					<td style="width: 40px">${answerList.content}</td> --%>
					
					<ul>
						<li>
              				<div class="form-group">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${answerList.regdate}" />
							</div>
						</li>
					</ul>
						<td style="width: 40px">
								${answerList.content}
						</td>
					
					<!-- 댓글 목록,입력 버튼 -->
					<div class="time-label" id="likenum_${loop.index}">
					<button class="btn btn-sm btn-primary replyBtn" value="replyBtn_${loop.index}">
					<span class="glyphicon glyphicon-list"/>
					</button>
					
					<!-- 좋아요 버튼 -->
					<button type="button" class="btn btn-sm btn-primary like" value="choiceId_${loop.index}">
					<span class="glyphicon glyphicon-thumbs-up" id="likeCount_${loop.index}">&nbsp;&nbsp;${answerList.likenum }</span>
					</button>
					</div>
					
				<!-- 댓글 입력  -->
		<div class="row replyView" style="display: none;" id="replyBtn_${loop.index}">
			
			<div class="col-md-12">
			
			
			<div class="box box-success">
				<c:if test="${not empty login }">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				</c:if>
				<div class="box-body">
					<form id="replyAdd_${loop.index }" >
					<input type="hidden" name="answer_bno" value="${answerList.bno}" />
					<input type="hidden" name="answer_reply" value="repliesDiv_${loop.index}"/>
					<c:if test="${not empty login }">
					<label for="exampleInputEmail1">작성자</label> 
					<input name="newReplyWriter" value="${login.user_id }" class="form-control newReplyWriter" type="text" id="newReplyWriter" readonly="readonly"> 
					<label for="exampleInputEmail1">댓글 내용</label>
					<input name="newReplyText" class="form-control newReplyText" type="text" placeholder="REPLY TEXT" id="newReplyText">
					</c:if>
					</form>
				</div>
				<!-- /.box-body -->
				<c:if test="${not empty login }">
				<div class="box-footer">
					<button type="button" class="btn btn-primary replyAddBtn" 
					id="replyAddBtn" value="replyAdd_${loop.index }">ADD REPLY</button>
				</div>
				</c:if>
			</div>
			


			<!-- The time line -->
			<ul class="timeline">
				
				<!-- timeline time label -->
				<div class="time-label repliesDiv" id="repliesDiv_${loop.index}">
					
				</div>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	
	
				</tr>
			</c:forEach>
		</div>
		</section>
	
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

<script id="template" type="text/x-handlebars-template">
	{{#each .}}

<div class="comments-container">
	
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
                        			</div>
                     			</div>
								<span class="posted-time"><i class="fa fa-clock-o"></i>{{prettifyDate regdate}}</span>
								<i class="fa fa-reply"></i>
								<i class="fa fa-heart"></i>
							</div>
							<div class="comment-content">
								{{replytext}}
							</div>
						</div>
					</div>
				</div>
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

function getPage(pageInfo, replyThat){
	$.getJSON(pageInfo, function(data){
		var replyDiv = $("#"+replyThat+" [name=answer_reply]").val();
		$("#"+replyDiv).html("");
		printData(data.list, $("#"+replyDiv), $('#template'));
		printPaging(data.UnderPage, $(".pagination"));
		
		$("#modifyModal").modal('hide');
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


$(".replyBtn").on("click", function(){
	
	var replyThat = $(this).val();
	
	var answer = $("#"+replyThat+" [name=answer_bno]").val();
	
	if($("#"+replyThat).css("display") == 'none'){
		
		getPage("/replies/"+answer+"/1/qa", replyThat);
		$(".timeline").css({'display':'inline'});
		$("#"+replyThat).css({'display':'inline'});
		
		
	}else{
		
		getPage("/replies/"+answer+"/1/qa", replyThat);
		$(".timeline").css({'display':'none'});
		$("#"+replyThat).css({'display':'none'});
	}
	
});

$(".pagination").on("click", "li a", function(event){
	
	event.preventDefault();
	
	replyPage = $(this).attr("href");
	
	getPage("/replies/"+bno+"/"+replyPage+"/qa");
});

$(".replyAddBtn").on("click", function() {
	
	var replyTarget = $(this).val();
	
	var replyAddTarget = $("#"+replyTarget);
	
	
	var replyer = replyAddTarget.find('[name=newReplyWriter]').val();
	var replytext = replyAddTarget.find('[name=newReplyText]').val();
 	var answerBno = replyAddTarget.find('[name=answer_bno]').val();
 	var type = 'qa'
 	
	$.ajax({
 		type:'post',
		url : '/replies/',
		headers : {
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType : 'text',
		data : JSON.stringify({bno:answerBno, replyer:replyer, replytext:replytext, typeboard:type}),
		success: function(result){
			console.log("result:"+result);
			if(result=='success') {
				alert("등록되었습니다.");
				replyPage=1;    
				getPage("/replies/"+answerBno+"/"+replyPage+"/qa", replyTarget);
				replyAddTarget.find('[name=newReplyWriter]').val("");   
				replyAddTarget.find('[name=newReplyText]').val("");
			}
		}
	});
});

$(".timeline").on("click", ".replyLi", function(event) {
	
	var reply = $(this);
	
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
				getPage("/replies/"+bno+"/"+replyPage+"/qa");
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
				getPage("/replies/"+bno+"/"+replyPage+"/qa");
			}
		}
	});
});
</script>

<script>
				
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$("#modify").on("click", function(){
		formObj.attr("action", "/community/questionboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#remove").on("click", function(){
		formObj.attr("action", "/community/questionboard/removePage");
		formObj.submit();
	});
	
	$("#answer").on("click", function(){
		formObj.attr("action", "/community/questionboard/answerReply");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#golist").on("click", function(){
		formObj.attr("action", "/community/questionboard/listPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
});

</script>
	</div>
    </div>
</article>
<%@include file="/resources/include/footer.jsp"%>
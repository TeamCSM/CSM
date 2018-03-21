<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Verdana' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/customer/css/main.css" />
 <head>
 <title>쪽지</title>
 </head>
<body>
<div class="container" style="max-width: 45em;">
 <h4><span style="color: red;">${login.user_name }</span>님 환영합니다</h4>
  <c:choose>
	<c:when test="${type eq send}">
	<div class="row">
		<span><span style="color: red;">${login.user_name }</span>님의 보낸 쪽지입니다.</span>
	</div>
	<br />
  	<form action="../message/removePage" method="post" role="form">
  		<input type="hidden" value="${list.messagenum }" name="messagenum" />
  		<input type="hidden" value="${login.user_id }" name="senderid" />
		<input type="hidden" value="${login.user_name }"  name="name" />
		<h4>제목</h4>
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.title }" readonly="readonly"
				style="width: 224%"/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
		<h4>받는 사람</h4>	
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.receiverid }" readonly="readonly"
				style="width: 224%"/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
		<h4>내용</h4>
      	<div class="input-group input-group-icon">
      		<textarea name="content" id="content" cols="70" rows="10"
      			readonly="readonly" style="background-color:#f9f9f9; color:#white;">${list.content }</textarea>
		</div>
		<h4>날짜</h4>
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.regidate }" readonly="readonly"
				style="width: 224%"/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
<div class="text-center">
  	<div>
	  	<span class="button-effect1" style="margin-top:50px; margin-right: 420px;">
			<input class="effect effect-3" type="submit" title="Learn More" value="삭제" tabindex=4>
		</span>
	</div>
	<div>
		<span class="button-effect2" style="margin-left: -200px;">
			<input class="effect effect-3" type="button" title="Learn More" value="취소" onclick="javascript:cancel();" tabindex=5>
		</span>
	</div>
</div>
	<br />
	<br />
 </form>
	</c:when>
	<c:otherwise>
		<div class="row">
		<span><span style="color: red;">${login.user_name }</span>님의 받은 쪽지입니다.</span>
	</div>
	<br />
  	<form action="../message/removePage" method="post" role="form">
  		<input type="hidden" value="${list.messagenum }" name="messagenum" />
  		<input type="hidden" value="${login.user_id }" name="senderid" />
		<input type="hidden" value="${login.user_name }"  name="name" />
		<h4>제목</h4>
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.title }" readonly="readonly"
			style="width: 224%"/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
		<h4>보낸 사람</h4>	
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.senderid }" readonly="readonly"
			style="width: 224%" />
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
		<h4>내용</h4>
      	<div class="input-group input-group-icon">
      		<textarea name="content" id="content" cols="70" rows="10"
      			readonly="readonly" style="background-color:#f9f9f9; color:#white;">${list.content }</textarea>
		</div>
		<h4>날짜</h4>
		<div class="input-group input-group-icon">
			<input class="title" type="text" name="title" value="${list.regidate }" readonly="readonly"
			style="width: 224%"/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
<div class="text-center">
  	<div>
	  	<span class="button-effect1" style="margin-top:50px; margin-right: 420px;">
			<input class="effect effect-3" type="submit" title="Learn More" value="삭제" tabindex=4>
		</span>
	</div>
	<div>
		<span class="button-effect2" style="margin-left: -200px;">
			<input class="effect effect-3" type="button" title="Learn More" value="취소" onclick="javascript:cancel();" tabindex=5>
		</span>
	</div>
</div>
	<br />
	<br />
 </form>
	</c:otherwise>
</c:choose>
</div>	
<script type="text/javascript">
	function cancel(){
		self.location="/user/message/messageHome";
	}
</script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="/resources/customer/js/register.js">
</script>
</body> 
</html>
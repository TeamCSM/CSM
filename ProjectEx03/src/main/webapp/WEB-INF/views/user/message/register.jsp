<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="row">
		<span><span style="color: red;">${login.user_name }</span>님의 보낼 쪽지입니다.</span>
	</div>
	<br />
  	<form action="../message/register" method="post" role="form">
  		<input type="hidden" value="${login.user_id }" name="senderid" />
		
		<div class="input-group input-group-icon">
			<input class="title" type="text" placeholder="제목" name="title" 
			style="width: 224%" tabindex=1/>
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
			</div>
		</div>
      	<div class="input-group input-group-icon">
			<input type="text" placeholder="받는 사람" name="receiverid" required="required" 
			style="width: 224%" tabindex=2 />
			<div class="input-icon">
				<i class="fa fa-user-o"></i>
			</div>
		</div>	
		
      	<div class="input-group input-group-icon">
      		<textarea name="content" id="content" cols="70" rows="10" tabindex=3></textarea>
		</div>
<div class="text-center">
  	<div>
	  	<span class="button-effect1" style="margin-top:50px; margin-right: 420px;">
			<input class="effect effect-3" type="submit" title="Learn More" value="등록" tabindex=4>
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
</div>
<script type="text/javascript">
	function cancel(){
		self.location="messageHome";
	}
</script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="/resources/customer/js/register.js"></script>
</body> 
</html>
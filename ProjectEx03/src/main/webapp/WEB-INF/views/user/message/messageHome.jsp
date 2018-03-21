<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	if('${msg}'=='SUCCESS'){
		$.ajax({
			url : "../message/myMessage",
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);
			}
		});
	}else{
		$.ajax({
			url : "/user/message/yourMessage",
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);
			}
		});
	}
	
	$("#myMessage").click(function(){
		$.ajax({
			url : "../message/myMessage",
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);
			}
		});
	});
	
	$("#yourMessage").click(function(){
		$.ajax({
			url : "../message/yourMessage",
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);
			}
		});
	});
	
	$("#register").click(function(){
		$.ajax({
			url : "../message/register",
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);
			}
		});
	});

});
</script>
</head>
<body>
<div>
	<button class="btn btn-info" id="myMessage">보낸쪽지함</button>
	<button class="btn btn-info" id="yourMessage">받은쪽지함</button>
	<button class="btn btn-info" id="register">쪽지쓰기</button>
</div>
<div id="messageAjax">
	
</div>
</body>
</html>
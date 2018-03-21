<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/customer/css/main.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if('${msg}'=='success') {
		alert('결제가 완료되었습니다.');
		window.close();
	}
});
</script>
<title>포인트 결제</title>
<style>
h4{
	margin-bottom: 0px;
}
input{
	width: 100%;
}
.container{
	padding: 1em 5em 4em 5em;
}
#user_point{
	text-align: center;
	width: 30%;
	margin-bottom: 5%;
}
.fa{
	margin-top: 35%;
}
.effect-3{
	margin-left: -6%;
	margin-top: -6px;
}
</style>
</head>
<body>
<div class="container">
	<h2>포인트 결제</h2>
	<hr />
	<br />
	<form name="user_point" method="post">
		<input type="hidden" name="user_id" value="${login.user_id }"/>
		<input type="radio" value="5000" id="5000" name="user_point"/> <label for="5000">5000</label>
		<input type="radio" value="10000" id="10000" name="user_point"/> <label for="10000">10000</label>
		<input type="radio" value="15000" id="15000" name="user_point"/> <label for="15000">15000</label>
		<input type="radio" value="20000" id="20000" name="user_point"/> <label for="20000">20000</label>
		<input type="radio" value="30000" id="30000" name="user_point"/> <label for="30000">30000</label>
		<input type="radio" value="50000" id="50000" name="user_point"/> <label for="50000">50000</label>
		<br/>
		<input type="submit" value="결제하기"/>
	</form>
</div>
</body>
</html>
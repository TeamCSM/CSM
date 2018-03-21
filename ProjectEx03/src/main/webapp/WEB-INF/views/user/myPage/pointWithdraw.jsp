<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Verdana' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/customer/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if('${msg}'=='success') {
		var point = ${pointWithdraw};
		var result = point - (point * 0.05);
		
		alert(result +"원이 출금되었습니다.");
		window.close();
	}
});
</script>
<title>포인트 출금</title>
</head>
<body>
<div class="container" style="padding: 1em 5em 3em 5em;">
	<h2>포인트 출금하기</h2>
	<hr />
	<form method="post" name="formdata" id="formdata">
		<input type="hidden"  name="user_id" value="${point.user_id }"/>
		<h4 style="margin-bottom: 0px;">보유 포인트</h4>
		<br />
		<div class="input-group input-group-icon">
			<input type="text" id="user_point" name="user_point1" value="${point.user_point }" readonly="readonly"
			style="width: 90%; float: left;"/>
			<div class="input-icon">
				<i class="fa fa-product-hunt" style="margin-top: 35%;"></i>
			</div>
		</div>
		<div class="input-group input-group-icon">
			<input class="title" type="text" placeholder="출금할 금액을 입력하세요." id="user_point" 
			name="user_point" style="width: 147%;" tabindex=1/>
			<div class="input-icon">
				<i class="fa fa-credit-card" style="margin-top: 35%;"></i>
			</div>
		</div>
		<input type="submit" value="출금하기" value="결제하기" style="width: 100%;"/>
<!-- <div class="text-center">
  	<div>
	  	<span class="button-effect1" style="margin-top:50px; margin-right: 420px;">
			<input class="effect effect-3" type="submit" title="Learn More" value="등록" tabindex=4
				 style="margin-left: -6%;
						margin-top: 22px;">
		</span>
	</div>
</div> -->
	</form>
</div>
</body>
</html>
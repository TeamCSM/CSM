<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/user/css/join/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/user/css/join/blue.css" rel="stylesheet"	type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	$('#passFindBtn').click(function() {
		
		var count = 0;

		if($('#user_id').val()==""){
			$('#idMsg').html("아이디를 입력 해주세요.").css({'display':'inline'});
			count++;
		}
		
		if(count>0){
			return;
		}
		
		$.ajax({
			url : "/user/find/passFindConfirm",
			dataType : "html",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				user_id : $('#user_id').val()
			},
			success : function(data) {
				     
				$('#passFindForm').html(data);
			},
			error : function(e) {
				alert("오류발생 : "+e.status+" "+e.statusText);
			}
		});
		return false;
	});
});

</script>
<style type="text/css">
.screen_out{
	display: none;
}
.error{
	color: red;
	font-weight: bold;
}
li{
	list-style-type: none;
}
</style>
</head>
<body class="login-page">
	<div class="login-box" id="passFindForm">
		<div class="login-logo" >
			<a href="/user/find/passFind"><span class="glyphicon glyphicon-user"> 비밀번호찾기</span></a>
		</div>
		<div id="passFindMsg">
			<p class="desc_g"><strong>비밀번호가 기억나지 않아 답답하셨나요?</strong>
			<br>아이디를 입력하시면, 찾을 수 있는 방법을 알려드려요.</p>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
	        
            
        <div class="cont_g">
                
                <div class="info_detail" id="findPassHome">
                    <fieldset>
                        <legend class="screen_out">비밀번호찾기 인증 목록 폼</legend>
                        
                        <div class="form-group has-feedback">
							<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디" />
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
							<span id="idMsg" class="error"></span>
						</div>
						
						<input type="button" id="passFindBtn" value="다음단계" class="btn btn-success">
                        
                    </fieldset>
                </div>
            </div>
            <hr />
            <ul class="list_method">
                <li>
                    아이디를 찾으시나요? <a href="/user/find/idFind" class="link_tip">아이디 찾기</a><span class="ico_find ico_more"></span>
                </li>
            </ul>
        </div>
        <!--// mArticle -->
    </div>
    <!-- // cMain -->

</body>
</html>
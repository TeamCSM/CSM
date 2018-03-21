<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 일부확인</title>
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
	
	$('#emailCertiView').click(function() {
		
		$('#emailCertiView').hide();
		$('#emailCerti').fadeIn(1000);
	});
	
	$("#sandMail").on('click', function() {
    	if($('#user_email').val()==""){
    		$('#user_emailMsg').html("이메일을 입력 해주세요.");
    		return false;
    	}
    	$.ajax({
			url : "/mail/mailCertification",
			dataType : "text",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				email : $('#user_email').val()
			},
			success : function(data) {
				           
				alert("인증메일 발송 완료!");
				$('#user_emailKey').val(data);
				
			},
			error : function(e) {
				alert("오류발생 : "+e.status+" "+e.statusText);
				
			}
		});
	});
	
	$('#realIdFindBtn').click(function() {
		
		var check = document.formdata;
		var count = 0;
		
		if(check.user_email.value==""){
			$('#user_emailMsg').html("이메일을 입력 해주세요.");
			check.user_email.focus();
			count++;
		}
		if(check.certification.value==""){
			$('#certificationMsg').html("이메일 인증을 해주세요.");
			check.certification.focus();
			count++;
		}
		if(check.user_emailKey.value!=check.certification.value){
			$('#user_emailMsg').html("");
			$('#certificationMsg').html("인증번호가 다릅니다!");
			count++;
		}
		
		if(count>0){
			return;
		}else{
			$.ajax({
				url : "/user/find/realIdFind",
				dataType : "json",
				type : "get",
				contentType : "text/html; charset:utf-8",
				data : {
					user_name : '${param.user_name}',
					user_email : '${param.user_email}',
					user_gender : '${param.user_gender}',
					user_birthday : '${param.user_birthday}'
				},
				success : function(data) {
			           
					var move = confirm("고객님의 아이디 : "+data.user_id+" 로그인페이지로 이동하시겠습니까?");
					if(move){
						location.href='/user/login';
					}else{
						location.href='/';
					}
				},
				error : function(e) {
					alert("오류발생 : "+e.status+" "+e.statusText);
					
				}
			});
		}
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
	<div class="login-box">
		<div class="login-logo">
			<a href="/user/find/userId"><span class="glyphicon glyphicon-user"> 아이디찾기</span></a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
	        
        	<div class="cont_g">
        		<c:if test="${not empty param.user_email}">
        			<strong style="color: blue;">(${param.user_name} / ${param.user_email})</strong>
        		</c:if>
        		<c:if test="${not empty param.user_birthday}">
        			<strong style="color: blue;">(${param.user_name} / ${param.user_gender} / ${param.user_birthday})</strong>
        		</c:if><span><br /> 정보로 찾은 아이디입니다.<br />
				개인정보 보호를 위해 아이디는 8자리로, 뒤에 4자리는 *로 표기됩니다.<br />
				이메일 인증후 전체 아이디를 볼 수 있습니다.</span>
				<hr />
				<span>아이디 : ${userInfo.user_id}<strong style="color: blue;"> (가입일 : ${userInfo.user_regdate})</strong></span>
				<br /><button id="emailCertiView" class="btn btn-success">이메일 인증을 통한 전체아이디 확인하기</button>
				<div id="emailCerti" style="display: none;">
					<form name="formdata">
					<input type="hid den" id="user_emailKey"/>
					<div id="user_emailDiv" class="form-group has-feedback">
						<input type="text" name="user_email" id="user_email" class="form-control"
							placeholder="본인확인 이메일" /><span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
						<div id="user_emailMsg" class="error"></div>
					</div>
					<div id="certificationDiv" class="form-group has-feedback">
						<input type="text" name="certification" id="certification" class="form-control"
							placeholder="인증번호" style="width: 150px; display: inline-block;"/>&nbsp;&nbsp;
						<button type="button" class="btn btn-info" id="sandMail" style="display: inline-block;">인증번호 발송</button>
						<div id="certificationMsg" class="error"></div>
					</div>
					</form>
					<button type="button" id="realIdFindBtn" class="btn btn-success">확인하기</button>
				</div>
               	
            </div>
            <hr />
            <ul class="list_method">
                <li>
                    비밀번호를 찾으시나요? <a href="/user/find/passFind" class="link_tip">비밀번호 찾기</a><span class="ico_find ico_more"></span>
                </li>
            </ul>
        </div>
        <!--// mArticle -->
    </div>
    <!-- // cMain -->

</body>
</html>
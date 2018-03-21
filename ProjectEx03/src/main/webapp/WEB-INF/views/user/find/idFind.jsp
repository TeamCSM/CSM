<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
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
	$( "#user_birthday" ).datepicker({
		showButtonPanel: true, //today
		changeMonth: true, //월 셀렉트 보이기
	    changeYear: true //년 셀렉트 보이기
	}); 
    $( "#user_birthday" ).datepicker( "option", "dateFormat", "yy-mm-dd");
    $( "#user_birthday" ).datepicker( "option", "showAnim", "slide" );
    
    $('#inpCertify1').click(function() {
    	$('.find_info').css({'display':'none'});
    	$('#nameMsg').css({'display':'none'});
    	$('#user_emailMsg').css({'display':'none'});
    	$('#email_info').css({'display':'inline'});
    	$('#user_name').val("");
    	$('#user_email').val("");
	});
    $('#inpCertify2').click(function() {
    	$('.find_info').css({'display':'none'});
    	$('#nameMsg2').css({'display':'none'});
    	$('#user_birthdayMsg').css({'display':'none'});
    	$('#info_person').css({'display':'inline'});
    	$('#user_name2').val("");
    	$('#user_birthday').val("");
	});
});

 function inpCertify1Check() {
	var count = 0;
	
	
	
	if($('#user_name').val()==""){
		$('#nameMsg').html("이름을 입력 해주세요.").css({'display':'inline'});
		count++;
	}
	if($('#user_email').val()==""){
		$('#user_emailMsg').html("이메일을 입력 해주세요.").css({'display':'inline'});
		count++;
	}
	if(count>0){
		return false;
	}
	
	$.ajax({
		url : "/user/find/idFindConfirm",
		dataType : "json",
		type : "get",
		contentType : "text/html; charset:utf-8",
		data : {
			user_name : $('#user_name').val(),
			user_email : $('#user_email').val()
		},
		success : function(data) {
			     
			if(data.result){
				//alert(data.user_id+"가 존재합니다.");
				location.href = '/user/find/idFindResult?user_name='+$("#user_name").val()+'&user_email='+$("#user_email").val();
			}else{
				alert("해당 아이디가 존재하지 않습니다.");
			}
		},
		error : function(e) {
			alert("오류발생 : "+e.status+" "+e.statusText);
		}
	});
	return false;
}
 function inpCertify2Check() {
		var count = 0;
		
		if($('#user_name2').val()==""){
			$('#nameMsg2').html("이름을 입력 해주세요.").css({'display':'inline'}).css({'display':'inline'});
			count++;
		}
		if($('#user_birthday').val()==""){
			$('#user_birthdayMsg').html("태어난 년도를 정확하게 입력하세요.").css({'display':'inline'});
			count++;
		}
		if(count>0){
			return false;
		}
			
		var params = $('#find_person').serialize();
		
		$.ajax({
			url : "/user/find/idFindConfirm",
			dataType : "json",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : params,
			success : function(data) {
				     
				if(data.result){
					//alert(data.user_id+"가 존재합니다.");
					location.href = '/user/find/idFindResult?'+params;
				}else{
					alert("해당 아이디가 존재하지 않습니다.");
				}
			},
			error : function(e) {
				alert("오류발생 : "+e.status+" "+e.statusText);
			}
		});
		return false;
	}
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
            <p class="desc_g"><strong>아이디를 모르시나요?</strong><br>아이디 찾기 방법 중 가능한 방법을 선택해 주세요.</p>
		<!-- /.login-logo -->
		<div class="login-box-body">
	        
        <div class="cont_g">
                
                <div class="info_detail" id="findIdHome">
                    <fieldset>
                        <legend class="screen_out">아이디찾기 인증 목록 폼</legend>
                        <ul class="list_certify">
                              <li>
                                <span class="choice_comm">
                                    <input type="radio" id="inpCertify1" name="searchType" class="inp_comm">
                                    <label for="inpCertify1" class="lab_comm">
                                        <span class="ico_find"></span>내 정보에 등록된 이메일로 찾기
                                    </label>
                                </span>
                                <div id="email_info" class="find_info" style="display: none;">
                                <form id="find_email" action="/user/find/email" method="post" onsubmit="return inpCertify1Check()">
                                    <div class="form-group has-feedback">
										<input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름" /> 
										<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
										<span id="nameMsg" class="error"></span>
									</div>
                                    <div id="user_emailDiv" class="form-group has-feedback">
										<input type="text" name="user_email" id="user_email" class="form-control" placeholder="본인확인 이메일" />
										<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
										<div id="user_emailMsg" class="error"></div>
									</div>
									 <button type="submit" class="btn btn-success">다음단계</button>
                                </form>
                                </div>
                            </li>
                               <li>
                                <span class="choice_comm">
                                    <input type="radio" id="inpCertify2" name="searchType" class="inp_comm" value="birth">
                                    <label for="inpCertify2" class="lab_comm">
                                        <span class="ico_find"></span>이름 / 생년월일 / 성별로 찾기
                                    </label>
                                </span>
                                <div id="info_person" class="find_info" style="display: none;">
                                <form id="find_person" action="/user/find/person" method="post" onsubmit="return inpCertify2Check()">
                                    <div class="area_person">
                                        <div class="form-group has-feedback">
											<input type="text" id="user_name2" name="user_name" class="form-control" placeholder="이름" /> 
											<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
											<span id="nameMsg2" class="error"></span>
										</div>
                                        <div id="user_genderDiv" class="form-group">
											<span class="row_title blind"> 성별 </span> 
											<span class="user_gender">
												<span class="jender">
													<input type="radio" id="man" name="user_gender" value="남자" checked="checked">
													<label id="manLb" for="man">남자 </label>
												</span>
												<span class="jender">
													<input type="radio" id="woman" name="user_gender" value="여자">
													<label id="womanLb" for="woman">여자 </label></span>
												</span> 
										</div>
										<div id="user_birthdayDiv" class="form-group has-feedback">
											<div class="join_birth">
												<input class="form-control" type="text" id="user_birthday" name="user_birthday" placeholder="생일">					
											</div><span
												class="glyphicon glyphicon-heart form-control-feedback"></span>
											<span id="user_birthdayMsg" class="error"></span>
										</div>
											
                                        </div>

                                    <button type="submit" class="btn btn-success">다음단계</button>
                                </form>
                                 </div>
                            </li>                     
                        </ul>
                    </fieldset>
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
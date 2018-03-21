<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Verdana' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/resources/user/css/main.css" />
<!-- background -->
<link href='https://fonts.googleapis.com/css?family=Raleway:200,400,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="/resources/user/css/space.css">
<script  src="/resources/user/js/space.js"></script>
<!-- /background -->
<link rel="stylesheet" href="/resources/user/css/join/css/button.css" />
<script src="/resources/user/css/join/js/index.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
h4{
	color: white;
}
input:focus {
  outline: 0;
  border-color: #e5e5e5;
}
input:focus + .input-icon i {
  color: #e5e5e5;
}
input:focus + .input-icon:after {
  border-right-color: #e5e5e5;
}
input[type="radio"]:checked + label, input:checked + label:before, select:focus, select:active {
    color: orange;
}
</style>
<script type="text/javascript">
$().ready(function() {
	
   /*  checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional */
    
    $("#signUpMail").on('click', function(event) {
    	
    	event.preventDefault();
    	
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
    
    $('#signUpJuso').click(function() {
		
    	event.preventDefault();
    	            
    	 new daum.Postcode({
             oncomplete: function(data) {
     			
             	var juso = document.formdata;
             	juso.user_mailNumber.value = data.zonecode;
             	juso.user_streetAddr.value = data.address;
             	             	
             	juso.user_detailedAddr.focus();
             }
         }).open({
			autoClose: true
         });
	});
});
 function allCheck() {
	
	var check = document.formdata;
	var count = 0;
	if(check.user_id.value==""){
		
		$('#idMsg').html("아이디를 입력 해주세요.");
		check.user_id.focus();
		count++;
	} 
	if(check.user_name.value==""){
		$('#nameMsg').html("이름을 입력 해주세요.");
		check.user_name.focus();
		count++;
	}
	if((check.user_gender[0].checked==false) && (check.user_gender[1].checked==false)){
		$('#user_genderMsg').html("성별을 입력 해주세요.");
		count++;
	}
	if(check.user_birthday.value==""){
		$('#user_birthdayMsg').html("태어난 년도를 정확하게 입력하세요.");
		check.user_birthday.focus();
		count++;
	}
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
	if(check.user_pass.value==""){
		$('#passMsg1').html("비밀번호 입력을 해주세요.");
		check.user_pass.focus();
		count++;
	}
	if(check.user_pw2.value==""){
		$('#passMsg1').html("비밀번호 확인란에 입력을 해주세요.");
		check.user_pw2.focus();
		count++;
	}
	if(check.user_pass.value!=check.user_pw2.value){
		$('#passMsg2').html("비밀번호가 다릅니다.").css({'color':'red'});
		check.user_pw2.focus();
		count++;
	}
	if((check.user_pass.value!="" && check.user_pw2.value!="") && check.user_pass.value==check.user_pw2.value){
		$('#passMsg1').html("");
		$('#passMsg2').html("비밀번호 일치").css({'color':'green'});
	}
	if(check.user_emailKey.value!=check.certification.value){
		
		$('#certificationMsg').html("인증번호가 다릅니다.");
		count++;
	}
	if((check.user_email.value!="" && check.certification.value!="") && check.user_emailKey.value==check.certification.value){
		$('#user_emailMsg').html("");
		$('#certificationMsg').html("이메일 인증완료").css({'color':'green'});
	}
	if(check.user_phone.value==""){
		$('#user_phoneMsg').html("휴대폰번호를 입력해주세요.");
		check.user_phone.focus();
		count++;
	}
	if(check.user_mailNumber.value==""){
		$('#user_jusoMsg').html("주소찾기를 통해 주소를 입력을 해주세요.");
		check.user_mailNumber.focus();
		count++;
	}
	if(check.user_streetAddr.value==""){
		$('#user_jusoMsg').html("주소찾기를 통해 주소를 입력을 해주세요.");
		check.user_streetAddr.focus();
		count++;
	}
	if(check.user_detailedAddr.value==""){
		$('#user_jusoMsg').html("상세주소를 입력을 해주세요.");
		check.user_detailedAddr.focus();
		count++;
	}
	
	if(count>0){
		return false;
	}
}

 $( function() {
	 $("#user_birthday").datepicker({
			showButtonPanel: true, //today
			changeMonth: true, //월 셀렉트 보이기
		    changeYear: true //년 셀렉트 보이기
		}); 
	    $("#user_birthday").datepicker( "option", "dateFormat", "yy-mm-dd");
	    $("#user_birthday").datepicker( "option", "showAnim", "slide" );
});

</script>
<style type="text/css">
.error{
	color: red;
	font-weight: bold;
}
</style>
</head>
<body  id="large-header" class="large-header" style="background-color: gray; overflow:auto; overflow:auto;">

	<div class="container" id="demo-canvas" id="large-header" class="large-header" >
		<div class="row text-center">
			<a href="/" style="color: yellowgreen; font-size: 4em; font-weight: bold; text-decoration: none;">
				<img src="/resources/include/img/csm_logo.png" width="200"></a>
		</div>
		<hr />
		<form action="/user/join/signUpRegister" method="post" onsubmit="return allCheck()" name="formdata">
			<input type="hidden" name="user_termsService" value="${userTerms.user_termsService }"/>
			<input type="hidden" name="user_termsPrivacy" value="${userTerms.user_termsPrivacy }"/>
			<input type="hidden" name="user_termsLocation" value="${userTerms.user_termsLocation }"/>
			<input type="hidden" name="user_termsEmail" value="${userTerms.user_termsEmail }"/>
			<input type="hidden" id="user_emailKey"/>
			<div class="row" style="margin: inherit; margin-left: 10px;">
				<h4>기본정보</h4>
				<div class="input-group input-group-icon">
					<input type="text" name="user_id" placeholder="아이디" />
					<div class="input-icon">
						<i class="fa fa-user"></i>
					</div>
					<div id="idMsg" class="error"></div>
				</div>
				<div class="input-group input-group-icon">
					<input type="password" name="user_pass" placeholder="비밀번호" />
					<div class="input-icon">
						<i class="fa fa-key"></i>
					</div>
					<div id="passMsg1" class="error"></div>
				</div>
				<div class="input-group input-group-icon">
					<input type="password" name="user_pw2" placeholder="비밀번호 확인" />
					<div class="input-icon">
						<i class="fa fa-unlock-alt"></i>
					</div>
					<div id="passMsg2" class="error"></div>
				</div>
				<div class="input-group input-group-icon">
					<input type="text" name="user_name" placeholder="이름" />
					<div class="input-icon">
						<i class="fa fa-user-o"></i>
					</div>
					<div id="nameMsg" class="error"></div>
				</div>
				<div class="input-group input-group-icon">
					<input type="text" name="user_email" id="user_email" placeholder="이메일 주소" />
					<div class="input-icon">
						<i class="fa fa-envelope-o"></i>
					</div>
					<div id="user_emailMsg" class="error"></div>
				</div>
				<div class="input-group input-group-icon" >
					<input type="text" name="certification" id="certification" placeholder="인증번호" style="width: 225px;"/> 
					<span class="button-effect">
   						<a class="effect effect-3" href="#" id="signUpMail" title="보내기" style="background-color: #e5e5e5; color:black;">보내기</a>
 					</span>
						<div class="input-icon">
					</div>
					<div id="certificationMsg" class="error"></div>	
				</div>
				
				<div class="input-group input-group-icon">
					<input type="text" name="user_phone" id="user_phone" placeholder="전화번호" />
					<div class="input-icon">
						<i class="fa fa-phone"></i>
					</div>
					<div id="user_phoneMsg" class="error"></div>
				</div>
				
				<div class="input-group input-group-icon">
					<input type="text" name="user_mailNumber" id="user_mailNumber" class="address1" placeholder="우편번호"  readonly="readonly" style="width: 225px;"/>
					<span class="button-effect">
   						<a class="effect effect-3" href="#" id="signUpJuso" title="우편번호" style="background-color: #e5e5e5; color:black;">우편번호</a>
 					</span>
					<div class="input-icon">
						<i class="fa fa-location-arrow"></i>
					</div>
				</div>
				
				<div class="input-group input-group-icon">
					<input type="text" name="user_streetAddr" id="user_streetAddr" placeholder="도로명 주소" readonly="readonly"/>
					<div class="input-icon">
						<i class="fa fa-map-marker"></i>
					</div>
				</div>
				
				<div class="input-group input-group-icon">
					<input type="text" name="user_detailedAddr" id="user_detailedAddr" placeholder="상세주소" />
					<div class="input-icon">
						<i class="fa fa-map-marker"></i>
					</div>
					<div id="user_jusoMsg" class="error"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-half" style="margin-left: 25px;">
					<h4>생년월일</h4>
					<div class="input-group">
						<div class="col-third">
							<input type="text" id="user_birthday" name="user_birthday" placeholder="생년월일" />
						</div>
					</div>
					<div id="user_birthdayMsg" class="error"></div>
				</div>
				<div class="col-half" style="margin-left: 25px;">
					<h4>성별</h4>
					<div class="input-group">
						<input type="radio" name="user_gender" value="남자" id="gender-male" />
						<label for="gender-male">남자</label> <input type="radio"
							name="user_gender" value="여자" id="gender-female" /> <label
							for="gender-female">여자</label>
					</div>
					<div id="user_genderMsg" class="error"></div>	
				</div>
			</div>
			<div><span class="button-effect" style="margin-right: 380px;">
   						<button class="effect effect-3" type="submit" title="Learn More" style="color:black;">회원가입</button>
 				</span></div>
 			<br />
 			<br />
		</form>	

  </div>

</body>
</html>
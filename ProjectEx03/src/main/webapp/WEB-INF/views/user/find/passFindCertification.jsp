<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$().ready(function() {
	 $('#inpCertify1').click(function() {
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
	
	$('#newPassBtn').click(function() {
		
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
				url : "/user/find/newPass",
				dataType : "html",
				type : "get",
				contentType : "text/html; charset:utf-8",
				data : {
					user_id : '${userInfo.user_id}'
				},
				success : function(data) {
			           
					$('#passFindForm').html(data);
					
				},
				error : function(e) {
					alert("오류발생 : "+e.status+" "+e.statusText);
					
				}
			});
		}
	});
});

if('${result}' == false){

	alert("CSM에 등록된 아이디가 아닙니다.");
	location.href = "/user/find/passFind";
}
</script>
<div class="login-logo">
	<a href="/user/find/passFind"><span class="glyphicon glyphicon-user"> 비밀번호찾기</span></a>
</div>
<div id="passFindMsg">
	<p class="desc_g"><strong style="color: blue;">${userInfo.user_id}</strong>
	님, 인증 가능한 연락처를 선택한 후, 연락처 전체를 입력해 주세요. <br />
	개인정보보호를 위해 연락처는 일부분만 보여드리며, * 가 무작위로 표기됩니다.</p>	
</div>
<!-- /.login-logo -->
<div class="login-box-body">
      <div class="cont_g">
                
                <div class="info_detail" id="findPassHome">
<ul class="list_certify">
    <li>
      <span class="choice_comm">
          <input type="radio" id="inpCertify1" name="searchType" class="inp_comm"/>
          <label for="inpCertify1" class="lab_comm">
              이메일 인증 
              <small> (${userInfo.user_email})</small>
          </label>
      </span>
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
		<button type="button" id="newPassBtn" class="btn btn-success">확인하기</button>
		</div>
	
    </li>
</ul>
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
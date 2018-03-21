<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$().ready(function() {
	
	$('#newPassSaveBtn').click(function() {
		
		var count = 0;

		if($('#user_id').val()==""){
			$('#idMsg').html("비밀번호를 입력 해주세요.").css({'display':'inline'});
			count++;
		}
		
		if(count>0){
			return;
		}
		
		$.ajax({
			url : "/user/find/newPassSave",
			dataType : "json",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				user_id : '${userInfo.user_id}',
				user_pass : $('#user_pass').val()
			},
			success : function(data) {
				     
				if(data){
					var move = confirm("비밀번호가 성공정으로 재설정 되었습니다. 로그인페이지로 이동하시겠습니까?");
					if(move){
						location.href='/user/login';
					}else{
						location.href='/';
					}
				}else{
					alert("이전 비밀번호와 같습니다.");
				}
			},
			error : function(e) {
				alert("오류발생 : "+e.status+" "+e.statusText);
			}
		});
		return false;
	});
});
</script>
<div class="login-logo">
	<a href="/user/find/passFind"><span class="glyphicon glyphicon-user"> 비밀번호찾기</span></a>
</div>
<div id="passFindMsg">
	<p class="desc_g"><strong style="color: blue;">${userInfo.user_id}</strong>
	님, 이제 새로운 비밀번호로 재설정해 주세요.</p>	
</div>
<!-- /.login-logo -->
<div class="login-box-body">
      <div class="cont_g">
                
                
            <div class="info_detail" id="findPassHome">
                <fieldset>
                
				<div class="form-group has-feedback">
					<input type="text" id="user_pass" name="user_pass" class="form-control" placeholder="새 비밀번호를 입력해주세요." />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<span id="idMsg" class="error"></span>
				</div>
				
				<input type="button" id="newPassSaveBtn" value="완료" class="btn btn-success">
                    
                </fieldset>
            </div>

    </div>
    <hr />
    <h5>보안에 취약한 비밀번호는 사용하지 마세요!</h5>
</div>
<!--// mArticle -->
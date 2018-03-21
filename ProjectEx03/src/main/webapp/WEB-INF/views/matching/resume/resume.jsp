<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#user_birthday').val($('#birth').val());
	
	if('${msg}'=='success') {
		window.close();
	}
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">

<form id='resumeForm' role="form" method="post" action="/program/resume">
	<input type="hidden" name="idx" value="${param.idx }"/>
	<input type="hidden" name="type" value="${param.type }"/>
	<fmt:parseDate value="${resume.user_birthday}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
	<input type="hidden" id="birth" value="<fmt:formatDate value='${dateFmt}' pattern='yyyy-MM-dd'/>">
	
	<div class="form-group has-feedback">
		<input type="text" name="id" class="form-control" readonly="readonly"
			placeholder="아이디" value="${resume.user_id }"/> <span
			class="glyphicon glyphicon-envelope form-control-feedback"></span>
			<span id="idMsg" class="error"></span>
	</div>
	<div class="form-group has-feedback">
		<input type="text" name="name" class="form-control" readonly="readonly"
			placeholder="이름" value="${resume.user_name }"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	<div id="user_genderDiv" class="form-group">
		<span class="row_title blind"> 성별 </span> <span class="gender">
		<c:if test="${resume.user_gender eq '남자' }">
			<span class="jender">
				<input type="text" id="man" name="gender" class="form-control" value="남자" readonly="readonly">
			</span>
		</c:if>
		
		<c:if test="${resume.user_gender eq '여자' }">
			<span class="jender">
				<input type="text" id="woman" name="gender" class="form-control" value="여자" readonly="readonly">
			</span>
		</c:if>
		</span> <span id="user_genderMsg" class="error"></span>
	</div>
	<div id="user_birthdayDiv" class="form-group has-feedback">
		<div class="join_birth">
			<input class="form-control" type="text" id="user_birthday" name="user_birthday" placeholder="생일" readonly="readonly">					
		</div><span
			class="glyphicon glyphicon-heart form-control-feedback"></span>
		<span id="user_birthdayMsg" class="error"></span>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="phonenumber" id="phonenumber" class="form-control" value="${resume.user_phone }"
			placeholder="휴대폰 번호" readonly="readonly"/><span
			class="glyphicon glyphicon-phone form-control-feedback"></span>
		<div id="user_phoneMsg" class="error"></div>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="mailNumber" id="mailNumber" class="form-control"
			placeholder="우편번호" style="width: 150px; display: inline-block;" readonly="readonly" value="${resume.user_mailNumber }"/>&nbsp;&nbsp;
			<input type="text" name="streetAddr" id="streetAddr" class="form-control" value="${resume.user_streetAddr }"
			placeholder="도로명 주소" readonly="readonly"/>
		<input type="text" name="detailedAddr" id="detailedAddr" class="form-control"
			placeholder="상세주소" readonly="readonly" value="${resume.user_detailedAddr }"/>
		<div id="user_jusoMsg" class="error"></div>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="career" class="form-control"
			placeholder="경력사항"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="award" class="form-control"
			placeholder="수상내역"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	
	<button type="submit" class="btn btn-info">이력서 제출하기</button>
	
</form>
</div>
</body>
</html>
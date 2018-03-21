<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
	
	<c:if test="${resumeVO.type eq 'p' }">
	<div class="form-group has-feedback">
		<input type="text" name="id" class="form-control" readonly="readonly"
			placeholder="아이디" value="${resumeVO.id }"/> <span
			class="glyphicon glyphicon-envelope form-control-feedback"></span>
			<span id="idMsg" class="error"></span>
	</div>
	<div class="form-group has-feedback">
		<input type="text" name="name" class="form-control" readonly="readonly"
			placeholder="이름" value="${resumeVO.name }"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	<div id="user_genderDiv" class="form-group">
		<span class="row_title blind"> 성별 </span> <span class="gender">
		<c:if test="${resumeVO.gender eq '남자' }">
			<span class="jender">
				<input type="text" id="man" name="gender" class="form-control" value="남자" readonly="readonly">
			</span>
		</c:if>
		
		<c:if test="${resumeVO.gender eq '여자' }">
			<span class="jender">
				<input type="text" id="woman" name="gender" class="form-control" value="여자" readonly="readonly">
			</span>
		</c:if>
		</span> <span id="user_genderMsg" class="error"></span>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="phonenumber" id="phonenumber" class="form-control" value="${resumeVO.phonenumber }"
			placeholder="휴대폰 번호" readonly="readonly"/><span
			class="glyphicon glyphicon-phone form-control-feedback"></span>
		<div id="user_phoneMsg" class="error"></div>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="mailNumber" id="mailNumber" class="form-control"
			placeholder="우편번호" style="width: 150px; display: inline-block;" readonly="readonly" value="${resumeVO.mailNumber }"/>&nbsp;&nbsp;
			<input type="text" name="streetAddr" id="streetAddr" class="form-control" value="${resumeVO.streetAddr }"
			placeholder="도로명 주소" readonly="readonly"/>
		<input type="text" name="detailedAddr" id="detailedAddr" class="form-control"
			placeholder="상세주소" readonly="readonly" value="${resumeVO.detailedAddr }"/>
		<div id="user_jusoMsg" class="error"></div>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="career" class="form-control"
			placeholder="경력사항" value="${resumeVO.career }" readonly="readonly"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="award" class="form-control"
			placeholder="수상내역" value="${resumeVO.award }" readonly="readonly"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	<form method="post" role="form">
	<input type="hidden" name="title" value="${param.title }"/>
	<input type="hidden" name="id" value="${resumeVO.id }"/>
	<input type="hidden" name="sid" value="${param.sid }"/>
	<input type="hidden" name="idx" value="${param.idx }"/>
	<input type="hidden" name="uno" value="${param.uno }"/>
		<div class="box-footer">
			<button type="submit" class="btn btn-warning">수락하기</button>
			<button type="submit" class="btn btn-danger">거절하기</button>
		</div>
	</form>

		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");

				console.log(formObj);

				$(".btn-warning").on("click", function() {
					formObj.attr("action", "/program/pUpdate");
					formObj.attr("method", "post");
					formObj.submit();
				});

				$(".btn-danger").on("click", function() {
					formObj.attr("action", "/program/delete");
					formObj.submit();
				});
				
				if('${msg}'=='success') {
					window.close();
				}
			});
		</script>
	</c:if>
	
	<c:if test="${resumeVO.type eq 'd' }">
	<div class="form-group has-feedback">
		<input type="text" name="id" class="form-control" readonly="readonly"
			placeholder="아이디" value="${resumeVO.id }"/> <span
			class="glyphicon glyphicon-envelope form-control-feedback"></span>
			<span id="idMsg" class="error"></span>
	</div>
	<div class="form-group has-feedback">
		<input type="text" name="name" class="form-control" readonly="readonly"
			placeholder="이름" value="${resumeVO.name }"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	<div id="user_genderDiv" class="form-group">
		<span class="row_title blind"> 성별 </span> <span class="gender">
		<c:if test="${resumeVO.gender eq '남자' }">
			<span class="jender">
				<input type="text" id="man" name="gender" class="form-control" value="남자" readonly="readonly">
			</span>
		</c:if>
		
		<c:if test="${resumeVO.gender eq '여자' }">
			<span class="jender">
				<input type="text" id="woman" name="gender" class="form-control" value="여자" readonly="readonly">
			</span>
		</c:if>
		</span> <span id="user_genderMsg" class="error"></span>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="phonenumber" id="phonenumber" class="form-control" value="${resumeVO.phonenumber }"
			placeholder="휴대폰 번호" readonly="readonly"/><span
			class="glyphicon glyphicon-phone form-control-feedback"></span>
		<div id="user_phoneMsg" class="error"></div>
	</div>
	<div id="user_emailDiv" class="form-group has-feedback">
		<input type="text" name="mailNumber" id="mailNumber" class="form-control"
			placeholder="우편번호" style="width: 150px; display: inline-block;" readonly="readonly" value="${resumeVO.mailNumber }"/>&nbsp;&nbsp;
			<input type="text" name="streetAddr" id="streetAddr" class="form-control" value="${resumeVO.streetAddr }"
			placeholder="도로명 주소" readonly="readonly"/>
		<input type="text" name="detailedAddr" id="detailedAddr" class="form-control"
			placeholder="상세주소" readonly="readonly" value="${resumeVO.detailedAddr }"/>
		<div id="user_jusoMsg" class="error"></div>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="career" class="form-control"
			placeholder="경력사항" value="${resumeVO.career }" readonly="readonly"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	
	<div class="form-group has-feedback">
		<input type="text" name="award" class="form-control"
			placeholder="수상내역" value="${resumeVO.award }" readonly="readonly"/> <span
			class="glyphicon glyphicon-pencil form-control-feedback"></span>
			<span id="nameMsg" class="error"></span>
	</div>
	<form method="post" role="form">
	<input type="hidden" name="title" value="${param.title }"/>
	<input type="hidden" name="id" value="${resumeVO.id }"/>
	<input type="hidden" name="sid" value="${param.sid }"/>
	<input type="hidden" name="idx" value="${param.idx }"/>
	<input type="hidden" name="uno" value="${param.uno }"/>
		<div class="box-footer">
			<button type="submit" class="btn btn-warning">수락하기</button>
			<button type="submit" class="btn btn-danger">거절하기</button>
		</div>
	</form>

		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");
			
				console.log(formObj);

				$(".btn-warning").on("click", function() {
					formObj.attr("action", "/design/dUpdate");
					formObj.attr("method", "post");
					formObj.submit();
				});

				$(".btn-danger").on("click", function() {
					formObj.attr("action", "/program/delete");
					formObj.submit();
				});
				
				if('${msg}'=='success') {
					window.close();
				}
			});
		</script>
	</c:if>
</div>
</body>
</html>
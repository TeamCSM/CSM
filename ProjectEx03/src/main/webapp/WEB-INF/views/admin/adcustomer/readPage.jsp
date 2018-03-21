<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});
</script>
</head>
<body>
<div class="container">
<form role="form" method="post">
	<input type='hid den' name='bno' value="${list.bestq_bno}" readonly="readonly"/>
	<input type="hid den" name="page" value="${cri.page }" /> 
	<input type="hid den" name="perPageNum" value="${cri.perPageNum }" /> 
	<input type='hid den' name='searchType' value="${cri.searchType}"/>
	<input type='hid den' name='keyword' value="${cri.keyword}"/> 
</form>
<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label> <input type="text"
			name='bestq_title' class="form-control" value="${list.bestq_title}"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="bestq_content" rows="3"
			readonly="readonly">${list.bestq_content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label> <input type="text"
			name="bestq_writer" class="form-control" value="${list.bestq_writer}"
			readonly="readonly">
	</div>
</div>
<!-- /.box-body -->

<div class="box-footer">
	<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
	<button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
	<button type="submit" class="btn btn-primary goListBtn">LIST ALL</button>
</div>
</div>
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");

	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){
		formObj.attr("action", "/customer/sBestq/modifyPage");
		formObj.attr("method", "get");		
		/* 
		값을 전할 파하미터에 form태그에 감싸져있는 값을 대신 전해주는것
		그래서 파라미터로 notice_bno가 전해짐
		*/
		formObj.submit();
	});
	
	$(".removeBtn").on("click", function(){
		formObj.attr("action", "/customer/sBestq/removePage");
		formObj.submit();
	});
	
  	$(".goListBtn").on("click", function(){
	   	formObj.attr("method", "get");
	    formObj.attr("action", "/customer/sBestq/list");
	    formObj.submit();
	});

});
</script>

</body>
</html>
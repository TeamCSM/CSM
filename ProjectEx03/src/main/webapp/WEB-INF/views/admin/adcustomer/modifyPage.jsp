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
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<form role="form" method="post">
			
			<input type="hid den" name="page" value="${cri.page }"/>
			<input type="hid den" name="perPageNum" value="${cri.perPageNum }"/>
			<input type='hid den' name='searchType' value="${cri.searchType}">
			<input type='hid den' name='keyword' value="${cri.keyword}"> 
			<div class="box-body">

				<div class="form-group">
					<label for="exampleInputEmail1">BNO</label> <input type="text"
						name='bestq_bno' class="form-control" value="${bestQVO.bestq_bno}"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Title</label> <input type="text"
						name='bestq_title' class="form-control"
						value="${bestQVO.bestq_title}">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Content</label>
					<textarea class="form-control" name="bestq_content" rows="3">${bestQVO.bestq_content}</textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Writer</label> <input type="text"
						name="bestq_writer" class="form-control" value="${bestQVO.bestq_writer}">
				</div>
			</div>
			<!-- /.box-body -->
		</form>


		<div class="box-footer">
			<button type="submit" class="btn btn-primary">SAVE</button>
			<button type="submit" class="btn btn-warning">CANCEL</button>
		</div>
	</div>
<script>
$(document).ready(
		function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/customer/sBestq/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
		$(".btn-primary").on("click",
				function() {
					formObj.submit();
			});
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="google-signin-client_id" content="611239216207-jpj86rrqlb331v893q0hmu65o1i7kdru.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<title>title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$().ready(function(){
	
	
});
</script>
</head>
<body>
<div class="container">
	<button class="btn btn-info" onclick="location.href='../user/login'">로그인 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/market/marketHome'">포인트샵 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/user/myPage/myPageHome'">마이페이지 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/program/listAll'">구인구직 게시판 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/community/freeboard/listPage'">자유게시판 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/community/pointboard/PointBoard'">출석체크 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/community/questionboard/listPage'">지식 In 바로가기</button><br/>
	<button class="btn btn-info" onclick="location.href='/customer/sNotice/list'">공지사항 바로가기</button>
	<button class="btn btn-info" onclick="location.href='/customer/sContact/list'">1:1 문의하기 게시판 바로가기</button><br/>
	<button class="btn btn-info" onclick="location.href='/customer/sBestm/list'">베스트메뉴 게시판 바로가기</button><br/>
	<button class="btn btn-info" onclick="location.href='/customer/sBestq/list'">자주찾는질문 게시판 바로가기</button><br/>
	<button class="btn btn-info" onclick="location.href='/customer/sQna/list'">QnA 게시판 바로가기</button><br/>
	
</div>

</body>
</html>
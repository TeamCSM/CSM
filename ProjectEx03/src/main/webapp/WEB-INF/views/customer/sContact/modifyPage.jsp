<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head> -->

<%@include file="/resources/include/header.jsp"%>

<script type="text/javascript" src="/resources/include/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "/resources/include/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
	    

	});
</script>
<body>

<div id="container"><!-- skin : theme/basic --><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">수정하기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>

<section id="bo_w" class="container">
    <h2 id="container_title"></h2>
    <!-- 게시물 작성/수정 시작 { -->
    <form role="form" method="post">
    
    <input type="hidden" name="uid" value="18030523013123">
    <input type="hidden" name="w" value="">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="wr_id" value="0">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sst" value="">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="">
    <input type="hidden" value="html1" name="html">
    
    <input type="hidden" name="page" value="${cri.page }" />
	<input type="hidden" name="page" value="${cri.perPageNum }" />
	<input type="hidden" name="searchType" value="${cri.searchType }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name='contact_bno' class="form-control" value="${contactVO.contact_bno}" readonly="readonly">
    <div class="tbl_wrap table-responsive">
        <table class="table table-bordered">
        <tbody>
       
        <tr>
            <th scope="row"><label for="wr_name">이름</label></th>
            <td><input type="text" name="contact_writer" value="${contactVO.contact_writer}" readonly="readonly" 
            required class="form-control required" size="10" maxlength="20"></td>
        </tr>
        <tr>
            <th scope="row"><label for="wr_subject">제목</label></th>
            <td>
                <div id="autosave_wrapper">
                    <input type="text" name="contact_title"  required class="form-control required" 
                    value="${contactVO.contact_title}" size="50" maxlength="255">
        </div>
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="wr_content">내용<strong class="sound_only">필수</strong></label></th>
            <td class="wr_content">
			<textarea name="contact_content" id="editor" maxlength="65536" style="width:100%;height:300px">
			${contactVO.contact_content} </textarea>                          
			</td>
        </tr>
        
        </tbody>
        </table>
    </div>

    <div class="box-footer">
			<button type="submit" class="btn btn-primary">SAVE</button>
			<button type="submit" class="btn btn-warning">CANCEL</button>
		</div>
    </form>
 
</section>
<%@include file="/resources/include/footer.jsp"%>
<script>
$(document).ready(
		function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/customer/sContact/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

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

<div id="container"><!-- skin : theme/basic --><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">답글달기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>

<section id="bo_w" class="container">
    <h2 id="container_title"></h2>
    <!-- 게시물 작성/수정 시작 { -->
    <form role="form" method="post" id="insertBoardFrm" enctype="multipart/form-data">
    
    <input type='hidden' name='bno' value="${boardVO.bno}">
	<input type='hidden' name='bgroup' value="${boardVO.bgroup}">
	<input type='hidden' name='bstep' value="${boardVO.bstep}">
	<input type="hidden" name="page" value="${pm.page }" />
	<input type="hidden" name="perPageNum" value="${pm.perPageNum }" />
	<input type="hidden" name="searchType" value="${pm.searchType }" />
	<input type="hidden" name="keyword" value="${pm.keyword }" />
    
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
    <div class="tbl_wrap table-responsive">
        <table class="table table-bordered">
        <tbody>
        
        <tr>
			<th><label for="exampleInputEmail1">질문 종류</label></th>
			<td><input type="text" name='question' class="form-control" value="${boardVO.question}"
				readonly="readonly"></td>
		</tr>

		<tr>
			<th><label for="exampleInputEmail1">제목</label></th>
			<td><input type="text" name='title' class="form-control" readonly="readonly"
				value="${boardVO.title}"></td>
		</tr>
        <tr>
            <th scope="row"><label for="wr_name">이름<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="writer"  value="${login.user_id }" required class="form-control required" 
            size="10" maxlength="20" readonly="readonly"></td>
        </tr>
         
        <tr>
            <th scope="row"><label for="wr_content">내용<strong class="sound_only">필수</strong></label></th>
            <td class="wr_content">
			<textarea name="content" id="editor" maxlength="65536" style="width:100%;height:300px">
			</textarea>                          
			</td>
        </tr>
        
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="submit" value="작성완료" id="insertBoard" accesskey="s" class="btn btn-success">
        <a href="/community/questionboard/listPage" class="btn btn-primary">취소</a>
        
    </div>
    </form>
</section>
<%@include file="/resources/include/footer.jsp"%>
</body>
</html>
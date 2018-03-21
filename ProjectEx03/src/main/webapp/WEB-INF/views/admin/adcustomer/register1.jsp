<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<script type="text/javascript" src="/resources/include/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div id="container"><!-- skin : theme/basic --><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">글쓰기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>

<section id="bo_w" class="container">
    <h2 id="container_title"></h2>
    <!-- 게시물 작성/수정 시작 { -->
    <form id='registerForm' role="form" method="post" id="frm" style="width:100%" action="/admin/adcustomer/bestquestionwrite">
    <input type="hidden" name="uid" value="18022616304536">
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
            <th scope="row"><label for="wr_name">제목<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="bestq_title" value="" id="wr_name" required class="form-control required" size="10" maxlength="20"></td>
        </tr>
        
                <tr>
            <th scope="row"><label for="wr_password">작성자<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="bestq_writer" value="${login.user_name }" required class="form-control required" maxlength="20" readonly="readonly"></td>
        </tr>          							
        <tr>
            <th scope="row"><label for="wr_content">내용<strong class="sound_only">필수</strong></label></th>
            <td class="wr_content">
            	<textarea class="form-control" name="bestq_content" rows="3" id="editor" placeholder="내용을 입력하세요."></textarea>                          
            </td>
        
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="submit" value="작성완료" id="register" accesskey="s" class="btn btn-success">
        <a href="/admin/adcustomer/adcuBoardAlllist" class="btn btn-primary">취소</a>
    </div>
    </form>

    <script>
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "/resources/include/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#register").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#frm").submit();
        })
    })
    </script>
</section>
<!-- } 게시물 작성/수정 끝 --></div>
<%@include file="/resources/include/footer.jsp" %>
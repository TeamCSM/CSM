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
    <form role="form" method="post" id="frm" action="/customer/sContact/register" style="width:100%">
    
    <div class="tbl_wrap table-responsive">
        <table class="table table-bordered">
        <tbody>
        <tr>
            <th scope="row"><label for="wr_password">아이디<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="contact_id" value="${login.user_id }" required class="form-control required" maxlength="20" readonly="readonly"></td>
        </tr> 
        <tr>
            <th scope="row"><label for="wr_name">작성자<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="contact_writer" value="${login.user_name }" id="wr_name" required class="form-control required" size="10" maxlength="20" readonly="readonly"></td>
        </tr>
        <tr>    
			<th scope="row">선택문의</th>
			<td>
				<select class="form-control" name="contact_question" style="width: 100px;">
					<option value="결제">결제</option>
					<option value="로그인">로그인</option>
					<option value="회원가입">회원가입</option>
					<option value="회원정보">회원정보</option>
					<option value="회원탈퇴">회원탈퇴</option>
				</select>
			</td>
		</tr>
		<tr>
            <th scope="row"><label for="wr_name">제목<strong class="sound_only"> 필수</strong></label></th>
            <td><input type="text" name="contact_title" id="wr_name" required class="form-control required" size="10" maxlength="20" ></td>
        </tr> 
		<tr>
            <th scope="row"><label for="wr_content">내용<strong class="sound_only">필수</strong></label></th>
            <td class="wr_content">
            	<textarea class="form-control" name="contact_content" rows="3" id="editor" placeholder="내용을 입력하세요."></textarea>                          
            </td>
		<tr>
		
    <tr>
            <th scope="row">파일 #1</th>
            <td>
            	<input type="file" name="contact_file[]" title="파일첨부 1 :  용량 1,048,576 바이트 이하만 업로드 가능" class="frm_file form-control">
            </td>
        </tr> 
        
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="button" value="작성완료" id="register" accesskey="s" class="btn btn-success">
        <a href="../sContact/list" class="btn btn-primary">취소</a>
    </div>
    </form>

    <script>
    $(function(){
        //전역변수
        var obj = []; 
        var fromObj = $("#frm");
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
           	
            fromObj.submit();
        })
    })
    </script>
</section>
<!-- } 게시물 작성/수정 끝 --></div>
<%@include file="/resources/include/footer.jsp" %>
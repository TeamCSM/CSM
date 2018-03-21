<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<title>쇼핑몰0B</title>
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/css/mobile_shop.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/style.css?ver=161020">
<!--[if lte IE 8]>
<script src="http://witch01.dothome.co.kr/0b/js/html5.js"></script>
<![endif]-->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://witch01.dothome.co.kr/0b";
var g5_bbs_url   = "http://witch01.dothome.co.kr/0b/bbs";
var g5_is_member = "1";
var g5_is_admin  = "";
var g5_is_mobile = "1";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
var g5_shop_url = "http://witch01.dothome.co.kr/0b/shop";
var g5_theme_shop_url = "http://witch01.dothome.co.kr/0b/theme/b/shop";
</script>
<script src="http://witch01.dothome.co.kr/0b/js/jquery-1.8.3.min.js"></script>
<script src="http://witch01.dothome.co.kr/0b/js/common.js?ver=161020"></script>
<script src="http://witch01.dothome.co.kr/0b/js/wrest.js?ver=161020"></script>
<script src="http://witch01.dothome.co.kr/0b/js/modernizr.custom.70111.js"></script>
<script type="text/javascript" src="/resources/include/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript">
	if('${msg}'=='success'){
		alert("문의 작성에 성공하셨습니다.");
		window.close();
	}
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
    $("#itemInquiryBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#registerForm").submit();
    });
    
    $('#inquiry_secret').click(function() {
		
		if($('#inquiry_secret').val()==0){
			$('#inquiry_secret').val(1);
		}else{
			$('#inquiry_secret').val(0);
		}
	});
});
</script>
</head>
<body>
<div id="hd_login_msg">qweqwe님 로그인 중 <a href="http://witch01.dothome.co.kr/0b/bbs/logout.php">로그아웃</a></div>
<!-- 상품문의 쓰기 시작 { -->
<div id="sit_qa_write" class="new_win">
    <h1 id="win_title">상품문의 쓰기</h1>

    <form id="registerForm" name="fitemqa" method="post" action="/market/item/itemInquiryPopUp" onsubmit="return fitemqa_submit(this);" autocomplete="off">
    <input type="hidden" name="w" value="">
    <input type="hidden" name="it_id" value="1495680362">
    <input type="hidden" name="iq_id" value="">
    <input type="hidden" name="is_mobile_shop" value="1">
    <input type="hidden" name="item_idx" value="${param.item_idx}">

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <colgroup>
            <col class="grid_2">
            <col>
        </colgroup>
        <tbody>
        <tr>
            <th scope="row">옵션</th>
            <td>
                <input type="checkbox" id="inquiry_secret" name="inquiry_secret" value="0" >
                <label for="inquiry_secret"><strong>비밀글로 문의하기</strong></label> (상품 페이지에 노출되지 않고, 마이페이지 나의상품문의에서만 보이게 됩니다.)
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="inquiry_email">이메일</label></th>
            <td><input type="email" name="inquiry_email" value="" class="frm_input" size="30"> 이메일을 입력하시면 답변 등록 시 답변이 이메일로 전송됩니다.</td>
        </tr>
        <tr>
            <th scope="row"><label for="inquiry_type">유형</label></th>
            <td>
            	<input type="radio" value="상품(성능/사이즈)" name="inquiry_type" id="type1"/><label for="type1">상품(성능/사이즈)</label>
            	<input type="radio" value="배송" name="inquiry_type" id="type2"/><label for="type2">배송</label>
            	<input type="radio" value="교환" name="inquiry_type" id="type3"/><label for="type3">교환</label>
            	<input type="radio" value="반품/취소/환불" name="inquiry_type" id="type4"/><label for="type4">반품/취소/환불</label>
            	<input type="radio" value="기타" name="inquiry_type" id="type5"/><label for="type5">기타</label>
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="inquiry_title">제목</label></th>
            <td><input type="text" name="inquiry_title" value="" id="iq_subject" required class="required frm_input" minlength="2" maxlength="250"></td>
        </tr>
        <tr>
            <th scope="row"><label for="inquiry_contents">질문</label></th>
            <td><span class="sound_only">웹에디터 시작</span>

<textarea id="editor" name="inquiry_contents" class="smarteditor2" maxlength="65536" style="width:100%;height:300px"></textarea>
<span class="sound_only">웹 에디터 끝</span></td>
        </tr>
        </tbody>
        </table>
    </div>

    <div class="win_btn">
        <input type="submit" value="작성완료" class="btn_submit" id="itemInquiryBtn">
        <button type="button" onclick="self.close();">닫기</button>
    </div>
    </form>
</div>

<script type="text/javascript">
function fitemqa_submit(f)
{
    var iq_question_editor_data = oEditors.getById['iq_question'].getIR();
oEditors.getById['iq_question'].exec('UPDATE_CONTENTS_FIELD', []);
if(jQuery.inArray(document.getElementById('iq_question').value.toLowerCase().replace(/^\s*|\s*$/g, ''), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<div><br></div>','<p></p>','<br>','']) != -1){document.getElementById('iq_question').value='';}
if (!iq_question_editor_data || jQuery.inArray(iq_question_editor_data.toLowerCase(), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<p></p>','<br>']) != -1) { alert("내용을 입력해 주십시오."); oEditors.getById['iq_question'].exec('FOCUS'); return false; }

    return true;
}
</script>
<!-- } 상품문의 쓰기 끝 -->

<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>

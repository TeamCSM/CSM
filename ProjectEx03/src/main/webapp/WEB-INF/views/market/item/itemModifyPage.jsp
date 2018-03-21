<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/resources/market/include/marketHeader.jsp" %>
<script type="text/javascript" src="/resources/include/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="/resources/market/js/upload.js"></script>

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
        },    
        fOnAppLoad : function(){
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            obj.getById["editor"].exec("PASTE_HTML", ['${baseInfo.item_contents}']);
        }
    });
    //전송버튼
    $("#itemRegisterBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#registerForm").submit();
    });
    //날짜입력 데이트피커
    $( "#item_enddate" ).datepicker({
		showButtonPanel: true, //today
		changeMonth: true, //월 셀렉트 보이기
	    changeYear: true //년 셀렉트 보이기
	}); 
    $( "#item_enddate" ).datepicker( "option", "dateFormat", "yy-mm-dd");
    $( "#item_enddate" ).datepicker( "option", "showAnim", "slide" );
    $( "#ui-datepicker-div").css({'display':'none'});
    
    $('#inpCertify1').click(function() {
    	//$('#auction').css({'display':'inline'});
    	$('#auction').fadeIn(500);
    	$('#item_minPrice').val("");
    	$('#item_enddate').val("");
	});
    $('#inpCertify2').click(function() {
    	$('#auction').fadeOut(500);
    	$('#item_minPrice').val(0);
    	$('#item_enddate').val("2999-12-31");
	});
    
    $('#item_enddate').val("2999-12-31");
    
   	
    var item_idx = ${baseInfo.item_idx};
	
	$.getJSON("/market/item/itemPhoto/"+item_idx, function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
});
</script>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
}
.uploadedList li{
	display: inline-block;
}
</style>

<div id="container">
    <div id="container_s" style="border: 1px solid black;">

    
	<h1 id="container_title">상품 등록</h1>
<script>
var g5_shop_url = "http://witch01.dothome.co.kr/0b/shop";
var count = 0;
</script>
<script src="http://witch01.dothome.co.kr/0b/js/shop.mobile.list.js"></script>


<div id="sct">

    <div id="sct_hhtml"></div>


<!-- Main content -->
<section class="content">
<div class="row">
	<!-- left column -->
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<!-- general form elements -->
		<div class="box box-primary">
			<!-- /.box-header -->
			<form role="form" method="post" id="registerForm" action="/market/item/itemRegister" enctype="multipart/form-data">
				<input type="hidden" value="${login.user_id}" name="item_sellerId"/>
				<div class="box-body">
					<div class="form-group">
						<input type="text" name="item_name" class="form-control" placeholder="제품 이름" value="${baseInfo.item_name}">
						<div class="text-left">
							<input type="text" name="item_price" class="form-control" placeholder="제품 가격" style="width: 100px; display: inline-block;" value="${baseInfo.item_price}">
							<input type="number" name="item_sail" class="form-control" min="0" max="100" placeholder="할인률" style="width: 100px; display: inline-block;" value="${baseInfo.item_sail}">
							<input type="text" name="item_amount" class="form-control" placeholder="제품 수량" style="width: 100px; display: inline-block;" value="${baseInfo.item_amount}">
							<select name="item_area" class="form-control" style="width: 150px; display: inline-block;" >
								<option value="" >-제품 분류-</option>
								<option value="book">책</option>
								<option value="it">it/컴퓨터</option>
							</select>
							판매자 : <input type="text" name="item_sellerName" class="form-control" placeholder="판매자" readonly="readonly" value="${login.user_name }" style="width: 100px; display: inline-block;">
							판매방식 : <input type="radio" id="inpCertify1" name="item_saleType" value="경매" class="inp_comm">
										<label for="inpCertify1" class="lab_comm">
	                                        <span class="ico_find"></span>경매
	                                    </label>
	                                 <input type="radio" id="inpCertify2" name="item_saleType" value="판매" class="inp_comm" checked="checked">
	                                 <label for="inpCertify2" class="lab_comm">
	                                        <span class="ico_find"></span>판매
	                             	 </label>
                                	<div id="auction" style="display: none;">
	                                    <div class="form-group has-feedback" style="width: 200px; display: inline-block;">
											<input type="text" id="item_minPrice" name="item_minPrice" class="form-control" placeholder="경매 최저가" value="0" /> 
											<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback" style="width: 200px; display: inline-block;">
											<input class="form-control" type="text" id="item_enddate" name="item_enddate" placeholder="경매 종료일" />					
											<span class="glyphicon glyphicon-heart form-control-feedback"></span>
										</div>
                                	</div>
						</div>
						<input type="text" name="item_title" class="form-control" placeholder="제품 등록글 제목" value="${baseInfo.item_title}">
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="3" name="item_contents" id="editor"></textarea>
					</div>
					<div class="form-group">
						
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">상품 이미지를 드래그앤 드랍해주세요. <br />
														(첫번째 이미지가 대표이미지가 됩니다.)</label>
						<div class="fileDrop"></div>
					</div>
				</div>
				<!-- /.box-body -->
		
				<div class="box-footer">
					<div>
						<hr />
					</div>
			
					<ul class="mailbox-attachments clearfix uploadedList">
					
					</ul><br />
					<button type="button" id="itemRegisterBtn" class="btn btn-primary">작성완료</button>
				</div>
			</form>
		</div>
		<!-- /.box -->
	</div>
	<!--/.col (left) -->
	<div class="col-md-2"></div>
</div>
<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- <script type="text/javascript" src="/resources/js/upload.js"></script> -->
<script id="template" type="text/x-handlebars-template">
		<li>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"/></span>
			<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
				<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
			</div>
		</li>
	</script>
<script type="text/javascript">
		
		
		
		var template = Handlebars.compile($("#template").html());
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault(); 
		});
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			
			if(count>=5){
				alert("상품 이미지는 5개까지만 업로드 할 수 있습니다.");
				return;
			}
			count++
			
			var files = event.originalEvent.dataTransfer.files;
			
			var file = files[0];
			
			var formData = new FormData();
			
			formData.append("file", file);
			// 파일전송시 processData: false, contentType: false를 반드시 해줘야함
			$.ajax({
				url: '/market/item/itemImgUpload',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data){
					
					var fileInfo = getFileInfo(data);
					
					var html = template(fileInfo);
					
					$(".uploadedList").append(html);
				}
			});
		});
		$("#registerForm").submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			
			$(".uploadedList .delbtn").each(function(index) {
				str += "<input type='text' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
			});
			that.append(str);
			
			that.get(0).submit();
		});
		$(".uploadedList").on("click", ".delbtn", function(event){
			event.preventDefault();
			count--;
			
			var that = $(this);
			
			//alert("DELETE FILE");
			
			$.ajax({
				url:"/market/item/deleteFile",
				type:"post",
				data: {fileName:$(this).attr("href")},
				dataType:"text",
				success:function(result){
					console.log("RESULT:"+result);
					if(result == 'deleted'){
						that.closest("li").remove();
					}
				}
			});
		});
</script>
    
    <div id="sct_thtml"></div></div>

    </div>
<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>
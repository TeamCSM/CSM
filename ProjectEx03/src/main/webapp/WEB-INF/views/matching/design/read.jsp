<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<script type="text/javascript" src="/resources/include/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div id="bo_v_table">notice</div>
<section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">디자이너 구하기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<article id="bo_v" class="container">
    <div class="panel panel-success">
    <header class="panel-heading">
        <h1 id="bo_v_title">
            ${designVO.title }        </h1>
    </header>
    <div class="panel-body">
    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        <strong><span class="sv_guest">${designVO.id }</span></strong>
        <span class="sound_only"></span><strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${designVO.regidate}" /></strong>
        조회수<strong>${designVO.viewcnt }</strong>
    </section>
    
    <!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">
                        <ul class="bo_v_nb pager">
                        <li><a href="./board.php?bo_table=notice&amp;wr_id=1" class="next">next <span aria-hidden="true"> &rarr;</span></a></li>        </ul>
       
       <c:if test="${login.user_id ne designVO.id }"> 
       		<ul class="bo_v_com">
            	<li><a href="#" onclick="popupOpen();" class="btn btn-sm btn-primary">이력서 작성하기</a></li>
       		</ul>
       </c:if>
            </div>
    <!-- } 게시물 상단 버튼 끝 -->

    <section id="bo_v_atc" class="col-md-10 col-md-offset-1">
        <h2 id="bo_v_atc_title">본문</h2>
        
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">${designVO.contents }</div>
         <!-- } 본문 내용 끝 -->
    </section>

<!-- 지원자 시작 { -->
<c:if test="${login.user_id eq designVO.id }">
<section id="bo_vc" class="clearfix">
    <div class="col-md-8 col-md-offset-2">
		<label for="exampleInputEmail1">지원자</label><br/>
		<c:forEach items="${rlist}" var="resumeVO">

			<tr>
				<c:if test="${resumeVO.type eq 'd' and resumeVO.idx eq designVO.idx and resumeVO.accept ne 1}">
					<td>${resumeVO.name} <input type="hidden" name="uno" value="${resumeVO.uno }"/><a href="/program/resumeRead?uno=${resumeVO.uno }&idx=${designVO.idx}&sid=${designVO.id}&title=${designVO.title}" style="color:black;" onclick="window.open(this.href, '팝업창', 'width=500, height=500'); return false;"><button class="btn btn-sm btn-primary">이력서 보기</button></a></td>
				</c:if>
				<c:if test="${resumeVO.accept eq 1 }">
					<td><span style="text-decoration:line-through;">${resumeVO.name}</span><span style="color:green;">&nbsp;&nbsp;&nbsp;수락됨</span></td>
				</c:if>
			</tr>

		</c:forEach>
	</div>
</section>
</c:if>
<!-- } 지원자 끝 -->
<script type="text/javascript">
function popupOpen() {

	var popUrl = "/program/resume?idx="+ ${designVO.idx} +"&type=d";	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

}
</script>
<script src="http://witch02.dothome.co.kr/01/js/md5.js"></script>

    <!-- 링크 버튼 시작 { -->
    <div id="bo_v_bot">
        <ul class="bo_v_com">
        <c:if test="${login.user_id eq designVO.id }">
            <li><a href="/design/modify?idx=${designVO.idx }" class="btn btn-sm btn-primary">수정</a></li>
            <li><a href="/design/remove?idx=${designVO.idx }" class="btn btn-sm btn-primary">삭제</a></li>
        </c:if>
            <li><a href="/design/listAll" class="btn btn-sm btn-success">목록</a></li>
        </ul>
   </div>
    <!-- } 링크 버튼 끝 -->
    </div>
    </div>
</article>
<!-- } 게시판 읽기 끝 -->

<!-- } 게시글 읽기 끝 -->
<%@include file="/resources/include/footer.jsp" %>
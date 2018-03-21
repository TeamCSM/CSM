<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/default.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/skin/board/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/animate.min.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/app.css">

<footer class="text-center">
<button type="button" id="top_btn"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/top_btn.png" alt="상단으로"></button>
    <script>
    
    $(function() {
        $("#top_btn").on("click", function() {
            $("html, body").animate({scrollTop:0}, '500');
            return false;
        });
       
    });
    </script>

    <div class="footer-above" style="background: black;">
        <div class="container" >
            <div class="row">
                <div class="footer-col col-md-4">
                    <h3>LOCATION</h3>
                    <p>서울시 금천구 가산동<br>426-5 월드메르디앙 2차 14층</p>
                </div>
                <div class="footer-col col-md-4">
                    <ul class="list-inline">
                        <li>
                            <a href="#" class="btn-social btn-outline" ><i class="fa fa-fw fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline" ><i class="fa fa-fw fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline" ><i class="fa fa-fw fa-dribbble"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="footer-col col-md-4">
                    <h3>CONTACT</h3>
                    <p>Tel 010-8323-9068</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below" style="background: gray;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy;  CSM (코드로 사람을 만나다.)
                </div>
            </div>
        </div>
    </div>
</footer>


<script src="http://witch01.dothome.co.kr/0b/js/sns.js"></script>



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
<style>
a{
	color: black;
}
</style>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<ul id="stv_ul">

<c:choose>
<c:when test="${not empty baseInfo}">
<c:forEach items="${baseInfo}" var="baseInfo">
<li class="stv_item c1">
<c:choose>
<c:when test="${not empty baseInfo.files[0]}">
<div class="stv_img"><a href="/market/item/itemReadPage?item_idx=${baseInfo.item_idx}"><img src="${baseInfo.files[0]}" width="80" height="80"></a></div>
</c:when>
<c:otherwise>
<a href="/market/item/itemReadPage?item_idx=${baseInfo.item_idx}"><img src="/resources/market/img/noimg.jpg" width="80" height="80" /></a>
</c:otherwise>
</c:choose>
<div class="stv_txt"><div class="stv_name"><a href="/market/item/itemReadPage?item_idx=${baseInfo.item_idx}">${baseInfo.item_name}</a>
</div>${baseInfo.item_price} 점
</div>
</li>
</c:forEach>
</c:when>
<c:otherwise>
 <p class="stv_no" align="center">없음</p>
</c:otherwise>
</c:choose>
</ul>
    <div class="stv_pgwr">
        <div id="stv_btn"></div>
        <div id="stv_pg"></div>
    </div>

    <script>
    $(function() {
        var itemQty = 1; // 총 아이템 수량
        var itemShow = 5; // 한번에 보여줄 아이템 수량
        if (itemQty > itemShow)
        {
            $('#stv_btn').append('<button type="button" id="up"><i class="fa fa-chevron-left" aria-hidden="true"></i> 이전</button><button type="button" id="down">다음 <i class="fa fa-chevron-right" aria-hidden="true"></i></button>');
        }
        var Flag = 1; // 페이지
        var EOFlag = parseInt(1/itemShow);  // 전체 리스트를 3(한 번에 보여줄 값)으로 나눠 페이지 최댓값을 구하고 
        var itemRest = parseInt(1%itemShow); // 나머지 값을 구한 후
        if (itemRest > 0) // 나머지 값이 있다면
        {
            EOFlag++; // 페이지 최댓값을 1 증가시킨다.
        }
        $('.c'+Flag).css('display','block');
        $('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 초기 출력값
        $('#up').click(function() {
            if (Flag == 1)
            {
                alert('목록의 처음입니다.');
            } else {
                Flag--;
                $('.c'+Flag).css('display','block');
                $('.c'+(Flag+1)).css('display','none');
            }
            $('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 값 재설정
        })
        $('#down').click(function() {
            if (Flag == EOFlag)
            {
                alert('더 이상 목록이 없습니다.');
            } else {
                Flag++;
                $('.c'+Flag).css('display','block');
                $('.c'+(Flag-1)).css('display','none');
            }
            $('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 값 재설정
        });
    });
    </script>
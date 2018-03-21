<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<button type="button" id="quick_open"><i class="fa fa-plus" aria-hidden="true"></i><span class="sound_only">퀵메뉴 열기</span></button>
    <div id="quick"  class="tab-wr">
        <ul class="qk_btn tabsTit">
            <li class="tabsTab">
                <button type="button" class="cart_op_btn"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="sound_only">장바구니 열기</span></button>
            </li>
            <li class="tabsTab">
                <button type="button"><i class="fa fa-archive" aria-hidden="true"></i><span class="sound_only">오늘본상품 열기</span></button>
            </li>
                    </ul>
        <div  class="tabsCon">
            <div class="qk_con tabsList">
                <h3><a href="/market/cart/cartList">장바구니</a></h3>
                <div class="hdqk_wr">
                    <div class="hdqk_wr" id="q_cart_wr">
                    
                    
                    
                    
                    
                    </div>
                 <script>
                $(function(){
                	
                	$.ajax({
            			url : "/market/cart/cartListAjax",
            			type : "get",
            			dataType : "html",
            			success : function(data){
            				$("#q_cart_wr").html(data);		
            			}
            		});
                	
                	$.ajax({
            			url : "/market/item/dayListAjax",
            			type : "get",
            			dataType : "html",
            			success : function(data){
            				$("#stv_list").html(data);		
            			}
            		});
                	
                    $(".cart_op_btn").on("click", function() {
                        var $this = $(this);

                        $("#q_cart_wr").load(
                            g5_theme_shop_url+"/ajax.cart.php",
                            function() {
                                $this.next(".hdqk_wr").show();
                            }
                        );
                    });
                });
                </script>
                </div>
                <button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">장바구니 닫기</span></button>
            </div>
            <div class="qk_con tabsList">
                <h3><span>오늘본상품</span></h3>
                
<!-- 오늘 본 상품 시작 { -->
<div id="stv_list">
        

    
</div>

<script src="http://witch01.dothome.co.kr/0b/js/scroll_oldie.js"></script>
<!-- } 오늘 본 상품 끝 -->                <button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">오늘본상품 닫기</span></button>
            </div>
            
        </div>
    </div>
    <script>
    $(function (){
        $("#quick").UblueTabs({
            eventType:"click" 
        });
        $(".con_close").on("click", function(){
            $(".qk_con").hide();
        });
        $("#quick_open").on("click", function(){
            $("#quick").toggle();
        });

    });
    $(document).mouseup(function (e){
        var container = $(".qk_con");
        if( container.has(e.target).length === 0)
        container.hide();
    });
    </script>
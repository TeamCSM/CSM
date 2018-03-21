<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>

<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">주문서 작성</h1>
<form name="forderform" id="forderform" autocomplete="off">
<input type="hidden" name="item_totalPrice" value="${item_totalPrice}"/>
<div id="sod_frm">
    <!-- 주문상품 확인 시작 { -->
    <p>주문하실 상품을 확인하세요.</p>

    <div class="tbl_head01 tbl_wrap">
        <table id="sod_list">
        <thead>
        <tr>
            <th scope="col">상품이미지</th>
            <th scope="col">상품명</th>
            <th scope="col">총수량</th>
            <th scope="col">판매자</th>
            <th scope="col">판매포인트</th>
            <th scope="col" style="width: 100px;">할인포인트</th>
            <th scope="col" style="width: 100px;">할인적용포인트</th>
            <th scope="col">배송비</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartItemInfo}" var="itemInfo" varStatus="loop">
        <tr>
            <td class="sod_img">
            	<c:choose>
					<c:when test="${not empty itemInfo.item_photoName}">
						<img src="${itemInfo.item_photoName}" width="50" height="50" alt="">
					</c:when>
					<c:otherwise>
						<img src="/resources/market/img/noimg.jpg" width="50" height="50" alt="">
					</c:otherwise>
				</c:choose>
            </td>
            <td style="text-align: center;">
                <input type="hidden" id="item_idx" name="orderItems[${loop.index}].item_idx" value="${itemInfo.item_idx}"/>
                <input type="hidden" id="item_title" name="orderItems[${loop.index}].item_title" value="${itemInfo.item_title}"/>
                <input type="hidden" id="item_name" name="orderItems[${loop.index}].item_name" value="${itemInfo.item_name}"/>
                <input type="hidden" id="item_price" name="orderItems[${loop.index}].item_price" value="${itemInfo.item_price}"/>
                <input type="hidden" id="item_price" name="orderItems[${loop.index}].item_priceResult" value="${itemInfo.item_priceResult}"/>
                <input type="hidden" id="item_sail" name="orderItems[${loop.index}].item_sail" value="${itemInfo.item_sail}"/>
                <input type="hidden" id="item_amount" name="orderItems[${loop.index}].item_amount" value="${itemInfo.item_amount}"/>
                <input type="hidden" id="item_photoName" name="orderItems[${loop.index}].item_photoName" value="${itemInfo.item_photoName}"/>
                <input type="hidden" id="item_sellerId" name="orderItems[${loop.index}].item_sellerId" value="${itemInfo.item_sellerId}"/>
                <input type="hidden" id="item_sellerName" name="orderItems[${loop.index}].item_sellerName" value="${itemInfo.item_sellerName}"/>
                
                <a href="/market/item/itemReadPage?item_idx=${itemInfo.item_idx}"><strong>${itemInfo.item_title}</strong></a>
                <div class="sod_opt">
                	<ul>
						<li>${itemInfo.item_name} </li>
					</ul>
				</div>            
			</td>
			<td class="td_num" style="text-align: center;">${itemInfo.item_amount}개</td>
			<td class="td_numbig" style="text-align: center;">${itemInfo.item_sellerName}</td>
            <td class="td_numbig" style="text-align: center;">${itemInfo.item_price}점</td>
            <td class="td_numbig" style="color: red; text-align: center;">-${itemInfo.item_sail}점</td>
            <td class="td_numbig" style="text-align: center;"><span class="total_price">${itemInfo.item_priceResult}점</span></td>
            <td class="td_dvr" style="text-align: center;">무료</td>
        </tr>
		</c:forEach>
        </tbody>
        </table>
    </div>

        <!-- } 주문상품 확인 끝 -->

    <!-- 주문상품 합계 시작 { -->
    <dl id="sod_bsk_tot">
        <dt class="sod_bsk_dvr">배송비</dt>
        <dd class="sod_bsk_dvr"><strong>무료</strong></dd>
        <dt class="sod_bsk_cnt">총계</dt>
        <dd class="sod_bsk_cnt"><strong id="ct_tot_price">${item_totalPrice} 점</strong></dd>
    </dl>
    <!-- } 주문상품 합계 끝 -->

    <!-- 주문하시는 분 입력 시작 { -->
		<br />
        <h4>주문하시는 분</h4>
	
        <div class="tbl_frm01 tbl_wrap">
            <table>
            <tbody>
            <tr>
                <th scope="row" style="width: 120px;"><label for="od_name">이름<strong class="sound_only"> 필수</strong></label></th>
                <td><input type="text" name="od_name" value="${userInfo.user_name}" id="od_name" required maxlength="20" class="form-control" style="width: 200px;" readonly></td>
            </tr>
            <tr>
                <th scope="row"><label for="od_tel">전화번호<strong class="sound_only"> 필수</strong></label></th>
                <td><input type="text" name="od_tel" value="${userInfo.user_phone}" id="od_tel" required maxlength="20" class="form-control" style="width: 200px;" readonly></td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                 <td>
                    <label for="od_zip" class="sound_only">우편번호<strong class="sound_only"> 필수</strong></label>
                    <label for="od_zip">우편번호</label><br>
                    <input type="text" name="od_zip" value="${userInfo.user_mailNumber}" id="od_mailNumber" required maxlength="6" class="form-control" style="width: 100px;" readonly>
                    <br>
                    <label for="od_addr2">기본주소<strong class="sound_only"> 필수</strong></label><br>
                    <input type="text" name="od_addr2" value="${userInfo.user_streetAddr}" id="od_streetAddr" class="form-control" style="width: 350px;" readonly>
                    <br>
                    <label for="od_addr3">상세주소</label>
                    <br>
                    <input type="text" name="od_addr3" value="${userInfo.user_detailedAddr}" id="od_detailedAddr" class="form-control" style="width: 350px;" readonly>
                </td>
            </tr>
			</tbody>
            </table>
        </div>
    <!-- } 주문하시는 분 입력 끝 -->

    <!-- 받으시는 분 입력 시작 { -->
    	<br />
        <h4>받으시는 분</h4>
		<script type="text/javascript">
		$().ready(function() {
			
			$('#baseAddr').click(function() {
				$('#ad_subject').val("기본배송지");
				$('#od_b_name').val($('#od_name').val());
				$('#od_b_tel').val($('#od_tel').val());
				$('#od_b_mailNumber').val($('#od_mailNumber').val());
				$('#od_b_streetAddr').val($('#od_streetAddr').val());
				$('#od_b_detailedAddr').val($('#od_detailedAddr').val());
			});
			
			$('#newAddr').click(function() {
				$('#ad_subject').val("");
				$('#od_b_name').val("");
				$('#od_b_tel').val("");
				$('#od_b_mailNumber').val("");
				$('#od_b_streetAddr').val("");
				$('#od_b_detailedAddr').val("");
			});
			
			$('#ad_default').on('change',function() {
				if($('#ad_default:checked').length==1){
					$('#ad_default').val(1);
				}else{
					$('#ad_default').val(0);
				}
			});
			$('#orderBtn').click(function() {
				var formObj = $('#forderform');
				
				formObj.attr("method", "post");
				formObj.attr("action", "/market/order/orderInsert");
				formObj.submit();
			});
		});
		
		</script>
        <div class="tbl_frm01 tbl_wrap">
            <table>
            <tbody>
                        <tr>
                <th scope="row" style="width: 120px;">배송지선택</th>
                <td>
                    <input type="radio" name="ad_sel_addr" value="same" id="baseAddr">
<label for="baseAddr">주문자와 동일</label>
<input type="radio" name="ad_sel_addr" value="new" id="newAddr">
<label for="newAddr">신규배송지</label>
<a href="http://witch01.dothome.co.kr/0b/shop/orderaddress.php" id="order_address" class="btn_frmline">배송지목록</a>                </td>
            </tr>
                        <tr>
                <th scope="row"><label for="ad_subject">배송지명</label></th>
                <td>
                    <input type="text" name="saveAddVo.saveAddr_name" id="ad_subject" maxlength="20" class="form-control" style="width: 200px;">
                    <input type="checkbox" name="saveAddr_check" id="ad_default" value="0">
                    <label for="ad_default">기본배송지로 설정</label>
                </td>
            </tr>
                        <tr>
                <th scope="row"><label for="od_b_name">이름<strong class="sound_only"> 필수</strong></label></th>
                <td><input type="text" name="saveAddVo.user_name" id="od_b_name" required  maxlength="20" class="form-control" style="width: 200px;"></td>
            </tr>
            <tr>
                <th scope="row"><label for="od_b_tel">전화번호<strong class="sound_only"> 필수</strong></label></th>
                <td><input type="text" name="saveAddVo.user_phone" id="od_b_tel" required  maxlength="20" class="form-control" style="width: 200px;"></td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td id="sod_frm_addr">
                    <label for="od_b_zip" class="sound_only">우편번호<strong class="sound_only"> 필수</strong></label>
                    <input type="text" name="saveAddVo.user_mailNumber" id="od_b_mailNumber" readonly  maxlength="6" class="form-control" style="width: 200px; display: inline-block;"/> &nbsp;
                    <button type="button" class="btn_frmline" onclick="win_zip('forderform', 'od_b_zip', 'od_b_addr1', 'od_b_addr2', 'od_b_addr3', 'od_b_addr_jibeon');" style="display: inline-block;">주소 검색</button><br>
                    <label for="od_b_addr1">기본주소<strong class="sound_only"> 필수</strong></label><br>
                    <input type="text" name="saveAddVo.user_streetAddr" id="od_b_streetAddr" class="form-control" style="width: 350px;" readonly>
                    <br>
                    <label for="od_b_addr2">상세주소</label>
                    <br>
                    <input type="text" name="saveAddVo.user_detailedAddr" id="od_b_detailedAddr" class="form-control" style="width: 350px;">
                    
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="order_msg">배송 메세지</label></th>
                <td><textarea name="order_msg" id="order_msg"></textarea></td>
            </tr>
            </tbody>
            </table>
        </div>
    <!-- } 받으시는 분 입력 끝 -->

    <!-- 결제정보 입력 시작 { -->
    
    <section id="sod_frm_pay">
        <h4>결제정보</h4>

        <div class="tbl_frm01 tbl_wrap">
            <table>
            <tbody>
                                    <tr>
                <th style="width: 120px;">결제 포인트</th>
                <td><span id="od_tot_price">${item_totalPrice }</span>점</td>
            </tr>
            </tbody>
            </table>
        </div>
	</section>
   <!-- } 결제 정보 입력 끝 -->

    
<div id="display_pay_button" class="btn_confirm">
    <input type="button" value="주문하기" id="orderBtn" class="btn_submit">
    <a href="javascript:history.go(-1);" class="btn01">취소</a>
</div>
<div id="display_pay_process" style="display:none">
    <img src="http://witch01.dothome.co.kr/0b/shop/img/loading.gif" alt="">
    <span>주문완료 중입니다. 잠시만 기다려 주십시오.</span>
</div></div>
</form>

    


<script>
var zipcode = "";
var form_action_url = "http://witch01.dothome.co.kr/0b/shop/orderformupdate.php";

$(function() {
    var $cp_btn_el;
    var $cp_row_el;

    $(".cp_btn").click(function() {
        $cp_btn_el = $(this);
        $cp_row_el = $(this).closest("tr");
        $("#cp_frm").remove();
        var it_id = $cp_btn_el.closest("tr").find("input[name^=it_id]").val();

        $.post(
            "./orderitemcoupon.php",
            { it_id: it_id,  sw_direct: "" },
            function(data) {
                $cp_btn_el.after(data);
            }
        );
    });

    $(document).on("click", ".cp_apply", function() {
        var $el = $(this).closest("tr");
        var cp_id = $el.find("input[name='f_cp_id[]']").val();
        var price = $el.find("input[name='f_cp_prc[]']").val();
        var subj = $el.find("input[name='f_cp_subj[]']").val();
        var sell_price;

        if(parseInt(price) == 0) {
            if(!confirm(subj+"쿠폰의 할인 금액은 "+price+"원입니다.\n쿠폰을 적용하시겠습니까?")) {
                return false;
            }
        }

        // 이미 사용한 쿠폰이 있는지
        var cp_dup = false;
        var cp_dup_idx;
        var $cp_dup_el;
        $("input[name^=cp_id]").each(function(index) {
            var id = $(this).val();

            if(id == cp_id) {
                cp_dup_idx = index;
                cp_dup = true;
                $cp_dup_el = $(this).closest("tr");;

                return false;
            }
        });

        if(cp_dup) {
            var it_name = $("input[name='it_name["+cp_dup_idx+"]']").val();
            if(!confirm(subj+ "쿠폰은 "+it_name+"에 사용되었습니다.\n"+it_name+"의 쿠폰을 취소한 후 적용하시겠습니까?")) {
                return false;
            } else {
                coupon_cancel($cp_dup_el);
                $("#cp_frm").remove();
                $cp_dup_el.find(".cp_btn").text("적용").focus();
                $cp_dup_el.find(".cp_cancel").remove();
            }
        }

        var $s_el = $cp_row_el.find(".total_price");;
        sell_price = parseInt($cp_row_el.find("input[name^=it_price]").val());
        sell_price = sell_price - parseInt(price);
        if(sell_price < 0) {
            alert("쿠폰할인금액이 상품 주문금액보다 크므로 쿠폰을 적용할 수 없습니다.");
            return false;
        }
        $s_el.text(number_format(String(sell_price)));
        $cp_row_el.find("input[name^=cp_id]").val(cp_id);
        $cp_row_el.find("input[name^=cp_price]").val(price);

        calculate_total_price();
        $("#cp_frm").remove();
        $cp_btn_el.text("변경").focus();
        if(!$cp_row_el.find(".cp_cancel").size())
            $cp_btn_el.after("<button type=\"button\" class=\"cp_cancel btn_frmline\">취소</button>");
    });

    $(document).on("click", "#cp_close", function() {
        $("#cp_frm").remove();
        $cp_btn_el.focus();
    });

    $(document).on("click", ".cp_cancel", function() {
        coupon_cancel($(this).closest("tr"));
        calculate_total_price();
        $("#cp_frm").remove();
        $(this).closest("tr").find(".cp_btn").text("적용").focus();
        $(this).remove();
    });

    $("#od_coupon_btn").click(function() {
        $("#od_coupon_frm").remove();
        var $this = $(this);
        var price = parseInt($("input[name=org_od_price]").val()) - parseInt($("input[name=item_coupon]").val());
        if(price <= 0) {
            alert('상품금액이 0원이므로 쿠폰을 사용할 수 없습니다.');
            return false;
        }
        $.post(
            "./ordercoupon.php",
            { price: price },
            function(data) {
                $this.after(data);
            }
        );
    });

    $(document).on("click", ".od_cp_apply", function() {
        var $el = $(this).closest("tr");
        var cp_id = $el.find("input[name='o_cp_id[]']").val();
        var price = parseInt($el.find("input[name='o_cp_prc[]']").val());
        var subj = $el.find("input[name='o_cp_subj[]']").val();
        var send_cost = $("input[name=od_send_cost]").val();
        var item_coupon = parseInt($("input[name=item_coupon]").val());
        var od_price = parseInt($("input[name=org_od_price]").val()) - item_coupon;

        if(price == 0) {
            if(!confirm(subj+"쿠폰의 할인 금액은 "+price+"원입니다.\n쿠폰을 적용하시겠습니까?")) {
                return false;
            }
        }

        if(od_price - price <= 0) {
            alert("쿠폰할인금액이 주문금액보다 크므로 쿠폰을 적용할 수 없습니다.");
            return false;
        }

        $("input[name=sc_cp_id]").val("");
        $("#sc_coupon_btn").text("쿠폰적용");
        $("#sc_coupon_cancel").remove();

        $("input[name=od_price]").val(od_price - price);
        $("input[name=od_cp_id]").val(cp_id);
        $("input[name=od_coupon]").val(price);
        $("input[name=od_send_coupon]").val(0);
        $("#od_cp_price").text(number_format(String(price)));
        $("#sc_cp_price").text(0);
        calculate_order_price();
        $("#od_coupon_frm").remove();
        $("#od_coupon_btn").text("쿠폰변경").focus();
        if(!$("#od_coupon_cancel").size())
            $("#od_coupon_btn").after("<button type=\"button\" id=\"od_coupon_cancel\" class=\"btn_frmline\">쿠폰취소</button>");
    });

    $(document).on("click", "#od_coupon_close", function() {
        $("#od_coupon_frm").remove();
        $("#od_coupon_btn").focus();
    });

    $(document).on("click", "#od_coupon_cancel", function() {
        var org_price = $("input[name=org_od_price]").val();
        var item_coupon = parseInt($("input[name=item_coupon]").val());
        $("input[name=od_price]").val(org_price - item_coupon);
        $("input[name=sc_cp_id]").val("");
        $("input[name=od_coupon]").val(0);
        $("input[name=od_send_coupon]").val(0);
        $("#od_cp_price").text(0);
        $("#sc_cp_price").text(0);
        calculate_order_price();
        $("#od_coupon_frm").remove();
        $("#od_coupon_btn").text("쿠폰적용").focus();
        $(this).remove();
        $("#sc_coupon_btn").text("쿠폰적용");
        $("#sc_coupon_cancel").remove();
    });

    $("#sc_coupon_btn").click(function() {
        $("#sc_coupon_frm").remove();
        var $this = $(this);
        var price = parseInt($("input[name=od_price]").val());
        var send_cost = parseInt($("input[name=od_send_cost]").val());
        $.post(
            "./ordersendcostcoupon.php",
            { price: price, send_cost: send_cost },
            function(data) {
                $this.after(data);
            }
        );
    });

    $(document).on("click", ".sc_cp_apply", function() {
        var $el = $(this).closest("tr");
        var cp_id = $el.find("input[name='s_cp_id[]']").val();
        var price = parseInt($el.find("input[name='s_cp_prc[]']").val());
        var subj = $el.find("input[name='s_cp_subj[]']").val();
        var send_cost = parseInt($("input[name=od_send_cost]").val());

        if(parseInt(price) == 0) {
            if(!confirm(subj+"쿠폰의 할인 금액은 "+price+"원입니다.\n쿠폰을 적용하시겠습니까?")) {
                return false;
            }
        }

        $("input[name=sc_cp_id]").val(cp_id);
        $("input[name=od_send_coupon]").val(price);
        $("#sc_cp_price").text(number_format(String(price)));
        calculate_order_price();
        $("#sc_coupon_frm").remove();
        $("#sc_coupon_btn").text("쿠폰변경").focus();
        if(!$("#sc_coupon_cancel").size())
            $("#sc_coupon_btn").after("<button type=\"button\" id=\"sc_coupon_cancel\" class=\"btn_frmline\">쿠폰취소</button>");
    });

    $(document).on("click", "#sc_coupon_close", function() {
        $("#sc_coupon_frm").remove();
        $("#sc_coupon_btn").focus();
    });

    $(document).on("click", "#sc_coupon_cancel", function() {
        $("input[name=od_send_coupon]").val(0);
        $("#sc_cp_price").text(0);
        calculate_order_price();
        $("#sc_coupon_frm").remove();
        $("#sc_coupon_btn").text("쿠폰적용").focus();
        $(this).remove();
    });

    $("#od_b_addr2").focus(function() {
        var zip = $("#od_b_zip").val().replace(/[^0-9]/g, "");
        if(zip == "")
            return false;

        var code = String(zip);

        if(zipcode == code)
            return false;

        zipcode = code;
        calculate_sendcost(code);
    });

    $("#od_settle_bank").on("click", function() {
        $("[name=od_deposit_name]").val( $("[name=od_name]").val() );
        $("#settle_bank").show();
    });

    $("#od_settle_iche,#od_settle_card,#od_settle_vbank,#od_settle_hp,#od_settle_easy_pay,#od_settle_kakaopay").bind("click", function() {
        $("#settle_bank").hide();
    });

    // 배송지선택
    $("input[name=ad_sel_addr]").on("click", function() {
        var addr = $(this).val().split(String.fromCharCode(30));

        if (addr[0] == "same") {
            gumae2baesong();
        } else {
            if(addr[0] == "new") {
                for(i=0; i<10; i++) {
                    addr[i] = "";
                }
            }

            var f = document.forderform;
            f.od_b_name.value        = addr[0];
            f.od_b_tel.value         = addr[1];
            f.od_b_hp.value          = addr[2];
            f.od_b_zip.value         = addr[3] + addr[4];
            f.od_b_addr1.value       = addr[5];
            f.od_b_addr2.value       = addr[6];
            f.od_b_addr3.value       = addr[7];
            f.od_b_addr_jibeon.value = addr[8];
            f.ad_subject.value       = addr[9];

            var zip1 = addr[3].replace(/[^0-9]/g, "");
            var zip2 = addr[4].replace(/[^0-9]/g, "");

            var code = String(zip1) + String(zip2);

            if(zipcode != code) {
                calculate_sendcost(code);
            }
        }
    });

    // 배송지목록
    $("#order_address").on("click", function() {
        var url = this.href;
        window.open(url, "win_address", "left=100,top=100,width=800,height=600,scrollbars=1");
        return false;
    });
});

function coupon_cancel($el)
{
    var $dup_sell_el = $el.find(".total_price");
    var $dup_price_el = $el.find("input[name^=cp_price]");
    var org_sell_price = $el.find("input[name^=it_price]").val();

    $dup_sell_el.text(number_format(String(org_sell_price)));
    $dup_price_el.val(0);
    $el.find("input[name^=cp_id]").val("");
}

function calculate_total_price()
{
    var $it_prc = $("input[name^=it_price]");
    var $cp_prc = $("input[name^=cp_price]");
    var tot_sell_price = sell_price = tot_cp_price = 0;
    var it_price, cp_price, it_notax;
    var tot_mny = comm_tax_mny = comm_vat_mny = comm_free_mny = tax_mny = vat_mny = 0;
    var send_cost = parseInt($("input[name=od_send_cost]").val());

    $it_prc.each(function(index) {
        it_price = parseInt($(this).val());
        cp_price = parseInt($cp_prc.eq(index).val());
        sell_price += it_price;
        tot_cp_price += cp_price;
    });

    tot_sell_price = sell_price - tot_cp_price + send_cost;

    $("#ct_tot_coupon").text(number_format(String(tot_cp_price))+" 원");
    $("#ct_tot_price").text(number_format(String(tot_sell_price))+" 원");

    $("input[name=good_mny]").val(tot_sell_price);
    $("input[name=od_price]").val(sell_price - tot_cp_price);
    $("input[name=item_coupon]").val(tot_cp_price);
    $("input[name=od_coupon]").val(0);
    $("input[name=od_send_coupon]").val(0);
            $("input[name=od_temp_point]").val(0);
        calculate_order_price();
}

function calculate_order_price()
{
    var sell_price = parseInt($("input[name=od_price]").val());
    var send_cost = parseInt($("input[name=od_send_cost]").val());
    var send_cost2 = parseInt($("input[name=od_send_cost2]").val());
    var send_coupon = parseInt($("input[name=od_send_coupon]").val());
    var tot_price = sell_price + send_cost + send_cost2 - send_coupon;

    $("input[name=good_mny]").val(tot_price);
    $("#od_tot_price").text(number_format(String(tot_price)));
    }

function calculate_temp_point()
{
    var sell_price = parseInt($("input[name=od_price]").val());
    var mb_point = parseInt(1200);
    var max_point = parseInt(50000);
    var point_unit = parseInt(100);
    var temp_point = max_point;

    if(temp_point > sell_price)
        temp_point = sell_price;

    if(temp_point > mb_point)
        temp_point = mb_point;

    temp_point = parseInt(temp_point / point_unit) * point_unit;

    $("#use_max_point").text("최대 "+number_format(String(temp_point))+"점");
    $("input[name=max_temp_point]").val(temp_point);
}

function calculate_sendcost(code)
{
    $.post(
        "./ordersendcost.php",
        { zipcode: code },
        function(data) {
            $("input[name=od_send_cost2]").val(data);
            $("#od_send_cost2").text(number_format(String(data)));

            zipcode = code;

            calculate_order_price();
        }
    );
}

function calculate_tax()
{
    var $it_prc = $("input[name^=it_price]");
    var $cp_prc = $("input[name^=cp_price]");
    var sell_price = tot_cp_price = 0;
    var it_price, cp_price, it_notax;
    var tot_mny = comm_free_mny = tax_mny = vat_mny = 0;
    var send_cost = parseInt($("input[name=od_send_cost]").val());
    var send_cost2 = parseInt($("input[name=od_send_cost2]").val());
    var od_coupon = parseInt($("input[name=od_coupon]").val());
    var send_coupon = parseInt($("input[name=od_send_coupon]").val());
    var temp_point = 0;

    $it_prc.each(function(index) {
        it_price = parseInt($(this).val());
        cp_price = parseInt($cp_prc.eq(index).val());
        sell_price += it_price;
        tot_cp_price += cp_price;
        it_notax = $("input[name^=it_notax]").eq(index).val();
        if(it_notax == "1") {
            comm_free_mny += (it_price - cp_price);
        } else {
            tot_mny += (it_price - cp_price);
        }
    });

    if($("input[name=od_temp_point]").size())
        temp_point = parseInt($("input[name=od_temp_point]").val());

    tot_mny += (send_cost + send_cost2 - od_coupon - send_coupon - temp_point);
    if(tot_mny < 0) {
        comm_free_mny = comm_free_mny + tot_mny;
        tot_mny = 0;
    }

    tax_mny = Math.round(tot_mny / 1.1);
    vat_mny = tot_mny - tax_mny;
    $("input[name=comm_tax_mny]").val(tax_mny);
    $("input[name=comm_vat_mny]").val(vat_mny);
    $("input[name=comm_free_mny]").val(comm_free_mny);
}



// 구매자 정보와 동일합니다.
function gumae2baesong() {
    var f = document.forderform;

    f.od_b_name.value = f.od_name.value;
    f.od_b_tel.value  = f.od_tel.value;
    f.od_b_hp.value   = f.od_hp.value;
    f.od_b_zip.value  = f.od_zip.value;
    f.od_b_addr1.value = f.od_addr1.value;
    f.od_b_addr2.value = f.od_addr2.value;
    f.od_b_addr3.value = f.od_addr3.value;
    f.od_b_addr_jibeon.value = f.od_addr_jibeon.value;

    calculate_sendcost(String(f.od_b_zip.value));
}

</script>    </div>
    
<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->
<%@ include file="/resources/market/include/marketFutter.jsp" %>
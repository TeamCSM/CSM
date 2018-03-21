/*chkSubmit(유효성 검사 대상, 메시지 내용)*/
function chkSubmit(v_item, v_name) {
   if (v_item.val().replace(/\s/g, "") == "") {
      alert(v_name + " 확인해 주세요.");
      v_item.val("");
      v_item.focus();
      return false;

   } else {
      return true;
   }
}

/*추가 내용*/
function isNumber(input) {
	if($(input).val() != ""){
		var num_regExp = new RegExp("[0-9]$","i");  //only number
		var match = num_regExp.exec($(input).val());
		//alert(match);
		if(match == null){
			alert("숫자를 입력해주세요");
			//$(input).val("");
			$(input).val($(input).val().substr(0,$(input).val().length-1));
		}
	}
}
function keyCheck() {
	if(event.keyCode<48 || event.keyCode>57){
		event.returnValue=false;
	}
}
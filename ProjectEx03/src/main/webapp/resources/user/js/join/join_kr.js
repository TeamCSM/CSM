
function setTerms() {
    var oDiv = document.getElementById("termsDiv");

    if (document.getElementById("chk_all").checked) {
        document.getElementById("termsService").checked = true;
        document.getElementById("termsPrivacy").checked = true;
        document.getElementById("termsLocation").checked = true;
        document.getElementById("termsEmail").checked = true;
    } else {
        document.getElementById("termsService").checked = false;
        document.getElementById("termsPrivacy").checked = false;
        document.getElementById("termsLocation").checked = false;
        document.getElementById("termsEmail").checked = false;
    }

    if (true) {
        oDiv.style.display = "block";
        location.hash = "bottom";
    }

    viewTerms();
    return true;
}


function viewTerms() {
    if (document.getElementById("termsService").checked == false || document.getElementById("termsPrivacy").checked == false
        || document.getElementById("termsLocation").checked == false || document.getElementById("termsEmail").checked == false) {
        document.getElementById("chk_all").checked = false;
    }
    if (document.getElementById("termsService").checked == true && document.getElementById("termsPrivacy").checked == true
        && document.getElementById("termsLocation").checked == true && document.getElementById("termsEmail").checked == true) {
        document.getElementById("chk_all").checked = true;
    }

    if (document.getElementById("chk_all").checked) {
        document.getElementById("chk_allLb").className = "on";
    } else {
        document.getElementById("chk_allLb").className = "";
    }

    if (document.getElementById("termsService").checked) {
        document.getElementById("termsServiceLb").className = "on";
    } else {
        document.getElementById("termsServiceLb").className = "";
    }

    if (document.getElementById("termsPrivacy").checked) {
        document.getElementById("termsPrivacyLb").className = "on";
    } else {
        document.getElementById("termsPrivacyLb").className = "";
    }

    if (document.getElementById("termsLocation").checked) {
        document.getElementById("termsLocationLb").className = "on";
    } else {
        document.getElementById("termsLocationLb").className = "";
    }

    if (document.getElementById("termsEmail").checked) {
        document.getElementById("termsEmailLb").className = "on";
    } else {
        document.getElementById("termsEmailLb").className = "";
    }

    return true;
}


function submitDisagree() {

    location.href = "/";
    return true;
}



function submitAgree() {

    var res = true;
    var oMsg = document.getElementById("termsMsg");

    if (checkTerms('check') != true) {
        res = false;
    }

    if (res == false) {
        oMsg.style.display = "block";
        return false;
    } else {
        oMsg.style.display = "none";
    }

    document.join_form.submit();
    return true;
}


function checkBrowser() {
    var Browser = {
        chk : navigator.userAgent.toLowerCase()
    };

    Browser = {
        ie7 : Browser.chk.indexOf('msie 7') != -1,
        ie8 : Browser.chk.indexOf('msie 8') != -1,
        ie9 : Browser.chk.indexOf('msie 9') != -1,
        ipad : Browser.chk.indexOf('ipad') != -1,
        iphone : Browser.chk.indexOf('iphone') != -1,
        android : Browser.chk.indexOf('android') != -1
    };

    if (Browser.ie7) {
        document.getElementsByTagName("body")[0].className = document.getElementsByTagName("body")[0].className + " ie7";
    } else if (Browser.ie8) {
        document.getElementsByTagName("body")[0].className = document.getElementsByTagName("body")[0].className + " ie8";
    } else if (Browser.ie9) {
        document.getElementsByTagName("body")[0].className = document.getElementsByTagName("body")[0].className + " ie9";
    } else if (Browser.ipad || Browser.iphone || Browser.android) {
        document.getElementsByTagName("body")[0].className = document.getElementsByTagName("body")[0].className + " t";
        document.getElementsByTagName("link")[1].href = "";
    }

}
 
function checkTerms(event) {
    viewTerms();

    var oMsg = document.getElementById("termsMsg");
    if (document.getElementById("termsService").checked == false || document.getElementById("termsPrivacy").checked == false) {
        oMsg.style.display = "block";
        return false;
    } else {
        oMsg.style.display = "none";
    }

    return true;
}

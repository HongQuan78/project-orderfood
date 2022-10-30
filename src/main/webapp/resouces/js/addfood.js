//
//var patt_f_name = /([a-zA-Z]+|[a-zA-Z]+\s{1}[a-zA-Z]{1,}|[a-zA-Z]+\s{1}[a-zA-Z]{3,}\s{1}[a-zA-Z]{1,})$/;
//var patt_phone = /^0[1-9]\d{8,10}$/;
//var patt_price = /[0-9]{1,10}$/;
//var pattF_s1 = /[C]+[o]+[n]/;
//var pattF_s2 = /[H]+[e]+[t]/;
//
//function checkF_id() {
//    f_id = document.getElementById("f_id").value;
//    var mess = document.getElementById("f_idMess");
//    if (f_id.length == 0 || f_id.length > 50) {
//        mess.innerHTML = "ID is invalid";
//        return false;
//    } else {
//        mess.innerHTML = "";
//        return true;
//    }
//}
//
//function checkF_name() {
//    f_name = document.getElementById("f_name").value;
//    var mess = document.getElementById("f_nameMess");
//    if (patt_f_name.test(f_name) == false) {
//        mess.innerHTML = "Username is invalid";
//        return false;
//    } else {
//        mess.innerHTML = "";
//        return true;
//    }
//}
//
//function checkPrice() {
//    price = document.getElementById("price").value;
//    var mess = document.getElementById("priceMess");
//    if (patt_price.test(price) == false) {
//        mess.innerHTML = "Price is valid!";
//        return false;
//    } else {
//        mess.innerHTML = "";
//        return true;
//    }
//}
//
//function checkF_status() {
//    f_s = document.getElementById("f_s").value;
//    var mess = document.getElementById("f_sMess");
//    if (pattF_s1.test(f_s) == false || pattF_s2.test(f_s) == false) {
//        mess.innerHTML = "Only 'Con' or 'Het' can be entered.";
//        return false;
//    } else {
//        mess.innerHTML = "";
//        return true;
//    }
//}
//
//function checkURL() {
//    img = document.getElementById("img").value;
//    var mess = document.getElementById("urlMess");
//    if (img.length == 0 || img.length > 500) {
//        mess.innerHTML = "URL image is invalid";
//        return false;
//    } else {
//        mess.innerHTML = "";
//        return true;
//    }
//}
//
//function checkAllDate() {
//    inValidF_id = checkF_id();
//    inValidF_name = checkF_name();
//    inValidPrice = checkPrice();
//    inValidF_status = checkF_status();
//
//    isValid = inValidF_id && inValidF_name && inValidPrice && inValidF_status;
//
//    if (isValid == true) {
//        return true;
//    } else {
//        return false;
//    }
//}

$(document).ready(function () {

    $('#addnew').validate({
        rules: {
            f_id: {
                require: true,
                length: 10
            }
        },
        messages: {
            f_id: {
                require: "Viet vao"
            }
        }
    });
});
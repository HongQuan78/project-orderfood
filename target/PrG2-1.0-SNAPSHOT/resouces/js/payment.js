$(document).ready(function () {
    $('#tb_order').DataTable();
});
$(document).ready(function () {
    $('#tb_unpaid').DataTable();
});
$(document).ready(function () {
    $('#tb_paid').DataTable();
});
document.getElementById("default").click();


function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}


function IsToggler() {
    if (!document.getElementById('toggler').classList.contains('collapsed')) {
        //Open
        var x = document.getElementById("information");
        x.style.display = "none";
    } else {
        var x = document.getElementById("information");
        x.style.display = "block";
    }
}


function addFood(id) {
    var value = document.getElementById(id).value;
    value++;
    $("#" + id).val(value);
}
;

function subFood(id) {
    var value = document.getElementById(id).value;
    value == 0 ? "0" : value--;
    $("#" + id).attr("value", parseInt(value));
    $("#" + id).val(value);
}
;
$(document).ready(function () {
//    $('#form').each(function () {
//        this.reset();
//    });
    $('#btnOrder').hide();
});

function addFood(id) {
    var value = document.getElementById(id).value;
    value++;
    $("#" + id).val(value);
    $("#" + id).attr("value", parseInt(value));
    $('#btnOrder').show();
}
;

function subFood(id) {
    var value = document.getElementById(id).value;
    value <= 0 ? 0 : value--;
    $("#" + id).val(value);
    $("#" + id).attr("value", parseInt(value));
    $('#btnOrder').show();

}
;

$('#form').submit(function (e) {
    var finalValue = "";
    $('input').each(function (index, element) {
        var value = $(this).val();
        if (value > 0) {
            var id = $(this).attr('id');
            var valueAndID = id.concat(",", value);
            finalValue = finalValue.concat("/", valueAndID);
        }
    });
    $('#bind-value').attr('value', finalValue);
});

$('#form input[type=number]').change(function () {
    $('#btnOrder').show();
});

$(".input-amount").keydown(function (evt) {
    var value = $('.input-amount').val();
    $('#btnOrder').show();
});

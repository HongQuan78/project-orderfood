function hihi() {
    alert("hihi");

}
;

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

$('#form').submit(function (e) {
    var finalValue = "";
    $('input').each(function (index, element) {
        var value = $(this).val();
        if (value > 0) {
            var id = $(this).attr('id');
            var valueAndID = id.concat(",", value);
            finalValue = finalValue.concat("/", valueAndID);

            alert(valueAndID);
            $(this).val(valueAndID);
        }
    });
    alert(finalValue);
    $('#bind-value').attr('value', finalValue);
});

$('#form').each(function () {
    this.reset();
});
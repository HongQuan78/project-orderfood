jQuery(function ($) {
    $(document).load(function () {
        $(".page-wrapper").css('display', 'none');
    });
    $("#close-sidebar").click(function () {
        $(".page-wrapper").removeClass("toggled");
    });
    $("#show-sidebar").click(function () {
        $(".page-wrapper").addClass("toggled");
    });
});

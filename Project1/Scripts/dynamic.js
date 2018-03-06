$(function () {
    function dynamic() {
        var i = Math.floor(Math.random() * 9999) + 1;
        $(".dynamic").css("color", "#4" + i + "9");
    }
    setInterval(dynamic, 2000);
});

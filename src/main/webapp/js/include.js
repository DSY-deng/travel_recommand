$(function () {
    $.get("/jsp/front/common/header.jsp",function (data) {
        $("#header").html(data);
    });
    $.get("/jsp/front/common/footer.jsp",function (data) {
        $("#footer").html(data);
    });
});
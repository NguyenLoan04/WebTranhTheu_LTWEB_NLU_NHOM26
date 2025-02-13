
//Each properties show
$(".list-group-item").click(function () {
    $(".list-group-item").removeClass("active");
    $(this).addClass("active");
})
$(".list-group-item").on("click", function (event) {
    event.preventDefault();
    const url = $(this).attr("href")
    $('#content').empty();
    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            $("#content").html(data); // Cập nhật nội dung vào phần #content
        },
        error: function () {
            alert("Lỗi");
        }
    });
})

//Log out
$(".logout-btn").click(function () {
    $("#logout-alert").removeClass("d-none")
    $("#logout-container").removeClass("d-none")
})
$("#noBtn").click(function () {
    $("#logout-alert").addClass("d-none")
    $("#logout-container").addClass("d-none")
})
$("#logout-container").click(function () {
    $("#logout-alert").addClass("d-none")
    $("#logout-container").addClass("d-none")
})



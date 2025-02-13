$(".ajax-link").on("click", function (event) {
    event.preventDefault(); // Ngăn tải lại trang
    const url = $(this).attr("href"); // Lấy URL của trang cần tải

    // Dọn sạch content
    $('#content').empty();

    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            $("#content").html(data); // Cập nhật nội dung vào phần #content
        },
        error: function () {
            alert("Có lỗi xảy ra khi tải nội dung.");
        }
    });

    $('.ajax-link.active').removeClass('active');
    $(this).addClass('active'); // Đánh dấu menu đang chọn
});

// Lần đầu khởi tạo trang
$('#dashboard').click();


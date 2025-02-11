$(document).ready(function () {
    // Kiểm tra và hủy bảng nếu đã khởi tạo
    if ($.fn.DataTable.isDataTable('#myProviderEditTable')) {
        $('#myProviderEditTable').DataTable().destroy(); // Hủy bảng
        $('#myProviderEditTable').empty(); // Làm sạch nội dung bảng (nếu cần thay đổi cấu trúc cột)
    }

    // Khởi tạo lại DataTable
    var table = $('#myProviderEditTable').DataTable({
        scrollY: "300px",
        scrollX: "100%",
        initComplete: function () {
            // Tùy chỉnh giao diện
            $('.dt-search label').text("Tìm kiếm: ").css("margin-right", "10px");
            $('.dt-length label').text("Số lượng hiển thị mỗi trang").css("margin-left", "10px");
            $('.dt-info').css("display", "none");
            $('.dt-search input').css("width", "300px");
            $('table.dataTable th.dt-type-numeric').css("text-align", "center");
        }
    });

    // Sự kiện cho nút Edit
    $('#editBtn').click(function () {
        $('#title').text('Chỉnh sửa nhà cung cấp');
        $('.read').addClass('d-none');
        $('#name-provider').prop('disabled', false);
        $('#address').prop('disabled', false);
        $('.edit-hidden').removeClass('d-none');
    });

    // Sự kiện cho nút Cancel
    $('#cancelEditBtn').click(function () {
        $('#read-edit-provider-form')[0].reset(); // Reset form
        $('#title').text('Xem nhà cung cấp');
        $('.read').removeClass('d-none');
        $('#name-provider').prop('disabled', true);
        $('#address').prop('disabled', true);
        $('.edit-hidden').addClass('d-none');
    });
});



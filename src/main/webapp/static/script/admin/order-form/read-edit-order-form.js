$(document).ready(function () {
    // Kiểm tra và hủy bảng nếu đã khởi tạo
    if ($.fn.DataTable.isDataTable('#myOrderEditTable')) {
        $('#myOrderEditTable').DataTable().destroy(); // Hủy bảng
        $('#myOrderEditTable').empty(); // Làm sạch nội dung bảng (nếu cần thay đổi cấu trúc cột)
    }

    // Khởi tạo lại DataTable
    var table = $('#myOrderEditTable').DataTable({
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
        // Cập nhật giao diện
        $('#title').text('Chỉnh sửa đơn hàng');
        $('.read').addClass('d-none');
        $('#date-delivery').prop('disabled', false);
        $('#status-order').prop('disabled', false);
        $('#reason-cancel-order').prop('disabled', false);
        $('.edit-hidden').removeClass('d-none');
    });

    // Sự kiện cho nút Cancel
    $('#cancelEditBtn').click(function () {
        $('#read-edit-order-form')[0].reset(); // Reset form
        $('#title').text('Xem đơn hàng');
        $('.read').removeClass('d-none'); // Hiển thị lại các phần tử bị ẩn
        $('#date-delivery').prop('disabled', true);
        $('#status-order').prop('disabled', true);
        $('#reason-cancel-order').prop('disabled', true);
        $('.edit-hidden').addClass('d-none'); // Ẩn các phần tử chỉnh sửa
    });

    $('#status-order').click(function () {
        const selectedText = $("#status-order option:selected").val();
        if(selectedText === "0") {
            $('.label-reason-cancel-order').removeClass('d-none');
            $('.select-reason-cancel-order').removeClass('d-none');
        } else {
            $('.label-reason-cancel-order').addClass('d-none');
            $('.select-reason-cancel-order').addClass('d-none');
        }
    });
});



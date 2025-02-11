$(document).ready(function () {
    // Kiểm tra và hủy bảng nếu đã khởi tạo
    if ($.fn.DataTable.isDataTable('#myTopicEditTable')) {
        $('#myTopicEditTable').DataTable().destroy(); // Hủy bảng
        $('#myTopicEditTable').empty(); // Làm sạch nội dung bảng (nếu cần thay đổi cấu trúc cột)
    }

    // Khởi tạo lại DataTable
    var table = $('#myTopicEditTable').DataTable({
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
        $('#title').text('Chỉnh sửa chủ đề');
        $('.read').addClass('d-none');
        $('#name-topic').prop('disabled', false);
        $('.status-topic').prop('disabled', false);
        $('.edit-hidden').removeClass('d-none');
        // Lặp qua tất cả các hàng của DataTable và hiển thị phần tử 'edit-hidden'
        table.rows().every(function () {
            var row = this.node();
            $(row).find('.edit-hidden').removeClass('d-none');
        });
        //vẽ lại giao diện cột
        table.columns.adjust().draw();
    });

    // Sự kiện cho nút Cancel
    $('#cancelEditBtn').click(function () {
        $('#read-edit-topic-form')[0].reset(); // Reset form
        $('#title').text('Xem chủ đề');
        $('.read').removeClass('d-none'); // Hiển thị lại các phần tử bị ẩn
        $('#name-topic').prop('disabled', true); // Tắt chỉnh sửa
        $('.status-topic').prop('disabled', true);
        $('.edit-hidden').addClass('d-none'); // Ẩn các phần tử chỉnh sửa
        // Lặp qua tất cả các hàng của DataTable và hiển thị phần tử 'edit-hidden'
        table.rows().every(function () {
            var row = this.node();
            $(row).find('.edit-hidden').addClass('d-none');
        });
        //vẽ lại giao diện cột
        table.columns.adjust().draw();
    });
});



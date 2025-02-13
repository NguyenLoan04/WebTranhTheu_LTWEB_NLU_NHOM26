$(document).ready(function () {
    // Kiểm tra và hủy bảng nếu đã khởi tạo
    if ($.fn.DataTable.isDataTable('#myDiscountProductEditTable')) {
        $('#myDiscountProductEditTable').DataTable().destroy(); // Hủy bảng
        $('#myDiscountProductEditTable').empty(); // Làm sạch nội dung bảng (nếu cần thay đổi cấu trúc cột)
    }

    // Khởi tạo lại DataTable
    var table = $('#myDiscountProductEditTable').DataTable({
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
        $('#title').text('Chỉnh sửa giảm giá');
        $('.read').addClass('d-none');
        $('#nameDiscount').prop('disabled', false);
        $('#description').prop('disabled', false);
        $('#percentDiscount').prop('disabled', false);
        $('#startDateDiscount').prop('disabled', false);
        $('#endDateDiscount').prop('disabled', false);

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
        $('#read-edit-promotion-form')[0].reset();
        $('#title').text('Xem giảm giá');
        $('.read').removeClass('d-none');
        $('#nameDiscount').prop('disabled', true);
        $('#description').prop('disabled', true);
        $('#percentDiscount').prop('disabled', true);
        $('#startDateDiscount').prop('disabled', true);
        $('#endDateDiscount').prop('disabled', true);

        $('.edit-hidden').addClass('d-none');
        // Lặp qua tất cả các hàng của DataTable và hiển thị phần tử 'edit-hidden'
        table.rows().every(function () {
            var row = this.node();
            $(row).find('.edit-hidden').addClass('d-none');
        });
        //vẽ lại giao diện cột
        table.columns.adjust().draw();
    });
});



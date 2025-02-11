$(document).ready(function () {
    const table = $('#myTable').DataTable({
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/promotion-management/get-promotion',
            dataSrc: function (json) {
                for (var i = 0; i < json.length; i++) {
                    var startTime = json[i].startedAt;

                    // Sử dụng Intl.DateTimeFormat để định dạng ngày theo định dạng "DD-MM-YYYY"
                    if (startTime && !isNaN(Date.parse(startTime))) {
                        var date = new Date(startTime);
                        var formattedDate = new Intl.DateTimeFormat('en-GB').format(date); // 'en-GB' để định dạng "DD/MM/YYYY"
                        json[i].startedAt = formattedDate;
                    } else {
                        json[i].startedAt = ''; // Nếu không phải là ngày hợp lệ, để trống
                    }

                    var endTime = json[i].endedAt;

                    // Sử dụng Intl.DateTimeFormat để định dạng ngày theo định dạng "DD-MM-YYYY"
                    if (endTime && !isNaN(Date.parse(endTime))) {
                        var date = new Date(endTime);
                        var formattedDate = new Intl.DateTimeFormat('en-GB').format(date); // 'en-GB' để định dạng "DD/MM/YYYY"
                        json[i].endedAt = formattedDate;
                    } else {
                        json[i].endedAt = ''; // Nếu không phải là ngày hợp lệ, để trống
                    }

                    if (json[i].value == null) {
                        json[i].value = 0;
                    }

                }
                return json;
            }
        },
        columnDefs: [
            {
                targets: 0, // Cột STT
                render: function (data, type, row, meta) {
                    return meta.row + 1; // Tự động tăng STT
                }
            },
            {
                targets: 5, // Cột hành động
                render: function (data, type, row) {
                    return `
                        <button class="btn-read-edit" data-id="${row.id}">Xem và Chỉnh Sửa</button>
                        <!--<button class="btn-delete" data-id="${row.id}">Tắt</button>-->
                    `;
                }
            }
        ],
        columns: [
            {data: null}, // Cột STT
            {data: 'title'},
            {data: 'value'},
            {data: 'startedAt'},
            {data: 'endedAt'},
            {data: null} // Cột hành động
        ]
    }); // Khởi tạo DataTable
    $('.dt-search label').text("Tìm kiếm: ").css("margin-right", "10px");
    $('.dt-length label').text("Số lượng hiển thị mỗi trang").css("margin-left", "10px");
    $('.dt-info').hide()
    $('.dt-search input').css("width", "300px");
    $('table.dataTable th.dt-type-numeric').css("text-align", "center");

    // Gắn sự kiện click cho formWrapper
    $('#formWrapper').on('click', function () {
        hiddenOverlay() // Tắt overlay
    });

    $('#addPromotionBtn').on("click", function (event) {
        event.preventDefault();
        const url = "/admin/promotion-management/add-promotion-form";
        $.ajax({
            url: url,
            type: "GET",
            success: function (data) {
                openOverlay();
                $("#formWrapper").html(data);

                // Ngăn sự kiện click trong form không lan lên formWrapper
                $('form').on('click', function (event) {
                    event.stopPropagation();
                });

                $('#formContainer').css({
                    'width': '650px',
                    'max-height': '90vh',
                    'z-index': '2',
                    'overflow': 'auto',
                });

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                $('#add-promotion-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang
                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedDiscountProduct = [];

                    $('.discount-product').each(function () {
                        // Lấy giá trị data-id của mỗi checkbox đã chọn và thêm vào mảng
                        selectedDiscountProduct.push($(this).val());
                    });

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/promotion-management/add-promotion',
                        type: 'POST',
                        data: {
                            name: $('#name-promotion').val(),
                            description: $('#description').val(),
                            value: $('#discount-value').val(),
                            startedAt: $('#start-discount').val(),
                            endedAt: $('#end-discount').val(),
                            selectedDiscountProduct: selectedDiscountProduct,
                        },
                        traditional: true,
                        success: function () {
                            alert('Thêm giảm giá thành công!');
                            $('#add-promotion-form')[0].reset(); // Reset form
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi thêm giảm giá!');
                        }
                    });
                });
            },
            error: function () {
                alert("Có lỗi xảy ra khi tải nội dung.");
            }
        });
    });

    $('#myTable').on('click', '.btn-read-edit', function () {
        const discountId = $(this).data('id');
        const url = "/admin/promotion-management/read-edit-promotion-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {discountId: discountId},
            success: function (data) {
                openOverlay();
                $('#formWrapper').html(data);

                // Ngăn sự kiện click trong form không lan lên formWrapper
                $('form').on('click', function (event) {
                    event.stopPropagation();
                });

                $('#formContainer').css({
                    'width': '650px',
                    'max-height': '90vh',
                    'z-index': '2',
                    'overflow': 'auto',
                });

                // Xử lý nút hủy
                $('#cancelBtn').on('click', function () {
                    hiddenOverlay();
                });

                $('#read-edit-promotion-form').on('submit', function (event) {
                    event.preventDefault();

                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedProductIdsDelete = [];

                    // Lặp qua tất cả các checkbox có class .delete-product-of-category
                    $('.delete-product-of-discount:checked').each(function () {
                        // Lấy giá trị data-id của mỗi checkbox đã chọn và thêm vào mảng
                        selectedProductIdsDelete.push($(this).data('id'));
                    });

                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedProductIdsAdd = [];

                    // Lấy tất cả các option được chọn trong select
                    $('#addProduct option:selected').each(function () {
                        // Lấy giá trị của mỗi option đã chọn và thêm vào mảng
                        selectedProductIdsAdd.push($(this).val());
                    });

                    $.ajax({
                        url: "/admin/promotion-management/update-promotion",
                        type: "POST",
                        traditional: true,
                        data: {
                            promotionId: $('#submitBtn').val(),
                            title: $('#nameDiscount').val(),
                            description: $('#description').val(),
                            value: $('#percentDiscount').val(),
                            startedAt: $('#startDateDiscount').val(),
                            endedAt: $('#endDateDiscount').val(),
                            selectedProductIdsDelete: selectedProductIdsDelete,
                            selectedProductIdsAdd: selectedProductIdsAdd,
                        },
                        success: function () {
                            alert('Chỉnh sửa giảm giá thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi chỉnh sửa giảm giá!');
                        }
                    });
                });


            },
            error: function () {
                alert("Có lỗi xảy ra khi tải nội dung.");
            }
        });
    });

    function hiddenOverlay() {
        $('#formWrapper').css({
            'display': 'none',
        });
    }

    function openOverlay() {
        $('#formWrapper').css({
            'display': 'flex',
            'justify-content': 'center',
            'align-items': 'center',
        });
    }
});


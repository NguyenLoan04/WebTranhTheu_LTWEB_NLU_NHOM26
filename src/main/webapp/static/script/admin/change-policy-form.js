$(document).ready(function () {
    const table = $('#myTable').DataTable( {
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/policy-management/get-policy',
            dataSrc: function (json) {
                for (var i = 0; i < json.length; i++) {
                    var timestamp = json[i].createdAt;

                    // Sử dụng Intl.DateTimeFormat để định dạng ngày theo định dạng "DD-MM-YYYY"
                    if (timestamp && !isNaN(Date.parse(timestamp))) {
                        var date = new Date(timestamp);
                        var formattedDate = new Intl.DateTimeFormat('en-GB').format(date); // 'en-GB' để định dạng "DD/MM/YYYY"
                        json[i].createdAt = formattedDate;
                    } else {
                        json[i].createdAt = ''; // Nếu không phải là ngày hợp lệ, để trống
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
                targets: 4, // Cột hành động
                render: function (data, type, row) {
                    return `
                        <button class="btn-read-edit" data-id="${row.id}">Xem và Chỉnh Sửa</button>
                        <button class="btn-delete" data-id="${row.id}">Xóa</button>
                    `;
                }
            }
        ],
        columns: [
            {data: null}, // Cột STT
            {data: 'title'},
            {data: 'countProduct'},
            {data: 'createdAt'},
            {data: null} // Cột hành động
        ]
    }); // Khởi tạo DataTable
    $('.dt-search label').text("Tìm kiếm: ").css("margin-right", "10px");
    $('.dt-length label').text("Số lượng hiển thị mỗi trang").css("margin-left", "10px");
    $('.dt-info').hide()
    $('.dt-search input').css("width", "300px");
    $('table.dataTable th.dt-type-numeric').css("text-align", "center");

    // Gắn sự kiện click cho formWrapper
    $('#formWrapper').on('click', function (event) {
        hiddenOverlay() // Tắt overlay
    });

    $('#addPolicyBtn').on('click', function(event) {
        event.preventDefault();
        const url = "/admin/policy-management/add-policy-form";
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
                    'width': '500px',
                    'max-height': '90vh',
                    'z-index': '2',
                    'overflow': 'auto',
                });

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                // Gửi dữ liệu từ form thêm chính sách
                $('#add-policy-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/policy-management/add-policy',
                        type: 'POST',
                        data: {
                            name: $('#name-policy').val(),
                            description: $('#description').val()
                        },
                        success: function (response) {
                            if (response.success) {
                                alert('Thêm chính sách thành công!');
                                $('#add-policy-form')[0].reset(); // Reset form
                                table.ajax.reload();
                                hiddenOverlay();
                            } else {
                                alert('Lỗi khi thêm chính sách!');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi thêm chính sách!');
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
        const policyId = $(this).data("id");
        const url = "/admin/policy-management/read-edit-policy-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {policyId: policyId},
            success: function (data) {
                openOverlay();
                $('#formWrapper').html(data);

                // Ngăn sự kiện click trong form không lan lên formWrapper
                $('form').on('click', function (event) {
                    event.stopPropagation();
                });

                $('#formContainer').css({
                    'width': '600px',
                    'max-height': '90vh',
                    'z-index': '2',
                    'overflow': 'auto',
                });

                // Xử lý nút hủy
                $('#cancelBtn').on('click', function () {
                    hiddenOverlay();
                });

                // Gửi dữ liệu từ form chỉnh sửa danh mục
                $('#read-edit-policy-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedProductIdsDelete = [];

                    $('#deleteProduct option:selected').each(function () {
                        selectedProductIdsDelete.push($(this).val());
                    });

                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedProductIdsAdd = [];

                    // Lấy tất cả các option được chọn trong select
                    $('#addProduct option:selected').each(function () {
                        // Lấy giá trị của mỗi option đã chọn và thêm vào mảng
                        selectedProductIdsAdd.push($(this).val());
                    });

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/policy-management/update-policy',
                        type: 'POST',
                        traditional: true, //đảm bảo mảng có thể gửi qua servlet có thể lấy được dữ liệu
                        data: {
                            policyId: $('#submitBtn').val(),
                            name: $('#name-policy').val(),
                            selectedProductIdsDelete: selectedProductIdsDelete,
                            selectedProductIdsAdd: selectedProductIdsAdd,
                            description: $('#description').val(),
                        },
                        success: function () {
                            alert('Cập nhật chính sách thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi cập nhật chính sách!');
                        }
                    });
                });
            },
            error: function () {
                alert("Có lỗi xảy ra khi tải nội dung.");
            }
        });
    });

    $('#myTable').on('click', '.btn-delete', function () {
        const policyId = $(this).data('id');
        const url = "/admin/policy-management/delete-policy-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {policyId: policyId},
            success: function (data) {
                openOverlay();
                $('#formWrapper').html(data);

                // Ngăn sự kiện click trong form không lan lên formWrapper
                $('form').on('click', function (event) {
                    event.stopPropagation();
                });

                $('#formContainer').css({
                    'width': '500px',
                    'max-height': '90vh',
                    'z-index': '2',
                })

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                $('#delete-policy-form').on('submit', function (event) {
                    event.preventDefault();

                    $.ajax({
                        url: "/admin/policy-management/delete-policy",
                        type: "POST",
                        data: {policyId: $('#confirmYes').val()},
                        success: function () {
                            alert('Xóa chính sách thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Xóa chính sách thất bại!');
                        }
                    });
                });

            },
            error: function () {
                alert("Có lỗi xảy ra khi tải nội dung.");
            }
        });
    })

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



$(document).ready(function () {
    const table = $('#myTable').DataTable({
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/material-management/get-material',
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

                    // xử lý trạng thaí danh mục
                    var status = json[i].active;
                    if (status != null) {
                        switch (status) {
                            case 0:
                                json[i].active = "Vô hiệu hóa";
                                break;
                            case 1:
                                json[i].active = "Đang hoạt động";
                                break;
                            default:
                                json[i].active = "";
                        }
                    } else {
                        json[i].active = "";
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
                    `;
                }
            }
        ],
        columns: [
            {data: null}, // Cột STT
            {data: 'title'}, // Tên danh mục
            {data: 'createdAt'}, // Số lượng
            {data: 'active'},
            {data: null} // Cột hành động
        ]
    });
    // Khởi tạo DataTable
    $('.dt-search label').text("Tìm kiếm: ").css("margin-right", "10px");
    $('.dt-length label').text("Số lượng hiển thị mỗi trang").css("margin-left", "10px");
    $('.dt-info').hide()
    $('.dt-search input').css("width", "300px");
    $('table.dataTable th.dt-type-numeric').css("text-align", "center");

    // Gắn sự kiện click cho formWrapper
    $('#formWrapper').on('click', function () {
        hiddenOverlay() // Tắt overlay
    });

    $('#addMaterialBtn').on("click", function (event) {
        event.preventDefault();
        const url = "/admin/material-management/add-material-form";
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
                });

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                // Gửi dữ liệu từ form thêm
                $('#add-material-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/material-management/add-material',
                        type: 'POST',
                        data: {
                            name: $('#name-material').val(),
                            status: $('#status-material').val()
                        },
                        success: function (response) {
                            if (response.success) {
                                alert('Thêm vật liệu thành công!');
                                $('#add-material-form')[0].reset(); // Reset form
                                table.ajax.reload();
                                hiddenOverlay();
                            } else {
                                alert('Lỗi khi thêm vật liệu!');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi thêm vật liệu!');
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
        const materialId = $(this).data("id");
        const url = "/admin/material-management/read-edit-material-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {materialId: materialId},
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
                    'overflow': 'auto',
                });

                // Xử lý nút hủy
                $('#cancelBtn').on('click', function () {
                    hiddenOverlay();
                });

                // Gửi dữ liệu từ form chỉnh sửa danh mục
                $('#read-edit-material-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/material-management/update-material',
                        type: 'POST',
                        data: {
                            materialId: $('#submitBtn').val(),
                            name: $('#name-material').val(),
                            status: $('#status-material').val(),
                        },
                        success: function (response) {
                            if(response.success) {
                                alert('Cập nhật vật liệu thành công!');
                                table.ajax.reload();
                                hiddenOverlay();
                            } else {
                                alert('Lỗi khi cập nhật vật liệu!');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi cập nhật vật liệu!');
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



$(document).ready(function () {
    const table = $('#myTable').DataTable({
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/user-management/get-user',
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

                    // xử lý giá trị giới tính
                    var status = json[i].gender;
                    if (status != null) {
                        switch (status) {
                            case 1:
                                json[i].gender = "Nam";
                                break;
                            case 2:
                                json[i].gender = "Nữ";
                                break;
                            default:
                                json[i].gender = "";
                        }
                    } else {
                        json[i].gender = "";
                    }

                    // xử lý trạng thaí người dùng
                    var statusAccount = json[i].statusAccount;
                    if (statusAccount != null) {
                        switch (statusAccount) {
                            case 0:
                                json[i].statusAccount = "Vô hiệu hóa";
                                break;
                            case 1:
                                json[i].statusAccount = "Chưa xác thực";
                                break;
                            case 2:
                                json[i].statusAccount = "Đang hoạt động";
                                break;
                            default:
                                json[i].statusAccount = "";
                        }
                    } else {
                        json[i].status = "";
                    }

                    //xử lý username, password
                    var username = json[i].username;
                    if(username == null) {
                        json[i].username = "";
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
                targets: 7, // Cột hành động
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
            {data: 'fullName'},
            {data: 'username'},
            {data: 'numOrderBought'},
            {data: 'gender'},
            {data: 'createdAt'},
            {data: 'statusAccount'},
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

    $('#addUserBtn').on("click", function (event) {
        event.preventDefault();
        const url = "/admin/user-management/add-user-form";
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
                })

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                $('#add-user-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    var formdata = new FormData(this);
                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/user-management/add-user',
                        type: 'POST',
                        data: formdata,
                        processData: false, // Không tuần tự hóa dữ liệu
                        contentType: false, // Không đặt Content-Type
                        success: function (response) {
                            if (response.success) {
                                alert('Thêm người dùng thành công!');
                                $('#add-user-form')[0].reset(); // Reset form
                                table.ajax.reload();
                                hiddenOverlay();
                            } else {
                                alert('Lỗi khi thêm người dùng!');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi thêm người dùng!');
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
        const userId = $(this).data('id');
        const url = "/admin/user-management/read-edit-user-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {userId: userId},
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

                $('#read-edit-user-form').on('submit', function (event) {
                    event.preventDefault();

                    var formData = new FormData(this);
                    formData.append("userId", $('#submitBtn').val())
                    $.ajax({
                        url: "/admin/user-management/update-user",
                        type: "POST",
                        data: formData,
                        processData: false,  // Không chuyển đổi dữ liệu thành chuỗi
                        contentType: false,
                        success: function () {
                            alert('Chỉnh sửa người dùng thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi chỉnh sửa người dùng!');
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


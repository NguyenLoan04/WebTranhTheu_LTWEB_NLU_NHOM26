$(document).ready(function () {
    const table = $('#myTable').DataTable( {
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/topic-management/get-topic',
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

                    // xử lý trạng thaí chủ đề
                    var status = json[i].active;
                    if(status != null) {
                        switch (status) {
                            case 0:
                                json[i].active = "Vô hiệu hóa";
                                break;
                            case 1:
                                json[i].active = "Đang hoạt động";
                                break;
                            default: json[i].active = "";
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
                targets: 6, // Cột hành động
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
            {data: 'title'}, // Tên danh mục
            {data: 'quantity'}, // Số lượng
            {data: 'numProductBought'}, // Số sản phẩm đã bán
            {data: 'createdAt'}, // Ngày tạo
            {data: 'active'},
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

    $('#addTopicBtn').on("click", function(event) {
        event.preventDefault();
        const url = "/admin/topic-management/add-topic-form";
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

                // Gửi dữ liệu từ form thêm chủ đề
                $('#add-topic-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/topic-management/add-topic',
                        type: 'POST',
                        data: {
                            name: $('#name-topic').val(),
                            status: $('#status-topic').val()
                        },
                        success: function (response) {
                            if (response.success) {
                                alert('Thêm chủ đề thành công!');
                                $('#add-topic-form')[0].reset(); // Reset form
                                table.ajax.reload();
                                hiddenOverlay();
                            } else {
                                alert('Lỗi khi thêm chủ đề!');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi thêm chủ đề!');
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
        const topicId = $(this).data('id');
        const url = "/admin/topic-management/read-edit-topic-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {topicId: topicId},
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

                //Gửi dữ liệu từ form chỉnh sửa chủ đề
                $('#read-edit-topic-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    // Mảng để lưu các ID sản phẩm được chọn
                    var selectedProductIdsDelete = [];

                    // Lặp qua tất cả các checkbox có class .delete-product-of-category
                    $('.delete-product-of-topic:checked').each(function () {
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

                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/topic-management/update-topic',
                        type: 'POST',
                        traditional: true, //đảm bảo mảng có thể gửi qua servlet có thể lấy được dữ liệu
                        data: {
                            topicId: $('#submitBtn').val(),
                            name: $('#name-topic').val(),
                            selectedProductIdsDelete: selectedProductIdsDelete,
                            selectedProductIdsAdd: selectedProductIdsAdd,
                            statusTopic: $('#status-topic').val(),
                        },
                        success: function () {
                            alert('Cập nhật chủ đề thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi cập nhật chủ đề!');
                        }
                    });
                });
            },
            error: function () {
                alert("Có lỗi xảy ra khi tải nội dung.");
            }
        });
    });

    // $('.btn-delete').on("click", function(event) {
    //     event.preventDefault();
    //     const url = "/admin/topic-management/delete-topic";
    //     $.ajax({
    //         url: url,
    //         type: "GET",
    //         success: function (data) {
    //             openOverlay();
    //             $('#formWrapper').html(data);
    //
    //             // Ngăn sự kiện click trong form không lan lên formWrapper
    //             $('form').on('click', function (event) {
    //                 event.stopPropagation();
    //             });
    //
    //             $('#formContainer').css({
    //                 'width': '500px',
    //                 'max-height': '90vh',
    //                 'z-index': '2',
    //             })
    //             $('#cancelBtn').click(function () {
    //                 hiddenOverlay();
    //             });
    //         },
    //         error: function () {
    //             alert("Có lỗi xảy ra khi tải nội dung.");
    //         }
    //     });
    // })

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




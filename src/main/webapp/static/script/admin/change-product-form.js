$(document).ready(function () {
    const table = $('#myTable').DataTable( {
        destroy: true,
        scrollY: "470px",
        ajax: {
            url: '/admin/product-management/get-product',
            dataSrc: function (json) {
                for (var i = 0; i < json.length; i++) {
                    // xử lý tình trạng đơn hàng
                    var status = json[i].status;
                    if(status != null) {
                        switch (status) {
                            case 0:
                                json[i].status = "Vô hiệu hóa";
                                break;
                            case 1:
                                json[i].status = "Đang hoạt động";
                                break;
                            default: json[i].status = "";
                        }
                    } else {
                        json[i].status = "";
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
                targets: 3, //cột hình ảnh
                render: function (data, type, row) {
                    return `
                    <div class="img-container"><img src="${row.imgUrl}"></div>
                    `;
                }
            },
            {
                targets: 8, // Cột hành động
                render: function (data, type, row) {
                    return `
                        <button class="btn-read-edit mb-2" data-id="${row.id}">Xem và Chỉnh Sửa</button>
                    `;
                }
            }
        ],
        columns: [
            {data: null}, // Cột STT
            {data: 'code'},
            {data: 'title'},
            {data: null},
            {data: 'available'},
            {data: 'totalStar'},
            {data: 'countEvaluate'},
            {data: 'status'},
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

    $('#addProductBtn').on("click", function(event) {
        event.preventDefault();
        const url = "/admin/product-management/add-product-form";
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
                    'width': '600px',
                    'max-height': '90vh',
                    'z-index': '2',
                    'overflow': 'auto',
                })

                $('#cancelBtn').click(function () {
                    hiddenOverlay();
                });

                $('#add-product-form').on('submit', function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang

                    var formdata = new FormData(this);
                    // Gửi dữ liệu qua AJAX
                    $.ajax({
                        url: '/admin/product-management/add-product',
                        type: 'POST',
                        data: formdata,
                        processData: false, // Không tuần tự hóa dữ liệu
                        contentType: false, // Không đặt Content-Type
                        success: function () {
                            alert('Thêm sản phẩm thành công!');
                            $('#add-product-form')[0].reset(); // Reset form
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            alert('Lỗi khi thêm sản phẩm!');
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
        const productId = $(this).data('id');
        const url = "/admin/product-management/read-edit-product-form";
        $.ajax({
            url: url,
            type: "GET",
            data: {productId: productId},
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

                $('#read-edit-product-form').on('submit', function (event) {
                    event.preventDefault();

                    var formData = new FormData(this);
                    formData.append("productId", $('#submitBtn').val());
                    $('.temp-hidden.product-price-row').each(function () {
                        formData.append("delProductPrice[]", $(this).data('id'));
                    });
                    $('.product-price-row').each(function () {
                        formData.append("listProductPrice[]", $(this).data('id'));
                    });
                    formData.forEach((value, key) => {
                        console.log(key, value);  // In ra key và value trong FormData
                    });
                    $.ajax({
                        url: "/admin/product-management/update-product",
                        type: "POST",
                        data: formData,
                        processData: false,  // Không chuyển đổi dữ liệu thành chuỗi
                        contentType: false,
                        success: function (response) {
                            alert('Chỉnh sửa sản phẩm thành công!');
                            table.ajax.reload();
                            hiddenOverlay();
                        },
                        error: function () {
                            console.log("herree")
                            alert('Lỗi khi chỉnh sửa sản phẩm!');
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


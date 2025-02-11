$(document).ready(function () {
    // Kiểm tra và hủy bảng nếu đã khởi tạo
    if ($.fn.DataTable.isDataTable('#myProductEditTable')) {
        $('#myProductEditTable').DataTable().destroy(); // Hủy bảng
        $('#myProductEditTable').empty(); // Làm sạch nội dung bảng (nếu cần thay đổi cấu trúc cột)
    }

    // Khởi tạo lại DataTable
    var table = $('#myProductEditTable').DataTable({
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
        $('#title').text('Chỉnh sửa sản phẩm');
        $('.read').addClass('d-none');
        $('#title-img').text('Xóa hình ảnh');
        $('#code_product').prop('disabled', false);
        $('#nameProduct').prop('disabled', false);
        $('#descriptionProduct').prop('disabled', false);
        $('.price').prop('disabled', false);
        $('.quantityProduct').prop('disabled', false);
        $('.widthProduct').prop('disabled', false);
        $('.heightProduct').prop('disabled', false);
        $('.material').prop('disabled', false);
        $('#status').prop('disabled', false);
        $('.provider').prop('disabled', false);
        $('#type').prop('disabled', false);
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
        $('#read-edit-product-form')[0].reset(); // Reset form
        $('#title').text('Xem sản phẩm');
        $('.read').removeClass('d-none');
        $('#title-img').text('Hình ảnh');
        $('#code_product').prop('disabled', true);
        $('#nameProduct').prop('disabled', true);
        $('#descriptionProduct').prop('disabled', true);
        $('.price').prop('disabled', true);
        $('.quantityProduct').prop('disabled', true);
        $('.widthProduct').prop('disabled', true);
        $('.heightProduct').prop('disabled', true);
        $('.material').prop('disabled', true);
        $('#status').prop('disabled', true);
        $('.provider').prop('disabled', true);
        $('#type').prop('disabled', true);
        $('.edit-hidden').addClass('d-none');
        $('.temp-hidden').removeClass('d-none');
        $('.temp-hidden.material-row').find('select').attr('name', 'material-product');
        $('.add-row').remove();
        // Lặp qua tất cả các hàng của DataTable và hiển thị phần tử 'edit-hidden'
        table.rows().every(function () {
            var row = this.node();
            $(row).find('.edit-hidden').addClass('d-none');
        });
        //vẽ lại giao diện cột
        table.columns.adjust().draw();
    });

});

function addProductPrice() {
    const newNode = document.createElement('div');
    newNode.className = 'row form-group product-price-row mb-2 add-row';
    newNode.innerHTML = `<div class="row ps-4">
                            <span class="style-label">Kích cỡ tranh</span>
                        </div>
                        <div class="col pe-0">
                            <!-- giá bán và số lượng -->
                            <div class="row pt-2">
                                <div class="col p-0 pe-1 text-center">
                                    <label class="style-label pb-2">Giá bán (VNĐ)</label>
                                    <input type="number" name="add-price-product-price" class="w-100 style-input"
                                           placeholder="Nhập giá bán sản phẩm" required>
                                </div>
                                <div class="col p-0 ps-1 text-center">
                                    <label class="style-label pb-2">Số lượng</label>
                                    <input type="number" name="add-available-product-price" class="w-100 style-input"
                                           placeholder="Nhập số lượng sản phẩm" required>
                                </div>
                            </div>
                            <!-- kích thước -->
                            <div class="row pt-2">
                                <div class="col p-0 pe-1 text-center">
                                    <label class="style-label pb-2">Chiều rộng (cm)</label>
                                    <input type="number" class="w-100 style-input" name="add-width-product-price"
                                           placeholder="Chiều rộng (cm)">
                                </div>
                                <div class="col p-0 ps-1 text-center">
                                    <label class="style-label pb-2">Chiều cao (cm)</label>
                                    <input type="number" class="w-100 style-input" name="add-height-product-price"
                                           placeholder="Chiều cao (cm)">
                                </div>
                            </div>
                        </div>
                        <div class="col-1">
                            <i class="fa-solid fa-trash icon-del" onclick="remove(this)"></i>
                        </div>`;
    document.getElementById('product_price').appendChild(newNode);
}

function addMaterial() {
    const sampleNode = document.querySelector('.sample-material');
    const newNode = sampleNode.cloneNode(true);
    newNode.className = 'row add-row mb-2';
    $(newNode).find('select').attr('name', 'material-product');
    document.getElementById('materials').appendChild(newNode);
}

function remove(button) {
    const row = button.parentElement.parentElement;
    row.remove();
}

function hiddenProduct(button) {
    const row = button.parentElement.parentElement;
    $(row).addClass('temp-hidden d-none');
}

function hiddenMaterial(button) {
    const row = button.parentElement.parentElement;
    $(row).addClass('temp-hidden d-none');
    $(row).find('select').removeAttr('name');
}



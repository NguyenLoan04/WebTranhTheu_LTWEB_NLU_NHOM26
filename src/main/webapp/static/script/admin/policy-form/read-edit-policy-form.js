$(document).ready(function () {
    $('#editBtn').click(function () {
        $('#title').text('Chỉnh sửa chính sách')
        $('.read').addClass('d-none');
        $('#name-policy').prop('disabled', false);
        $('#description').prop('disabled', false);
        $('#deleteProduct').prop('disabled', false);
        $('#titleProductApplyPolicy').text('Xóa sản phẩm đã áp dụng chính sách (Chọn nhiều)');

        $('.edit-hidden').removeClass('d-none');
    });

    $('#cancelEditBtn').click(function () {
        $('#read-edit-policy-form')[0].reset(); // Reset form
        $('#title').text('Xem chính sách')
        $('.read').removeClass('d-none');
        $('#name-policy').prop('disabled', true);
        $('#description').prop('disabled', true);
        $('#deleteProduct').prop('disabled', true);
        $('#titleProductApplyPolicy').text('Danh sách sản phẩm áp dụng chính sách');

        $('.edit-hidden').addClass('d-none');
    });
});
$(document).ready(function () {
    // Sự kiện cho nút Edit
    $('#editBtn').click(function () {
        // Cập nhật giao diện
        $('#title').text('Chỉnh sửa vật liệu');
        $('.read').addClass('d-none');
        $('#name-material').prop('disabled', false);
        $('#status-material').prop('disabled', false);
        $('.edit-hidden').removeClass('d-none');
    });

    // Sự kiện cho nút Cancel
    $('#cancelEditBtn').click(function () {
        $('#read-edit-material-form')[0].reset(); // Reset form
        $('#title').text('Xem vật liệu');
        $('.read').removeClass('d-none'); // Hiển thị lại các phần tử bị ẩn
        $('#name-material').prop('disabled', true); // Tắt chỉnh sửa
        $('#status-material').prop('disabled', true);
        $('.edit-hidden').addClass('d-none'); // Ẩn các phần tử chỉnh sửa
    });
});



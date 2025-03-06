function addAddress() {
    const addressed = document.getElementById("addresses");
    const addressRow = document.createElement('div');
    addressRow.className = 'row';
    addressRow.innerHTML = `
                <div class="col p-0">
                        <input type="text" class="style-input w-100 mb-2 location" name="location"></div>
                <div class="col-1">
                    <i class="fa-solid fa-trash icon-del" onclick="remove(this)"></i>
               </div>`;
    addressed.appendChild(addressRow);
}

// function addWishProducts() {
//     const addWishProducts = document.getElementById('addWishProducts');
//     const sampleNode = document.getElementById('sampleAddWishProduct');
//     const newRow = sampleNode.cloneNode(true);
//     newRow.className = 'row mb-2';
//     const iconElement = newRow.querySelector('.icon-del');
//     iconElement.addEventListener('click', function () {
//         remove(this);
//     });
//     addWishProducts.appendChild(newRow);
// }

function remove(button) {
    button.parentElement.parentElement.remove();
}

// Khi click vào nút editAvatar, kích hoạt input file
$('#editAvatar').on('click', function () {
    document.getElementById("fileInput").click(); // Kích hoạt input file
});

$('#read-edit-user-form').on('reset', function () {
   const avt = document.getElementById('avatarImage');
   const sampleAvt = document.getElementById('sampleAvatarImage');
   avt.src = sampleAvt.src;
});

// Xử lý khi người dùng chọn file
document.getElementById("fileInput").addEventListener("change", () => {
    const fileInput = document.getElementById("fileInput"); // Lấy phần tử input
    const file = fileInput.files[0]; // Lấy file đầu tiên từ input

    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            document.getElementById("avatarImage").src = e.target.result; // Đổi ảnh avatar
        };
        reader.readAsDataURL(file); // Đọc file dưới dạng DataURL
    }
});

$('#editBtn').click(function () {
    $('#title').text('Chỉnh sửa thông tin người dùng')
    $('.read').addClass('d-none');
    $('#name').prop('disabled', false);
    $('#password').prop('disabled',false);
    $('#role').prop('disabled', false);
    $('#email').prop('disabled', false);
    $('#phone').prop('disabled', false);
    $('.gender').prop('disabled', false);
    $('#description').prop('disabled', false);
    $('#titleFavourProduct').text('Xóa sản phẩm yêu thích (Chọn nhiều)');
    //$('#favourProduct').prop('disabled', false);
    $('#status').prop('disabled', false);
    $('.quantity-product').prop('disabled', false);
    $('.edit-hidden').removeClass('d-none');
});

$('#cancelEditBtn').click(function () {
    $('#read-edit-user-form')[0].reset();
    $('#title').text('Xem thông tin người dùng');
    $('#name').prop('disabled', true);
    $('#password').prop('disabled',true);
    $('#role').prop('disabled', true);
    $('#email').prop('disabled', true);
    $('.read').removeClass('d-none');
    $('#phone').prop('disabled', true);
    $('.gender').prop('disabled', true);
    $('#description').prop('disabled', true);
    $('#titleFavourProduct').text('Xóa sản phẩm yêu thích (Chọn nhiều)');
    //$('#favourProduct').prop('disabled', true);
    $('#status').prop('disabled', true);
    $('.quantity-product').prop('disabled', true);
    $('.edit-hidden').addClass('d-none');
    $('.icon-del').click();
});
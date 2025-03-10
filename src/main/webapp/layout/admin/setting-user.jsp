<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cài đặt người dùng</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/setting-user.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3">
        <div class="col">
            <h3 class="style-title">Cài đặt người dùng</h3>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="img-container mx-auto">
                <img src="<c:out value="${sessionScope.account.getAvatarUrl()}"/>" class="img" id="avatar-container">
                <i class="fa-solid fa-pen-to-square icon-edit-avt update-hidden d-none" onclick="changeAvatar()"></i>
            </div>
        </div>
    </div>
    <div class="row px-5">
        <div class="col style-label align-content-center"><i
                class="fa-solid fa-circle-info d-inline pe-2"></i>Thông tin cá nhân
        </div>
        <div class="col text-end">
            <button class="btn-edit" id="btn-info-user"><i class="fa-solid fa-pen me-2"></i>Chỉnh sửa
            </button>
        </div>
    </div>
    <form style="padding-left: 150px; padding-right: 150px" id="info-admin-form" enctype="multipart/form-data">
        <input type="file" accept="image/*" id="file-avatar" class="d-none" name="avatar">
        <div class="row pb-5">
            <div class="col">
                <div class="row mt-2">
                    <div class="mb-3">Tên đăng nhập</div>
                    <div><input type="text" value="<c:out value="${sessionScope.account.getUsername()}"/>" name="username" class="w-100 style-input" id="username" required disabled></div>
                </div>
                <div class="row mt-4">
                    <div class="mb-3">Mật khẩu:</div>
                    <div><input type="password" name="password" class="w-100 style-input"
                                id="password" disabled></div>
                </div>
                <div class="row mt-4">
                    <div class="mb-3">Họ và tên</div>
                    <div><input type="text" value="<c:out value="${sessionScope.account.getFullName()}"/>" name="fullName" class="w-100 style-input"
                                id="name" disabled></div>
                </div>
            </div>
            <div class="col">
                <div class="row mt-2">
                    <div class="mb-3">Email</div>
                    <div><input type="text" value="<c:out value="${sessionScope.account.getEmail()}"/>" name="email" class="w-100 style-input"
                                id="email" disabled>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="mb-3">Số điện thoại</div>
                    <div><input type="text" value="<c:out value="${sessionScope.account.getPhone()}"/>" name="phone" class="w-100 style-input" id="phone"
                                disabled></div>
                </div>
                <div class="row mt-4">
                    <div class="mb-3">Giới tính</div>
                    <div>
                        <div class="d-inline">
                            <label>Nam</label>
                            <input type="radio" name="gender" value="1" ${sessionScope.account.getGender() == 1 ? 'checked' : ''} class="ms-1 me-3" id="gender-man" disabled>
                        </div>
                        <div class="d-inline">
                            <label>Nữ</label>
                            <input type="radio" name="gender" value="2" ${sessionScope.account.getGender() == 2 ? 'checked' : ''} class="ms-1" id="gender-woman" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-2 update-hidden d-none">
            <div class="col-2"></div>
            <div class="col">
                <button class="w-100 me-1 style-button" id="btn-close" type="button">Hủy</button>
            </div>
            <div class="col">
                <button class="w-100 ms-1 style-button" id="btn-update" type="submit">Cập nhật</button>
            </div>
            <div class="col-2"></div>
        </div>
    </form>
</div>
<script>
    $('#btn-info-user').click(function () {
        document.getElementById('password').disabled = false;
        document.getElementById('name').disabled = false;
        document.getElementById('email').disabled = false;
        document.getElementById('phone').disabled = false;
        document.getElementById('gender-man').disabled = false;
        document.getElementById('gender-woman').disabled = false;
        document.getElementById('btn-info-user').disabled = true;
        $('#btn-info-user').css({
            "opacity": "0.7"
        })
        $('.update-hidden').removeClass('d-none');
    });

    $('#btn-close').on('click', function () {
       location.reload();
    });

    function changeAvatar() {
        document.getElementById("file-avatar").click();
    }

    $('#file-avatar').on('change', function () {
        // Kiểm tra nếu có tệp được chọn
        if (this.files && this.files[0]) {
            // Tạo URL tạm thời cho ảnh đã chọn
            var reader = new FileReader();
            reader.onload = function (e) {
                // Cập nhật src của avatar-container với URL ảnh đã chọn
                $('#avatar-container').attr('src', e.target.result);
            };
            reader.readAsDataURL(this.files[0]);  // Đọc file ảnh dưới dạng URL
        }
    });

    $('#info-admin-form').on('submit', function (event) {
            event.preventDefault(); // Ngăn chặn reload trang

            var formData = new FormData(this);
            // Gửi dữ liệu qua AJAX
            $.ajax({
                url: '/admin/update-info-admin',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function () {
                    alert('Cập nhập thông tin thành công!');
                    location.reload();
                },
                error: function () {
                    alert('Lỗi khi cập nhật thông tin!');
                }
            });
    });
</script>
</body>
</html>

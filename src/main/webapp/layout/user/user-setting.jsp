<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
    <title>Cài đặt</title>
    <%--    <%@include file="../public/library.jsp" %>--%>
    <%--    <!-- css property -->--%>
    <%--    <link rel="stylesheet" href="../../static/style/user/account-page.css">--%>
    <link rel="stylesheet" href="../../static/style/user/style-forms/user-setting.css">
</head>
<body>
<div id="user_setting" class=" content-details col">
    <div class="h4 fw-semibold pt-3 ps-3">Cài đặt</div>
    <hr>
    <div class="container py-3">
        <div class="row avatar">
            <div class="col-3 py-5 ps-3 fw-semibold">Ảnh đại diện:</div>
            <div class="col-3"><img id="avatar-container" class="resized-image" src="${account.avatarUrl}"
                                    style="width: 100px;height: 100px;"></div>
            <button type="button" class="mt-5 change-img col-3 justify-content-center align-items-center text-center"
                    style="height: 40px" onclick="changeAvatar()">Thay đổi
            </button>
            <form style="padding-left: 150px; padding-right: 150px" id="info-user-form" enctype="multipart/form-data">
                <input type="file" accept="image/*" id="file-avatar" class="d-none" name="avatar">
                <div class="row update-hidden d-none">
                    <div class="col-9"></div>
                    <button id="btn-update" class="col-3" type="submit">Cập nhật</button>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="col-2 fw-semibold">Chọn theme:</div>
            <div class="col-1"></div>
            <div class="col-4">
                <div>
                    <label class="my-2">
                        <input type="radio" value="default" class="form-check-input" name="choose-theme" id="new-theme">
                        Theme mặc định
                    </label>
                </div>
                <div>
                    <label class="my-2">
                        <input type="radio" value="old" class="form-check-input" name="choose-theme" id="current-theme">
                        Theme tươi mát
                    </label>
                </div>
            </div>
            <div class="col"></div>
        </div>
        <div class="row">
            <div class="col-9"></div>
            <div class="col-3 pt-3">
                <button type="button" class="delete-account" onclick="deActivateUser(${account.id})">Xóa tài khoản
                </button>
            </div>
        </div>
    </div>
</div>
<%--<script src="static/script/header.js"></script>--%>
<script>
    function changeAvatar() {
        document.getElementById("file-avatar").click();
    }

    $("#file-avatar").change(function () {
        if (this.files && this.files[0]) {
            // Tạo URL tạm thời cho ảnh đã chọn
            var reader = new FileReader();
            reader.onload = function (e) {
                // Cập nhật src của avatar-container với URL ảnh đã chọn
                $('#avatar-container').attr('src', e.target.result);
            };
            reader.readAsDataURL(this.files[0]);  // Đọc file ảnh dưới dạng URL
        }
        $('.update-hidden').removeClass('d-none');
    })

    $("#info-user-form").on("submit", function (event) {
        event.preventDefault();
        // let formData= new FormData(this)
        let avatar = $("#avatar-container").attr("src")
        let formData = new FormData()
        formData.append("avatar", avatar)
        $.ajax({
            url: "/update-avatar",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function () {
                showMessageUpdate("Cập nhật ảnh đại diện thành công")
                window.location.reload()
            },
            error: function () {
                alert("Lỗi khi thay đổi avatar")
            }
        })
    })

    //
    function deActivateUser(accountId) {
        $.ajax({
            url: "/user/deactivate-user",
            type: "POST",
            data: {
                "accountId": accountId
            },
            success: function () {
                window.location = "/"
            },
            error: function () {
                showMessageUpdate("Không thể xóa tài khoản")
            }
        })
    }
</script>

<script>
    $("input[type=radio][name=choose-theme]").change(function () {
        console.log($(this).val())
        changeTheme($(this).val())
    })
</script>
</body>
</html>

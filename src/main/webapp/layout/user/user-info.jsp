<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
    <meta charset="UTF-8">
    <%--    <title>Thông tin người dùng </title>--%>
    <%--    <%@include file="../public/library.jsp" %>--%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/user/style-forms/user-info.css">
</head>
<body>
<div id="user-info" class="content-details col">
    <div class="h4 fw-semibold p-3">Thông tin tài khoản</div>
    <hr>
    <div class="input-info container">
        <div class="user-inputs">
            <div class="row p-3">Họ và Tên:</div>
            <input class="row ms-1" name="fullname" type="text" placeholder="Họ và tên" value="${account.fullName}">
            <div class="row">
                <div class="col-12 p-3">Địa chỉ email:</div>
                <div class="col-8"><input name="email" type="email" placeholder="Email" style="width: 100%"
                                          value="${account.email}">
                </div>
            </div>
            <div class="row">
                <div class="col-12 p-3">Số điện thoại:</div>
                <div class="col-8"><input name="phone" type="text" placeholder="Phone" style="width: 100%"
                                          value="${account.phone}">
                </div>
            </div>
            <div class="row mt-3">
                <label class="col-2">Giới Tính:</label>
                <select class="col-5" name="gender">
                    <option value="1" <c:if test="${account.gender == 1}">selected</c:if>>Nữ</option>
                    <option value="0" <c:if test="${account.gender == 0}">selected</c:if>>Nam</option>
                </select><br>
            </div>
        </div>
        <!-- Thay đổi mật khẩu -->
        <div class="change-pass container">
            <div class="row">
                <div class="col px-1 py-4">
                    <button id="change-password"><span>Đổi mật khẩu</span></button>
                    <!-- show ra đổi MK như nào-->
                    <div id="sub-change-pass" class=" container d-none">
                        <div class="row">
                            <div class="col p-2">Mật khẩu cũ:</div>
                            <div class="col"><input id="oldPassword" type="password" placeholder="Nhập..."></div>
                        </div>
                        <div class="row">
                            <div class="col p-2">Mật khẩu mới:</div>
                            <div class="col"><input id="newPassword" type="password" placeholder="Nhập..."></div>
                        </div>
                        <div class="row">
                            <div class="col-10"></div>
                            <button id="save-password" class="col-2" onclick="changePassword()">Lưu mật khẩu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Nút lưu-->
        <div class=" save-info container">
            <div class="row">
                <div class="col-8"></div>
                <div class="col-4">
                    <button id="save-info" type="reset" style="width:80%"
                            onclick="updateInfo()"><span>Lưu</span></button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script src="static/script/header.js"></script>--%>
<script src="../../static/script/account/user-info.js"></script>
<script>
    function updateInfo() {
        let accountId = '${sessionScope.accountId}'
        if (accountId !== '' || accountId !== null) {
            let fullname = $("input[name='fullname']").val();
            let email = $("input[name='email']").val();
            let phone = $("input[name='phone']").val();
            let gender = $("select[name='gender']").val();
            $.ajax({
                url: "user/user-info/edit-info",
                type: "POST",
                data: {
                    "fullname": fullname,
                    "email": email,
                    "phone": phone,
                    "gender": gender
                },
                // dataType: "json",
                success: function () {
                    showMessageUpdate("Cập nhật thành công")
                },
                error: function () {

                }
            })
        }
    }

    function changePassword(){
        let oldPassword= $("#oldPassword").val()
        let newPassword= $("#newPassword").val()
        console.log(oldPassword)
        console.log(newPassword)
        $.ajax({
            url:"/user/change-password",
            type: "POST",
            data:{
                "oldPassword": oldPassword,
                "newPassword": newPassword
            },
            success: function (){
                showMessageUpdate("Cập nhật mật khẩu thành công")
                $("#oldPassword").val("")
                $("#newPassword").val("")
            },
            error: function (){
                alert("Không thể cập nhật mật khẩu")
            }
        })
    }
</script>
</body>
</html>

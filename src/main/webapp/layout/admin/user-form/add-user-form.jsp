<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:51 PM
  To change this static use File | Settings | File statics.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <form class="form-container" id="add-user-form" enctype="multipart/form-data">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Thêm người dùng</h2></div>
        </div>
        <!-- tên đăng nhập -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên đăng nhập<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" name="username" placeholder="Nhập tên đăng nhập" required>
            </div>
        </div>
        <!-- mật khẩu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mật khẩu<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="password" name="password" class="w-100 style-input" placeholder="Nhập mật khẩu" required>
            </div>
        </div>
        <!-- họ và tên -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Họ và tên<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" name="fullName" class="w-100 style-input" placeholder="Nhập họ và tên" required>
            </div>
        </div>
        <!-- avatar -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Tải ảnh đại diện</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="file" name="avatar" class="w-100 style-input" accept="image/*"/>
            </div>
        </div>
        <!-- email -->
        <div class="row">
            <div class="col"><span class="style-title">Email<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="email" name="email" class="w-100 style-input" placeholder="Nhập email" required>
            </div>
        </div>
        <!-- số điện thoại -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Số điện thoại</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="tel" name="phone" class="w-100 style-input" placeholder="Nhập số điện thoại">
            </div>
        </div>
        <!-- giới tính -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Giới tính<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col text-end">
                <label>Nam</label>
                <input type="radio" name="gender" value="1" required>
            </div>
            <div class="col">
                <label>Nữ</label>
                <input type="radio" name="gender" value="2" required>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" name="description" placeholder="Nhập mô tả người dùng"></textarea>
            </div>
        </div>
        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="statusAccount" required>
                    <option value="2">Đang hoạt động</option>
                    <option value="0">Vô hiệu hóa</option>
                    <option value="1">Chưa xác thực</option>
                </select>
            </div>
        </div>
        <!-- phân quyền -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Phân quyền<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="role" required>
                    <option value="0">Người dùng bình thường</option>
                    <option value="1">Admin</option>
                </select>
            </div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col">
                <button id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col">
                <button class="style-button" type="submit">Thêm người dùng</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>

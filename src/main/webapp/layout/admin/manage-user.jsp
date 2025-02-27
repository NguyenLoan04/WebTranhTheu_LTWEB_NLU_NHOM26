<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý người dùng</h3></div>
        <div class="col text-end mt-3 me-4">
            <button class="btn-add" id="addUserBtn"><i class="fa-solid fa-plus me-2"></i>Thêm người dùng</button>
        </div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Tên người dùng</th>
                <th>Tên đăng nhập</th>
                <th>Số đơn hàng đặt</th>
                <th>Giới tính</th>
                <th>Ngày đăng ký</th>
                <th>Trạng thái</th>
                <th>Tiện ích</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="formWrapper" class="hidden mx-auto"></div>

<script src="../../static/script/admin/change-user-form.js"></script>
</body>
</html>

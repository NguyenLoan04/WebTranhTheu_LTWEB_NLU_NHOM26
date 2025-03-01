<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý chính sách</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý chính sách</h3></div>
        <div class="col text-end mt-3 me-4">
            <button class="btn-add" id="addPolicyBtn"><i class="fa-solid fa-plus me-2"></i>Thêm chính sách</button>
        </div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Tên chính sách</th>
                <th>Số lượng sản phẩm áp dụng</th>
                <th>Ngày tạo</th>
                <th>Tiện ích</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="formWrapper" class="hidden mx-auto"></div>

<script src="../../static/script/admin/change-policy-form.js"></script>
</body>
</html>

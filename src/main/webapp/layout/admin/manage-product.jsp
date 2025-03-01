<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/manage-product.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý sản phẩm</h3></div>
        <div class="col text-end mt-3 me-4">
            <button class="btn-add" id="addProductBtn"><i class="fa-solid fa-plus me-2"></i>Thêm sản phẩm</button>
        </div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Mã sản phẩm</th>
                <th>Tên tranh</th>
                <th>Hình ảnh</th>
                <th>Số lượng tồn kho</th>
                <th>Đánh giá tổng (<span
                        style="color: #e9f1ec">★</span>)</th>
                <th>Số lượng đánh giá</th>
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

<script src="../../static/script/admin/change-product-form.js"></script>
</body>
</html>

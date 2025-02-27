<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý nhà cung cấp</h3></div>
        <div class="col text-end mt-3 me-4">
            <button class="btn-add" id="addProviderBtn"><i class="fa-solid fa-plus me-2"></i>Thêm nhà cung cấp</button>
        </div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Tên nhà cung cấp</th>
<%--                <th>Số lượng sản phẩm đã cung cấp</th>--%>
                <th>Ngày tạo</th>
                <th>Địa chỉ</th>
                <th>Tiện ích</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="formWrapper" class="hidden"></div>

<script src="../../static/script/admin/change-provider-form.js"></script>
</body>
</html>

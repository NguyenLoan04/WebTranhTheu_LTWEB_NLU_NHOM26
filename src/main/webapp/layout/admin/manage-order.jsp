<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý đơn hàng</h3></div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Tên khách hàng</th>
                <th>Tên đăng nhập</th>
                <th>Tổng đơn hàng (VNĐ)</th>
                <th>Ngày đặt hàng</th>
                <th>Trạng thái</th>
                <th>Thanh toán</th>
                <th>Tiện ích</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<div id="formWrapper" class="hidden"></div>

<script src="../../static/script/admin/change-order-form.js"></script>
</body>
</html>

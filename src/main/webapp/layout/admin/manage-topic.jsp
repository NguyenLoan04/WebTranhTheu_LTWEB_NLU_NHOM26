<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý chủ đề</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/display-form-admin.css">

</head>
<body>
<div class="container-fluid">
    <div class="row mt-3 mb-2">
        <div class="col"><h3 class="style-title">Quản lý chủ đề</h3></div>
        <div class="col text-end mt-3 me-4">
            <button class="btn-add" id="addTopicBtn"><i class="fa-solid fa-plus me-2"></i>Thêm chủ đề</button>
        </div>
    </div>
    <div class="row">
        <table id="myTable" class="display custom-table w-100">
            <thead>
            <tr class="head-table">
                <th>STT</th>
                <th>Tên chủ đề</th>
                <th>Số lượng sản phẩm trong chủ đề</th>
                <th>Số lượng sản phẩm đã bán</th>
                <th>Ngày tạo</th>
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

<script src="../../static/script/admin/change-topic-form.js"></script>
</body>
</html>

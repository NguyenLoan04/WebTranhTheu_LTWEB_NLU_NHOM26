<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:41 PM
  To change this static use File | Settings | File statics.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!--enter code -->
    <form class="form-container" id="add-category-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Thêm danh mục</h2></div>
        </div>
        <!-- tên danh mục -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên danh mục<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập tên danh mục" id="name-category" required>
            </div>
        </div>
        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="status-category" required>
                    <option value="1" selected>Đang hoạt động</option>
                    <option value="0">Vô hiệu hóa</option>
                </select>
            </div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col">
                <button id="cancelBtn" type="button" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col">
                <button id="add-category" type="submit" class="style-button">Thêm danh mục</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>

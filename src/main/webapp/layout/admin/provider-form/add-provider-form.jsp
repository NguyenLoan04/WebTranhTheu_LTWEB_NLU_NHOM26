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
    <form class="form-container" id="add-provider-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Thêm nhà cung cấp</h2></div>
        </div>
        <!-- tên danh mục -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên nhà cung cấp<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập tên nhà cung cấp" id="name-provider" required>
            </div>
        </div>
        <!-- địa chỉ -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Địa chỉ nhà cung cấp<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập địa chỉ nhà cung cấp" id="address" required>
            </div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col">
                <button id="cancelBtn" type="button" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col">
                <button id="add-provider" type="submit" class="style-button">Thêm nhà cung cấp</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>

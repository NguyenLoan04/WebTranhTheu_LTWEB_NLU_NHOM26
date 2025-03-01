<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin danh mục</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-read-edit-category-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-category-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem danh mục</h2></div>
        </div>
        <!-- tên danh mục -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="name-category" placeholder="Nhập tên danh mục" value= "<c:out value="${category.getTitle()}"/>" required disabled>
            </div>
        </div>
        <!-- ds sản phẩm thuộc danh mục -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm thuộc danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myCategoryEditTable" class="w-100">
                    <thead>
                    <tr>
                        <th class="text-center">STT</th>
                        <th class="text-center">Mã sản phẩm</th>
                        <th class="text-center">Tên sản phẩm</th>
                        <th class="text-center d-none edit-hidden">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${listProduct}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${p.getCode()}</td>
                        <td>${p.getTitle()}</td>
                        <td class="d-none edit-hidden">
                            <input type="checkbox" name="selectedProductIdsDelete" class="delete-product-of-category" style="width: 15px; height: 15px" data-id="${p.getId()}">
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- thêm sp vào danh mục -->
        <div class="row pt-3 d-none add-product edit-hidden">
            <div class="col"><span class="style-title">Thêm sản phẩm thuộc danh mục (Chọn nhiều)</span></div>
        </div>
        <div class="row pt-2 d-none add-product edit-hidden">
            <div class="col p-0">
                <select class="style-select-many" id='addProduct' name="selectedProductIdsAdd" multiple>
                    <c:forEach var="p" items="${listProductNotInCategory}">
                    <option value="${p.getId()}">${p.getCode()} - ${p.getTitle()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <!-- lấy giá trị trạng thái -->
                <c:set var="status" value="${category.getActive()}"/>
                <select class="style-select status-category" id="status-category" required disabled>
                    <option value="1" ${status == 1 ? 'selected' : ''}>Đang hoạt động</option>
                    <option value="0" ${status == 0 ? 'selected' : ''}>Vô hiệu hóa</option>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled></div>
        </div>
        <!-- ngày chỉnh sửa -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${updateAt}" required disabled></div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col read">
                <button type="button" id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col read">
                <button type="button" class="style-button" id="editBtn">Chỉnh sửa</button>
            </div>
            <div class="col d-none edit-hidden">
                <button type="button" id="cancelEditBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col d-none edit-hidden">
                <button class="style-update-btn" name="categoryId" value="<c:out value="${category.getId()}"/>" type="submit" id="submitBtn">Cập nhật</button>
            </div>

        </div>
    </form>

    <!-- khi bấm nút chỉnh sửa thì hiện ra 2 select gồm select chứa sản phẩm thuộc danh mục
 và select còn lại chứa các sản phẩm không thuôc danh mục đó (có thể thêm sp vào danh mục) -->

</div>

<script src="../../../static/script/admin/category-form/read-edit-category-form.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin khuyến mãi</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-promotion-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem khuyến mãi</h2></div>
        </div>
        <!-- tiêu đề khuyến mãi -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tiêu đề khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" name="title" value="<c:out value="${discount.getTitle()}"/>" id="nameDiscount" placeholder="Nhập tiêu đề khuyến mãi" value="Giảm lễ 30/4" disabled required>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" id="description" name="description" placeholder="Nhập mô tả khuyến mãi" required disabled><c:out value="${discount.getDescription()}"/></textarea>
            </div>
        </div>

        <!-- khuyến mãi -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Phần trăm khuyến mãi (%)</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="number" id="percentDiscount" class="w-100 style-input" name="value" step="any" min="0" placeholder="Nhập phần trăm khuyến mãi" value="<c:out value="${discount.getValue()}"/>" disabled required>
            </div>
        </div>
        <!-- ds sản phẩm thuộc danh mục -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm áp dụng khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myDiscountProductEditTable" class="w-100">
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
                                <input type="checkbox" class="delete-product-of-discount" style="width: 15px; height: 15px" data-id="${p.getId()}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- thêm sp vào danh mục -->
        <div class="row pt-3 d-none add-product edit-hidden">
            <div class="col"><span class="style-title">Thêm sản phẩm thuộc khuyến mãi (Chọn nhiều)</span></div>
        </div>
        <div class="row pt-2 d-none add-product edit-hidden">
            <div class="col p-0">
                <select class="style-select-many" id='addProduct' name="selectedProductIdsAdd" multiple>
                    <c:forEach var="p" items="${listProductNotInDiscount}">
                        <option value="${p.getId()}">${p.getCode()} - ${p.getTitle()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- Ngày bắt đầu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày bắt đầu khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="datetime-local" class="w-100 style-input" name="start" id="startDateDiscount" value="${startedAt}" disabled></div>
        </div>
        <!-- kết thúc -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày kết thúc khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="datetime-local" class="w-100 style-input" id="endDateDiscount" value="${endedAt}" disabled></div>
        </div>

        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo khuyến mãi</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="datetime-local" class="w-100 style-input" value="${createAt}" required disabled></div>
        </div>
        <!-- ngày cập nhật -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="datetime-local" class="w-100 style-input" value="${updateAt}" required disabled></div>
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
                <button class="style-update-btn" name="topicId" value="<c:out value="${discount.getId()}"/>" type="submit" id="submitBtn">Cập nhật</button>
            </div>
        </div>
    </form>
</div>

<script src="../../../static/script/admin/promotion-form/read-edit-promotion-form.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin chính sách</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-policy-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem chính sách</h2></div>
        </div>
        <!-- tên chính sách -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Tên chính sách</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" id="name-policy" class="w-100 style-input"
                                        placeholder="Nhập tên chính sách" value="<c:out value="${policy.getTitle()}"/>"
                                        required disabled>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả chính sách</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" id="description" placeholder="Nhập mô tả chính sách"
                                           required disabled><c:out value="${policy.getDescription()}"/></textarea>
            </div>
        </div>
        <!-- ds sản phẩm áp dụng chính sách -->
        <div class="row pt-2">
            <div class="col"><span class="style-title" id="titleProductApplyPolicy">Sản phẩm áp dụng chính sách</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select-many" id="deleteProduct" name="products" multiple disabled>
                    <c:forEach var="p" items="${listProduct}">
                        <option value="${p.getId()}">${p.getCode()} - ${p.getTitle()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <!-- thêm sp áp dụng chính sách -->
        <div class="row pt-2 d-none edit-hidden">
            <div class="col"><span class="style-title">Thêm sản phẩm áp dụng chính sách (Chọn nhiều)</span></div>
        </div>
        <div class="row pt-2 d-none edit-hidden">
            <div class="col p-0">
                <select class="style-select-many" id="addProduct" name="products" multiple>
                    <c:forEach var="p" items="${listProductsNotUsePolicy}">
                        <option value="${p.getId()}">${p.getCode()} - ${p.getTitle()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo chính sách</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled>
            </div>
        </div>
        <!-- ngày cập nhật -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật chính sách</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${updateAt}" disabled></div>
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
                <button class="style-update-btn" value="<c:out value="${policy.getId()}"/>" type="submit" id="submitBtn">Cập nhật</button>
            </div>

        </div>
    </form>

    <!-- khi bấm nút chỉnh sửa thì hiện ra 2 select gồm select chứa sản phẩm áp dụng chính sách
và select còn lại chứa các sản phẩm không áp dụng chính sách đó (có thể thêm sp áp dụng chính sách) -->

</div>

<script src="../../../static/script/admin/policy-form/read-edit-policy-form.js"></script>
</body>
</html>

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
    <form class="form-container" id="read-edit-provider-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem nhà cung cấp</h2></div>
        </div>
        <!-- tên nhà cung cấp -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên nhà cung cấp</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="name-provider" placeholder="Nhập tên nhà cung cấp" value= "<c:out value="${provider.getProviderName()}"/>" required disabled>
            </div>
        </div>
        <!-- Địa chỉ -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Địa chỉ</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="address" placeholder="Nhập địa chỉ" value= "<c:out value="${provider.getAddress()}"/>" required disabled>
            </div>
        </div>
        <!-- ds sản phẩm thuộc nhà cung cấp -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm thuộc nhà cung cấp</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myProviderEditTable" class="w-100">
                    <thead>
                    <tr>
                        <th class="text-center">STT</th>
                        <th class="text-center">Mã sản phẩm</th>
                        <th class="text-center">Tên sản phẩm</th>
                        <th class="text-center">Loại</th>
                        <th class="text-center">Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${listProduct}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${p.getCode()}</td>
                        <td>${p.getTitle()}</td>
                        <td><c:choose>
                            <c:when test="${p.getType() == 1}">
                                Thành phẩm
                            </c:when>
                            <c:when test="${p.getType() == 0}">
                                Bán nguyên liệu
                            </c:when>
                            <c:otherwise>
                                Chưa xác định
                            </c:otherwise>
                        </c:choose></td>
                        <td><c:choose>
                            <c:when test="${p.getStatus() == 1}">
                                Đang hoạt động
                            </c:when>
                            <c:when test="${p.getStatus() == 0}">
                                Vô hiệu hóa
                            </c:when>
                            <c:otherwise>
                                Chưa xác định
                            </c:otherwise>
                        </c:choose></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo nhà cung cấp</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled></div>
        </div>
        <!-- ngày chỉnh sửa -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật nhà cung cấp</span></div>
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
                <button class="style-update-btn" name="providerId" value="<c:out value="${provider.getId()}"/>" type="submit" id="submitBtn">Cập nhật</button>
            </div>

        </div>
    </form>
</div>

<script src="../../../static/script/admin/provider-form/read-edit-provider-form.js"></script>
</body>
</html>

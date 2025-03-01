<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin chủ đề</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-read-edit-category-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form id="read-edit-topic-form" class="form-container">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem chủ đề</h2></div>
        </div>
        <!-- tên danh mục -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên chủ đề</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="name-topic"
                                        placeholder="Nhập tên chủ đề"
                                        value="<c:out value="${topic.getTitle()}"/>" required disabled>
            </div>
        </div>
        <!-- ds sản phẩm thuộc danh mục -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm thuộc chủ đề</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myTopicEditTable" class="display custom-table w-100">
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
                                <input type="checkbox" name="selectedProductIdsDelete" class="delete-product-of-topic"
                                       style="width: 15px; height: 15px" data-id="${p.getId()}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- thêm sp vào danh mục -->
        <div class="row pt-3 d-none add-product edit-hidden">
            <div class="col"><span class="style-title">Thêm sản phẩm thuộc chủ đề (Chọn nhiều)</span></div>
        </div>
        <div class="row pt-2 d-none add-product edit-hidden">
            <div class="col p-0">
                <select class="style-select-many" id='addProduct' name="selectedProductIdsAdd" multiple>
                    <c:forEach var="p" items="${listProductNotInTopic}">
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
                <c:set var="status" value="${topic.getActive()}"/>
                <select class="style-select status-topic" id="status-topic" required disabled>
                    <option value="1" ${status == 1 ? 'selected' : ''}>Đang hoạt động</option>
                    <option value="0" ${status == 0 ? 'selected' : ''}>Vô hiệu hóa</option>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo chủ đề</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled>
            </div>
        </div>
        <!-- ngày chỉnh sửa -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật chủ đề</span></div>
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
                <button class="style-update-btn" name="topicId" value="<c:out value="${topic.getId()}"/>" type="submit" id="submitBtn">Cập nhật</button>
            </div>

        </div>
    </form>

    <!-- khi bấm nút chỉnh sửa thì hiện ra 2 select gồm select chứa sản phẩm thuộc chủ đề
    và select còn lại chứa các sản phẩm không thuôc chủ đề đó (có thể thêm sp vào chủ đề) -->

</div>

<script src="../../../static/script/admin/topic-form/read-edit-topic-form.js"></script>
</body>
</html>

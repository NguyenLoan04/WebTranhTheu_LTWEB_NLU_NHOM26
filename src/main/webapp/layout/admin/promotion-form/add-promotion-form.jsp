<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:48 PM
  To change this static use File | Settings | File statics.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm khuyến mãi</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-add-promotion-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!--enter code -->
    <form class="form-container" id="add-promotion-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Thêm khuyến mãi</h2></div>
        </div>
        <!-- tiêu đề khuyến mãi -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tiêu đề khuyến mãi<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" id="name-promotion" class="w-100 style-input" placeholder="Nhập tiêu đề khuyến mãi" required>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả khuyến mãi<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea id="description" style="height: 100px" class="w-100 style-area" placeholder="Nhập mô tả khuyến mãi" required></textarea>
            </div>
        </div>

        <!-- khuyến mãi -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Phần trăm khuyến mãi (%)<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="number" id="discount-value" class="w-100 style-input" name="value" step="any" min="0" placeholder="Nhập phần trăm khuyến mãi" required>
            </div>
        </div>
        <!-- Sản phẩm khuyến mãi -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Thêm sản phẩm áp dụng khuyến mãi<i
                    class="fas fa-plus-circle ms-2 style-add-btn" onclick="addProduct()"></i></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <div id="discounts">
                    <div class="row mb-2 d-none sample-product d-none">
                        <div class="col">
                            <select class="style-select mb-2">
                                <c:forEach items="${listProduct}" var="p">
                                    <option value="${p.getId()}">${p.getCode()}-${p.getTitle()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-1 pe-0">
                            <i class="fa-solid fa-trash icon-del" onclick="remove(this)"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ngày bắt đầu, kết thúc khuyến mãi -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày bắt đầu khuyến mãi</span></div>
            <div class="col"><span class="style-title">Ngày kết thúc khuyến mãi</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0 pe-1"><input id="start-discount" type="datetime-local" class="w-100 style-input" id="startDateDiscount"></div>
            <div class="col p-0 ps-1"><input id="end-discount" type="datetime-local" class="w-100 style-input"></div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col">
                <button id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col">
                <button class="style-button" type="submit">Thêm khuyến mãi</button>
            </div>
        </div>
    </form>
</div>

<script>
    function addProduct() {
        const sampleNode = document.querySelector('.sample-product');
        const newNode = sampleNode.cloneNode(true);
        newNode.className = 'row add-row mb-2';
        $(newNode).find('select').addClass('discount-product');
        document.getElementById('discounts').appendChild(newNode);
    }

    function remove(button) {
        const row = button.parentElement.parentElement;
        row.remove();
    }
</script>
</body>
</html>

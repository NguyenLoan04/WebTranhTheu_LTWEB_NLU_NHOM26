<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-read-edit-product-form.css">
</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!--enter code -->
    <form class="form-container" id="add-product-form" enctype="multipart/form-data">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Thêm sản phẩm</h2></div>
        </div>
        <!-- mã sản phẩm -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Mã sản phẩm<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" name="codeProduct" class="w-100 style-input" placeholder="Nhập mã sản phẩm" required>
            </div>
        </div>
        <!-- tên sản phẩm -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên sản phẩm<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" name="title" class="w-100 style-input" placeholder="Nhập tên sản phẩm" required>
            </div>
        </div>
        <!-- Loại sản phẩm -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Loại sản phẩm<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="type" required>
                    <option value="0">Bán nguyên liệu</option>
                    <option value="1">Thành phẩm</option>
                </select>
            </div>
        </div>
        <!-- hình ảnh -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Tải ảnh sản phẩm lên<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="file" name="imgProduct" class="w-100 style-input" multiple required>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-1">
            <div class="col"><span class="style-title">Mô tả</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea name="description" class="w-100 style-area" placeholder="Mô tả sản phẩm"></textarea>
            </div>
        </div>

        <!-- loại tranh: kích thước khác nhau giá khác nhau -->
        <div class="row pt-2">
            <div class="col"><p class="style-title m-0">Kích cỡ tranh<span class="text-danger"> * </span><i
                    class="fas fa-plus-circle ms-2 style-add-btn" onclick="addProductPrice()"></i></p></div>
        </div>
        <div class="row pt-2">
            <div class="col">
                <div id="product_price">
                    <div class="row form-group product-price-row mb-2">
                        <div class="row ps-4">
                            <span class="style-label">Kích cỡ tranh</span>
                        </div>
                        <div class="col pe-0">
                            <!-- giá bán và số lượng -->
                            <div class="row pt-2">
                                <div class="col p-0 pe-1 text-center">
                                    <label class="style-label pb-2">Giá bán (VNĐ)</label>
                                    <input type="number" id="price" class="w-100 style-input" name="price"
                                           placeholder="Nhập giá bán sản phẩm" required>
                                </div>
                                <div class="col p-0 ps-1 text-center">
                                    <label class="style-label pb-2">Số lượng</label>
                                    <input type="number" id="quantityProduct" class="w-100 style-input" name="quantity"
                                           placeholder="Nhập số lượng sản phẩm" required>
                                </div>
                            </div>
                            <!-- kích thước -->
                            <div class="row pt-2">
                                <div class="col p-0 pe-1 text-center">
                                    <label class="style-label pb-2">Chiều rộng</label>
                                    <input type="number" class="w-100 style-input" id="widthProduct" name="width"
                                           placeholder="Chiều rộng (cm)">
                                </div>
                                <div class="col p-0 ps-1 text-center">
                                    <label class="style-label pb-2">Chiều cao</label>
                                    <input type="number" class="w-100 style-input" id="heightProduct" name="height"
                                           placeholder="Chiều cao (cm)">
                                </div>
                            </div>
                        </div>
                        <div class="col-1">
                            <i class="fa-solid fa-trash icon-del" onclick="removeProductPrice(this)"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- chất liệu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Chất liệu<i
                    class="fas fa-plus-circle ms-2 style-add-btn" onclick="addMaterial()"></i></span></div>
        </div>
        <div class="row pt-2" id="materials">
            <div class="row material-row mb-2">
                <div class="col p-0">
                    <select class="style-select" name="material">
                        <c:forEach items="${materials}" var="m">
                            <option value="${m.getId()}">${m.getTitle()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-1 pe-0">
                    <i class="fa-solid fa-trash icon-del" onclick="removeMaterial(this)"></i>
                </div>
            </div>
        </div>
        <!-- nhà phân phối -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Nhà phân phối<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="provider" required>
                    <c:forEach items="${providers}" var="p">
                    <option value="${p.getId()}">${p.getProviderName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="status" required>
                    <option value="1">Đang hoạt động</option>
                    <option value="0">Vô hiệu hóa</option>
                </select>
            </div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col">
                <button id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col">
                <button class="style-button" type="submit">Thêm sản phẩm</button>
            </div>
        </div>
    </form>
</div>

<script>
    function addProductPrice() {
        const productRow = document.querySelector('.product-price-row');
        const newRow = productRow.cloneNode(true);
        newRow.querySelectorAll('input').forEach(input => input.value = '');
        document.getElementById('product_price').appendChild(newRow);
    }

    function removeProductPrice(button) {
        const row = button.parentElement.parentElement;
        if (document.querySelectorAll('.product-price-row').length > 1) {
            row.remove();
        } else {
            alert("Phải có ít nhất một loại sản phẩm!");
        }
    }

    function addMaterial() {
        const materialRow = document.querySelector('.material-row');
        const newRow = materialRow.cloneNode(true);
        document.getElementById("materials").appendChild(newRow);
    }

    function removeMaterial(button) {
        const row = button.parentElement.parentElement;
        if (document.querySelectorAll('.material-row').length > 1) {
            row.remove();
        } else {
            alert("Phải có ít nhất một loại vật liệu!");
        }
    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin sản phẩm</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-read-edit-product-form.css">
</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-product-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem sản phẩm</h2></div>
        </div>
        <!-- mã sản phẩm -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Mã sản phẩm</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" id="code_product" class="w-100 style-input"
                                        value="${product.getCode()}" name="product-code" placeholder="Nhập mã sản phẩm" disabled
                                        required>
            </div>
        </div>
        <!-- tên sản phẩm -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên sản phẩm</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="nameProduct" name="name-product"
                                        value="${product.getTitle()}" required disabled>
            </div>
        </div>
        <!-- hình ảnh -->
        <div class="row pt-3">
            <div class="col"><span class="style-title" id="title-img">Hình ảnh</span></div>
        </div>
        <div class="row pt-2">
            <c:forEach items="${product.getListImageUrls()}" var="img">
                <div class="row mb-2">
                    <div class="col p-0 text-center">
                        <div class="img-product-container w-100">
                            <img src="${img}">
                        </div>
                    </div>
                    <div class="col-1 d-none edit-hidden">
                        <input type="checkbox" class="checkbox-del" name="del-img-product" value="${img}">
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row pt-3 d-none edit-hidden">
            <div class="col"><span class="style-title">Tải ảnh sản phẩm lên</span></div>
        </div>
        <div class="row pt-2 d-none edit-hidden">
            <div class="col p-0"><input type="file" class="w-100 style-input" name="add-img-product" multiple>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" id="descriptionProduct" name="description" required
                                           disabled>${product.getDescription()}</textarea>
            </div>
        </div>

        <!-- loại tranh: kích thước khác nhau giá khác nhau -->
        <div class="row pt-2">
            <div class="col"><p class="style-title m-0">Loại tranh<i
                    class="fas fa-plus-circle ms-2 style-add-btn d-none edit-hidden" onclick="addProductPrice()"></i>
            </p></div>
        </div>
        <div class="row pt-2">
            <div class="col">
                <div id="product_price">
                    <c:forEach items="${product.getListPrices()}" var="p">
                        <div class="row form-group product-price-row mb-2" data-id="${p.getId()}">
                            <div class="row ps-5">
                                <span class="style-label">Kích cỡ tranh</span>
                            </div>
                            <div class="col">
                                <!-- giá bán và số lượng -->
                                <div class="row pt-2">
                                    <div class="col p-0 pe-1 text-center">
                                        <label class="style-label pb-2">Giá bán (VNĐ)</label>
                                        <input type="number" class="w-100 style-input price"
                                               placeholder="Nhập giá bán sản phẩm" name="price-product-price" value="${p.getPrice()}" required
                                               disabled>
                                    </div>
                                    <div class="col p-0 ps-1 text-center">
                                        <label class="style-label pb-2">Số lượng</label>
                                        <input type="number" class="w-100 style-input quantityProduct"
                                               placeholder="Nhập số lượng sản phẩm" name="available-product-price" value="${p.getAvailable()}" required
                                               disabled>
                                    </div>
                                </div>
                                <!-- kích thước -->
                                <div class="row pt-2">
                                    <div class="col p-0 pe-1 text-center">
                                        <label class="style-label pb-2">Chiều rộng (cm)</label>
                                        <input type="number" class="w-100 style-input widthProduct"
                                               placeholder="Chiều rộng (cm)"
                                               value="${p.getWidth()}" name="width-product-price" disabled>
                                    </div>
                                    <div class="col p-0 ps-1 text-center">
                                        <label class="style-label pb-2">Chiều cao (cm)</label>
                                        <input type="number" class="w-100 style-input heightProduct"
                                               placeholder="Chiều cao (cm)"
                                               value="${p.getHeight()}" name="height-product-price" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1 d-none edit-hidden">
                                <i class="fa-solid fa-trash icon-del" onclick="hiddenProduct(this)"></i>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- chất liệu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Chất liệu<i
                    class="fas fa-plus-circle ms-2 style-add-btn d-none edit-hidden" onclick="addMaterial()"></i></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <div id="materials">
                    <div class="row mb-2 d-none sample-material d-none">
                        <div class="col">
                            <select class="style-select material mb-2" disabled>
                                <c:forEach items="${materials}" var="m">
                                    <option value="${m.getId()}">${m.getTitle()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-1 pe-0 edit-hidden d-none">
                            <i class="fa-solid fa-trash icon-del" onclick="remove(this)"></i>
                        </div>
                    </div>
                    <c:forEach items="${product.getListMaterials()}" var="material">
                        <div class="row mb-2 material-row">
                            <div class="col">
                                <select class="style-select material mb-2" name="material-product" disabled>
                                    <c:forEach items="${materials}" var="m">
                                        <option value="${m.getId()}" ${material.getId() == m.getId() ? 'selected' : ''}>${m.getTitle()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-1 pe-0 edit-hidden d-none">
                                <i class="fa-solid fa-trash icon-del" onclick="hiddenMaterial(this)"></i>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- nhà phân phối -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Nhà phân phối</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select provider" name="provider" disabled required>
                    <c:forEach items="${providers}" var="p">
                        <option value="${p.getId()}" ${product.getProvider().getId() == p.getId() ? 'selected' : ''}>${p.getProviderName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- table đánh giá sản phẩm -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Đánh giá của người dùng</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myProductEditTable" class="w-100">
                    <thead>
                    <tr>
                        <th class="text-center">ID người dùng</th>
                        <th class="text-center">Đánh giá (<span
                                style="color: #e9f1ec">★</span>)
                        </th>
                        <th class="text-center">Bình luận</th>
                        <th class="text-center">Ngày tạo</th>
                        <th class="text-center d-none edit-hidden">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${product.getListReviews()}" var="r">
                        <tr>
                            <td>${r.getAccountId()}</td>
                            <td><input type="number" class="reviewByStar" min="1" max="5" value="${r.getRating()}"
                                       style="width: 50px"
                                       required disabled></td>
                            <td><textarea class="style-textarea-cmt comment"
                                          disabled>${r.getContent()}</textarea></td>
                            <td><fmt:formatDate value="${r.getCreatedAt()}" pattern="dd/MM/yyyy"/></td>
                            <td class="d-none edit-hidden">
                                <input type="checkbox" name="del-review-product" style="width: 15px; height: 15px" value="${r.getId()}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Thể loại  -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Thể loại</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="type" name="type" required disabled>
                    <option value="1" ${product.getType() == 1 ? 'selected' : ''}>Thành phẩm</option>
                    <option value="0" ${product.getStatus() == 0 ? 'selected' : ''}>Bán nguyên liệu</option>
                </select>
            </div>
        </div>
        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="status" name="status" required disabled>
                    <option value="1" ${product.getStatus() == 1 ? 'selected' : ''}>Đang hoạt động</option>
                    <option value="0" ${product.getStatus() == 0 ? 'selected' : ''}>Vô hiệu hóa</option>
                </select>
            </div>
        </div>

        <!-- chính sách -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Chính sách</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <input type="text" class="w-100 style-input"
                       value="${product.getPolicy().getTitle()}" required disabled>
            </div>
        </div>
        <!-- chủ đề -->
        <div class="row pt-3">
            <div class="col"><span class="style-title" id="title-topic-product">Chủ đề</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <c:forEach items="${product.getListTopics()}" var="t">
                    <input type="text" class="w-100 style-input"
                           value="${t.getTitle()}" required disabled>
                </c:forEach>
            </div>
        </div>
        <!-- danh mục -->
        <div class="row pt-3">
            <div class="col"><span class="style-title" id="titleCategory">Danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <input type="text" class="w-100 style-input"
                       value="${product.getCategory().getTitle()}" required disabled>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày thêm sản phẩm</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" disabled>
            </div>
        </div>
        <!-- ngày cập nhật -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật sản phẩm</span></div>
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
                <button class="style-update-btn" value="<c:out value="${product.getId()}"/>" type="submit"
                        id="submitBtn">Cập nhật
                </button>
            </div>
        </div>
    </form>
</div>

<script src="../../../static/script/admin/product-form/read-edit-product-form.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<div class="order-details">
    <c:choose>
        <c:when test="${empty listOrder}">
            <div class="mt-5 h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                Không có sản phẩm
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="order" items="${listOrder}">
                <div class="order mb-4 p-4">
                    <div class="d-flex m-2">ID đơn hàng: <span class="fw-semibold">${order.id}</span></div>
                    <div class="d-flex m-2">Trạng thái đơn hàng: <span
                            class="fw-semibold">${order.getStatusDetail()}</span></div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Thông tin sản phẩm</th>
                            <th>Kích thước</th>
                            <th>Giá tiền</th>
                            <c:if test="${order.status==5}">
                                <th></th>
                            </c:if>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="product" items="${order.products}">
                            <tr>
                                <th style="width: 20%">
                                    <img src="${product.thumbnail}" class="my-3 resized-image" onclick="window.location.href = '/product?id=${product.id}'">
                                </th>
                                <th class="p-3">
                                    <p class="title h5 main-color">${product.title}</p>
                                    <p class="p-0">Số lượng: <span class="fw-semibold">${product.quantity}</span></p>
                                </th>
                                <th class="p-3">
                                    <p>${product.width} x ${product.height} cm</p>
                                </th>
                                <th class="p-3">
                                    <div class="product-price">${product.price}</div>
                                </th>
                                <c:if test="${order.status==5}">
                                    <th class="p-3">
                                        <div class="d-flex justify-content-center">
                                            <button type="button" class="mt-5 rounded p-2 sub-cta-button-background"
                                                    onclick="window.location.href = '/product?id=${product.id}'">
                                                Viết đánh giá
                                            </button>
                                        </div>
                                    </th>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <tr>
                            <th></th>
                            <th></th>
                            <c:if test="${order.status==5}">
                                <th></th>
                            </c:if>
                            <th class="py-3 text-center">Thành tiền:</th>
                            <th class="py-3">
                                <span class="total-price h5 fw-semibold">${order.totalPrice}</span>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-3"></div>
                        <div class="d-flex justify-content-center col-3">
                            <c:if test="${order.status==4}">
                                <button type="button" class="rounded py-2 px-3 sub-cta-button"
                                        onclick="updateOrderStatus(${order.id},6)">
                                    Yêu cầu đổi/trả
                                </button>
                            </c:if>
                        </div>


                        <div class="d-flex justify-content-center col-3">
                            <c:if test="${order.status>0 && order.status<3}">
                                <button type="button" class="rounded p-2 sub-cta-button"
                                        onclick="getCancelForm(${order.id})">
                                    Hủy hàng
                                </button>
                            </c:if>
                            <c:if test="${order.status==3}">
                                <button type="button" class="rounded p-2 main-cta-button" style="opacity: 50%">
                                    Đã nhận được hàng
                                </button>
                            </c:if>
                            <c:if test="${order.status==4}">
                                <button type="button" class="rounded p-2 main-cta-button"
                                        onclick="updateOrderStatus(${order.id},5)">
                                    Đã nhận được hàng
                                </button>
                            </c:if>
                            <c:if test="${order.status==0}">
                                <button type="button" class="rounded py-2 px-4 main-cta-button"
                                        onclick="rebuyOrder(${order.id})">
                                    Mua lại
                                </button>
                            </c:if>
                        </div>

                        <div class="d-flex justify-content-center col-3">
                            <button type="button" class="rounded p-2 sub-cta-button"
                                    onclick="getDetailsForm(${order.id})">
                                Chi tiết
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<script>
    $(document).ready(function () {
        $(".product-price").each(function (index) {
            formatPrice($(this))
        })
        $(".total-price").each(function (index) {
            formatPrice($(this))
        })
    })
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<!--Shipped Orders-->
<div id="shippedlist" class="order-details">
    <c:choose>
        <c:when test="${empty account.orders}">
            <div class="mt-5 h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                Không có đơn hàng nào
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt hàng</th>
                    <th>Giá tiền</th>
                    <th></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="order" items="${account.orders}">
                    <tr>
                        <th>${order.getId()}</th>
                        <th>${order.getStatusDetail()}</th>
                        <th class="date">${order.createdAt}</th>
                        <th>
                            <span class="total-price fw-semibold">${order.totalPrice}</span>
                        </th>
                        <th>
                            <div class="row">
                                <div class="col-1"></div>
                                <div class="d-flex justify-content-center col-5">
                                    <c:if test="${order.status < 5 && order.status > 0}">
                                        <button type="button" class="w-100 rounded p-2 sub-cta-button"
                                                onclick="getCancelForm(${order.id})">
                                            Hủy hàng
                                        </button>
                                    </c:if>
                                </div>
                                <div class="d-flex justify-content-center col-5">
                                    <button type="button" class="w-100 rounded p-2 main-cta-button"
                                            onclick="getDetailsForm(${order.id})">
                                        Chi tiết
                                    </button>
                                </div>
                                <div class="col-1"></div>
                            </div>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>


<%--<div id="shippedlist" class="order-details">--%>
<%--    <c:choose>--%>
<%--        <c:when test="${empty listOrder}">--%>
<%--            <div class="mt-5 h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">--%>
<%--                Không có sản phẩm--%>
<%--            </div>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>

<%--            <div>--%>

<%--            </div>--%>
<%--            <c:forEach var="order" items="${listOrder}">--%>
<%--                <div class="mb-3">--%>
<%--                    <p class="mb-1">ID đơn hàng: <span class="fw-semibold">${order.id}</span></p>--%>
<%--                    <p class="mb-1">Trạng thái đơn hàng: <span class="fw-semibold">${order.getStatusDetail()}</span></p>--%>
<%--                </div>--%>
<%--                <table class="table table-bordered">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>Hình ảnh</th>--%>
<%--                        <th>Thông tin sản phẩm</th>--%>
<%--                        <th>Kích thước</th>--%>
<%--                        <th>Giá tiền</th>--%>
<%--                        <th></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>

<%--                    <tbody>--%>
<%--                    <c:forEach var="product" items="${order.products}">--%>
<%--                        <tr>--%>
<%--                            <th style="width: 20%">--%>
<%--                                <img src="${product.thumbnail}" class="my-3 resized-image">--%>
<%--                            </th>--%>
<%--                            <th class="">--%>
<%--                                <p class="title h5 main-color">${product.title}</p>--%>
<%--                                <p class="p-0">Số lượng: <span class="fw-semibold">${product.quantity}</span></p>--%>
<%--                            </th>--%>
<%--                            <th class="">--%>
<%--                                <p>${product.width} x ${product.height} cm</p>--%>
<%--                            </th>--%>
<%--                            <th class="">--%>
<%--                                <div class="product-price">${product.price}</div>--%>
<%--                            </th>--%>
<%--                            <th class="">--%>
<%--                                    &lt;%&ndash;Button viết đánh giá&ndash;%&gt;--%>
<%--                                <div class="d-flex justify-content-center">--%>
<%--                                    <button type="button" class="rounded p-2 sub-cta-button-background"--%>
<%--                                            onclick="window.location.href = /product?id=${product.id}">--%>
<%--                                        Viết đánh giá--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </th>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                        <tr>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            <th class="py-3 text-center">Thành tiền:</th>--%>
<%--                            <th class="py-3">--%>
<%--                                <span class="total-price h5 fw-semibold">${order.totalPrice}</span>--%>
<%--                            </th>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            <th>--%>
<%--                                    &lt;%&ndash;Button viết đánh giá&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                            <div class="d-flex justify-content-center">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                <button type="button" class="rounded p-2 sub-cta-button"&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                        onclick="getCancelForm(${order.id})">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                    Hủy hàng&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                </button>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                            </th>--%>
<%--                            <th>--%>
<%--                                <div class="d-flex justify-content-center">--%>
<%--                                    <button type="button" class="rounded p-2 main-cta-button"--%>
<%--                                            onclick="getDetailsForm(${order.id})">--%>
<%--                                        Chi tiết--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </th>--%>
<%--                        </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </c:forEach>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<%--</div>--%>
<script>
    $(document).ready(function () {
        $(".product-price").each(function (index) {
            formatPrice($(this))
        })
        $(".total-price").each(function (index) {
            formatPrice($(this))
        })
    })
    $(".date").each(function () {
        formatDate($(this))
    })
    <%--    <c:forEach var="order" items="${received}">--%>
    <%--    formatPrice($("div#" +${order.id}).find(".total").find("#totalPrice"))--%>
    <%--    <c:forEach var="orderProduct" items="${order.products}">--%>
    <%--    formatPrice($("div#product_" +${orderProduct.id}).find("#productPrice"))--%>
    <%--    </c:forEach>--%>
    <%--    </c:forEach>--%>
</script>
</body>
</html>


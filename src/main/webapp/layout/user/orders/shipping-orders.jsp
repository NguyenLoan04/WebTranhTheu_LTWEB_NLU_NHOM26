<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
<!--Shipping Order-->
<div id="shippinglist" class="order-details">
    <c:choose>
        <c:when test="${empty listProduct}">
            <div class="mt-5 h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                Không có sản phẩm
            </div>
        </c:when>
        <c:otherwise>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Thông tin sản phẩm</th>
                    <th scope="col">Kích thước</th>
                    <th scope="col">Giá tiền</th>
                </tr>
                </thead>
            </table>
            <c:forEach var="product" items="${listProduct}">
                <tbody>
                <tr>
                    <th scope="row">
                        <img src="${product.thumbnail}" class="resized-image col-3">
                    </th>
                    <th>
                        <div class="title h5 main-color">${product.title}</div>
                        <div class="p-0">Số lượng: <span class="fw-semibold">${product.quantity}</span> </div>
                    </th>
                    <th>
                            ${product.width} x ${product.height}
                    </th>
                    <th>
                        <div id="productPrice" class="col-3 p-4">${orderProduct.price}</div>
                    </th>
                </tr>
                </tbody>
            </c:forEach>
            <!-- Tổng tiền-->
            <div class="total row py-3">
                <div class="col"></div>
                <div class="col-3 title">
                    Thành tiền:
                </div>
                <div id="totalPrice" class="col-3">
                        ${order.totalPrice}
                </div>
            </div>
        </c:otherwise>
    </c:choose>

<%--    <c:if test="${empty shipping}">--%>
<%--        <div class="h3 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">--%>
<%--            Trống--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <c:if test="${not empty shipping}">--%>
<%--        <c:forEach var="order" items="${shipping}">--%>
<%--            <!-- Card-->--%>
<%--            <div id="${order.id}" class="card container">--%>
<%--                <!--NSX-->--%>
<%--                <div class="row">--%>
<%--                    <div class="col-9"></div>--%>
<%--                    <div class="col-3">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${order.status == 1}">Chờ xác nhận</c:when>--%>
<%--                            <c:when test="${order.status == 2}">Chờ lấy hàng </c:when>--%>
<%--                            <c:when test="${order.status == 3}">Chờ giao hàng</c:when>--%>
<%--                            <c:when test="${order.status == 4}">Đã giao hàng</c:when>--%>
<%--                            <c:when test="${order.status == 5}">Đã nhận được hàng</c:when>--%>
<%--                            <c:when test="${order.status == 6}">Yêu cầu hoàn đơn - đổi trả</c:when>--%>
<%--                            <c:when test="${order.status == 0}">Đã hủy</c:when>--%>
<%--                            <c:otherwise> Trạng thái không xác định</c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--                <!--Danh sach sp trong 1 orrder-->--%>
<%--                <div class="row py-4 list-products">--%>
<%--                    <c:forEach var="orderProduct" items="${order.products}">--%>
<%--                        <div id="product_${orderProduct.id}" class="row py-3">--%>
<%--                            <img src="${orderProduct.thumbnail}"--%>
<%--                                 class="resized-image col-3">--%>
<%--                            <div class="col text-start">--%>
<%--                                <div class="title h5 main-color">${orderProduct.title}</div>--%>
<%--                                <div class="p-0">Số lượng: <span class="fw-semibold">${orderProduct.quantity}</span> </div>--%>
<%--                            </div>--%>
<%--                            <div id="productPrice" class="col-3 p-4">${orderProduct.price}</div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--                <!-- Tổng tiền-->--%>
<%--                <div class="total row py-3">--%>
<%--                    <div class="col"></div>--%>
<%--                    <div class="col-3 title">--%>
<%--                        Thành tiền:--%>
<%--                    </div>--%>
<%--                    <div id="totalPrice" class="col-3">--%>
<%--                            ${order.totalPrice}--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--Hủy hàng + Liên hệ chi tiết-->--%>
<%--                <div class="row py-2">--%>
<%--                    <div class="col-5"></div>--%>
<%--                    <button class="col-3 me-2 details-btn" onclick="getDetailsForm(${order.id})">Chi tiết</button>--%>
<%--                    <button type="button" class="received col-3" disabled>Đã nhận hàng</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </c:if>--%>
</div>
<script>
    <c:forEach var="order" items="${shipping}">
    formatPrice($("div#" +${order.id}).find(".total").find("#totalPrice"))
    <c:forEach var="orderProduct" items="${order.products}">
    formatPrice($("div#product_" +${orderProduct.id}).find("#productPrice"))
    </c:forEach>
    </c:forEach>
</script>

</body>
</html>

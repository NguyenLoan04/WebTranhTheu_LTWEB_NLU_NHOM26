<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
    <%--    <title>Đơn hàng</title>--%>
    <%--    <%@include file="../public/library.jsp" %>--%>
    <!-- css property -->
    <%--    <link rel="stylesheet" href="../../static/style/user/account-page.css">--%>
    <link rel="stylesheet" href="../../static/style/user/style-forms/orders.css">
</head>
<body>
<div id="user-ordered-list" class="content-details">
    <div class="h4 fw-semibold p-4">Đơn hàng của tôi</div>
    <hr>
    <div class="container px-3">
        <div class="row order-categories mb-2">
            <div class="cursor-pointer col order-item p-2" data-url="/waitlist-orders">Chờ xác nhận</div>
            <div class="cursor-pointer col order-item p-2" data-url="/pickup-orders">Chờ lấy hàng</div>
            <div class="cursor-pointer col order-item p-2" data-url="/shipping-orders">Chờ giao hàng</div>
            <div class="cursor-pointer col order-item p-2" data-url="/turnback-orders">Trả hàng</div>
            <div class="cursor-pointer col order-item p-2" data-url="/shipped-orders">Đã giao</div>
            <div class="cursor-pointer col order-item p-2" data-url="/received-orders">Đã nhận hàng</div>
            <div class="cursor-pointer col order-item p-2" data-url="/cancel-orders">Đã hủy</div>
        </div>
        <div id="orderContent">
            <c:if test="${empty account.orders}">
                <div class="h5 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                    Bạn chưa có đơn hàng nào
                </div>
            </c:if>
            <c:if test="${not empty account.orders}">
                <c:forEach var="order" items="${account.orders}">
                    <div id="${order.id}" class="row card border px-2 py-4">
                        <div class="row">
                            <div class="col-9"></div>
                            <div class="col-3">
                                <c:choose>
                                    <c:when test="${order.status == 1}">Chờ xác nhận</c:when>
                                    <c:when test="${order.status == 2}">Chờ lấy hàng </c:when>
                                    <c:when test="${order.status == 3}">Chờ giao hàng</c:when>
                                    <c:when test="${order.status == 4}">Đã giao hàng</c:when>
                                    <c:when test="${order.status == 5}">Đã nhận được hàng</c:when>
                                    <c:when test="${order.status == 6}">Yêu cầu hoàn đơn - đổi trả</c:when>
                                    <c:when test="${order.status == 0}">Đã hủy</c:when>
                                    <c:otherwise> Trạng thái không xác định</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <c:forEach var="orderProduct" items="${order.products}">
                            <div id="${orderProduct.id}" class="row py-3">
                                <img src="${orderProduct.thumbnail}"
                                     class="resized-image col-3">
                                <div class="col">
                                    <div class="title h5 main-color">${orderProduct.title}</div>
                                    <div class="p-0">Số lượng: <span class="fw-semibold">${orderProduct.quantity}</span> </div>
                                </div>
                                <div id="productPrice" class="col-3 p-4 h5">${orderProduct.price}</div>
                            </div>
                        </c:forEach>
                        <div class=" total row py-3">
                            <div class="col"></div>
                            <div class="col-3 title">
                                Thành tiền:
                            </div>
                            <div id="totalPrice" class="col-3">
                                    ${order.totalPrice}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<div id="order-detail" class="d-none"></div>
<div id="cancel-form" class="d-none"></div>
<%--<script src="static/script/header.js"></script>--%>
<script src="../../static/script/account/user-order.js"></script>
<script>
    <c:forEach var="order" items="${account.orders}">
    <c:forEach var="orderProduct" items="${order.products}">
    formatPrice($("div#" +${orderProduct.id}).find("#productPrice"))
    </c:forEach>
    formatPrice($("div#" +${order.id}).find(".total").find("#totalPrice"))
    </c:forEach>
</script>
</body>
</html>

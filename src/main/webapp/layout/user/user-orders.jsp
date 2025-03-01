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
            <div class="text-center cursor-pointer col order-item p-2" data-url="/waitlist-orders">Chờ xác nhận</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/pickup-orders">Chờ lấy hàng</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/shipping-orders">Chờ giao hàng</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/turnback-orders">Trả hàng</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/shipped-orders">Đã giao</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/received-orders">Đã nhận hàng</div>
            <div class="text-center cursor-pointer col order-item p-2" data-url="/cancel-orders">Đã hủy</div>
        </div>
        <div id="orderContent" class="order-details">
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
                                        <c:if test="${order.status < 3 && order.status > 0}">
                                        <div class="d-flex justify-content-center col-5">
                                                <button type="button" class="w-100 rounded p-2 sub-cta-button"
                                                        onclick="getCancelForm(${order.id})">
                                                    Hủy hàng
                                                </button>
                                        </div>
                                        </c:if>
                                        <c:if test="${order.status==3}">
                                            <div class="d-flex justify-content-center col-5">
                                                <button type="button" class="w-100 rounded p-2 main-cta-button"
                                                        style="opacity: 50%">
                                                    Đã nhận
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${order.status==4}">
                                            <div class="d-flex justify-content-center col">
                                                <button type="button" class="w-100 rounded p-2 main-cta-button"
                                                onclick="updateOrderStatus(${order.id},5)">
                                                    Đã nhận
                                                </button>
                                            </div>
                                            <div class="d-flex justify-content-center col">
                                                <button type="button" class="w-100 rounded p-2 sub-cta-button"
                                                        onclick="updateOrderStatus(${order.id},6)">
                                                    Đổi/trả
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${order.status==0}">
                                            <div class="d-flex justify-content-center col">
                                                <button type="button" class="w-100 rounded p-2 main-cta-button"
                                                        onclick="rebuyOrder(${order.id})">
                                                    Mua lại
                                                </button>
                                            </div>
                                        </c:if>
                                        <div class="d-flex justify-content-center col">
                                            <button type="button" class="w-100 rounded p-2 sub-cta-button"
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

    </div>
</div>
<div id="order-detail" class="d-none"></div>
<div id="cancel-form" class="d-none"></div>
<%--<script src="static/script/header.js"></script>--%>
<script src="../../static/script/account/user-order.js"></script>
<script>
    $(".date").each(function () {
        formatDate($(this))
    })
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

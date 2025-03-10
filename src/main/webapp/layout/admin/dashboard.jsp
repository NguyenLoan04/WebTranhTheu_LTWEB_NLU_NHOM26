<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <%@include file="../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/general-content-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/dashboard.css">

</head>
<body>
<div class="container-fluid px-4">
    <div class="row mt-3 mb-2">
        <div class="col p-0"><h3 class="style-title">Dashboard</h3></div>
        <hr>
    </div>
    <div class="row">
        <div class="col">
            <div class="card w-100">
                <div class="card widget-card border-light shadow-sm">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-10">
                                <h5 class="card-title widget-card-title mb-3">Tổng doanh thu</h5>
                                <h4 class="card-subtitle text-body-secondary m-0">${totalRevenue}</h4>
                            </div>
                            <div class="col-2">
                                <div class="d-flex justify-content-end">
                                    <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                        <i class="fa-solid fa-money-bill-trend-up"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card widget-card border-light shadow-sm">
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-10">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng sản phẩm</h5>
                            <h4 class="card-subtitle text-body-secondary m-0">${totalProduct}</h4>
                        </div>
                        <div class="col-2">
                            <div class="d-flex justify-content-end">
                                <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                    <i class="fa-brands fa-product-hunt"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card widget-card border-light shadow-sm">
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-10">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng chủ đề</h5>
                            <h4 class="card-subtitle text-body-secondary m-0">${totalTopic}</h4>
                        </div>
                        <div class="col-2">
                            <div class="d-flex justify-content-end">
                                <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                    <i class="fa-solid fa-lightbulb"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <div class="card widget-card border-light shadow-sm">
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-10">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng chính sách</h5>
                            <h4 class="card-subtitle text-body-secondary m-0">${totalPolicy}</h4>
                        </div>
                        <div class="col-2">
                            <div class="d-flex justify-content-end">
                                <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                    <i class="fa-solid fa-building-shield"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card widget-card border-light shadow-sm">
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-10">
                            <h5 class="card-title widget-card-title mb-3">Tổng danh mục</h5>
                            <h4 class="card-subtitle text-body-secondary m-0">${totalCategory}</h4>
                        </div>
                        <div class="col-2">
                            <div class="d-flex justify-content-end">
                                <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                    <i class="fa-solid fa-list"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card widget-card border-light shadow-sm">
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-10">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng người dùng</h5>
                            <h4 class="card-subtitle text-body-secondary m-0">${totalUser}</h4>
                        </div>
                        <div class="col-2">
                            <div class="d-flex justify-content-end">
                                <div class="lh-1 text-white rounded-circle p-3 d-flex align-items-center justify-content-center">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-7">
            <div class="style-title mt-4">Danh sách các đơn hàng gần đây</div>
            <table id="myTable" class="m-0 p-0 display custom-table w-100">
                <thead>
                <tr class="head-table">
                    <th>Tên khách hàng</th>
                    <th>Tên đăng nhập</th>
                    <th>Ngày đặt hàng</th>
                    <th>Tổng giá trị</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="o" items="${listOrder}">
                <tr>
                    <td>${o.getName()}</td>
                    <td>${o.getUsername()}</td>
                    <td><fmt:formatDate value="${o.getCreatedAt()}" pattern="dd/MM/yyyy" /></td>
                    <td><fmt:formatNumber value="${o.getTotalPrice()}" type="number" maxFractionDigits="0" /></td>
                    <td><c:choose>
                        <c:when test="${o.getOrderStatus() == 1}">
                            Chờ xác nhận
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 7}">
                            Đã cọc
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 2}">
                            Chờ lấy hàng
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 3}">
                            Chờ giao hàng
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 4}">
                            Đã giao
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 5}">
                            Đã nhận hàng
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 6}">
                            Đã hoàn trả
                        </c:when>
                        <c:when test="${o.getOrderStatus() == 0}">
                            Đã hủy
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
        <div class="col-5">
            <div class="card widget-card border-light shadow-sm" style="margin-top: 70px">
                <div class="card-order-body p-4">
                    <div class="row">
                        <div class="col choose-radio-order" id="choose-order-1">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng đơn hàng</h5>
                            <h4 class="card-subtitle text-body-order m-0">${totalOrder}</h4>
                        </div>
                        <c:set var="quantityOrderOnStatus" value="${requestScope.quantityOrderOnStatus}" />
                        <div class="col choose-radio-order" id="choose-order-3">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng đơn hàng</h5>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Chờ xác nhận: ${quantityOrderOnStatus["pendingConfirmation"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Đã cọc: ${quantityOrderOnStatus["deposited"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Chờ lấy hàng: ${quantityOrderOnStatus["waitingForPickup"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Chờ giao hàng: ${quantityOrderOnStatus["waitingForDelivery"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Đã giao: ${quantityOrderOnStatus["delivered"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Đã nhận hàng: ${quantityOrderOnStatus["received"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0">Đơn yêu cầu hoàn trả: ${quantityOrderOnStatus["returnRequested"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0">Đơn hủy: ${quantityOrderOnStatus["canceled"]}</h6>
                        </div>
                        <div class="col choose-radio-order" id="choose-order-4">
                            <h5 class="card-title widget-card-title mb-3">Tổng số lượng đơn hàng</h5>
                            <h6 class="card-subtitle text-body-order m-0 mb-1">Chưa thanh toán: ${quantityOrderOnStatus["paymentUnpaid"]}</h6>
                            <h6 class="card-subtitle text-body-order m-0">Đã thanh toán: ${quantityOrderOnStatus["paymentPaid"]}</h6>
                        </div>
                        <div class="col ps-0">
                            <div class="d-block">
                                <div class="radio-buttons">
                                    <input type="radio" id="option1" name="order" value="1" checked>
                                    <label for="option1" class="d-block">Tất cả</label>

                                    <input type="radio" id="option3" name="order" value="3">
                                    <label for="option3" class="d-block">Theo tình trạng đơn hàng</label>

                                    <input type="radio" id="option4" name="order" value="4">
                                    <label for="option4" class="d-block">Theo tình trạng thanh toán</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../static/script/admin/dashboard.js"></script>
</body>
</html>

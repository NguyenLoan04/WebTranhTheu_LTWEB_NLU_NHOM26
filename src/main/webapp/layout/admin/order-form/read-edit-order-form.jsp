<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin đơn hàng</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-add-order-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-order-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem đơn hàng</h2></div>
        </div>
        <!-- email của người dùng -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Email người dùng</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập email người dùng"
                                        value="<c:out value="${userOrder.getEmail()}"/>" required disabled>
            </div>
        </div>
        <!-- sản phẩm mua -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm mua</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myOrderEditTable" class="w-100">
                    <thead>
                    <tr>
                        <th class="text-center">Tên sản phẩm</th>
                        <th class="text-center">Kích thước</th>
                        <th class="text-center">Số lượng</th>
                        <th class="text-center">Giá bán (đ)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="o" items="${order.getProducts()}">
                        <tr>
                            <td>${o.getTitle()}</td>
                            <td>${o.getWidth()}x${o.getHeight()}</td>
                            <td>${o.getQuantity()}</td>
                            <td><fmt:formatNumber value="${o.getPrice()}" type="number" maxFractionDigits="0"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tổng đơn hàng -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Tổng đơn hàng (đồng)</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <input type="text" class="w-100 style-input" placeholder="Tổng đơn hàng"
                       value="<fmt:formatNumber value='${order.getTotalPrice()}' type='number' pattern='#,###'/>" required disabled></div>
        </div>
        <!-- Địa chỉ giao hàng -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Địa chỉ giao hàng</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <input type="text" id="address-shipping" class="w-100 style-input" placeholder="Nhập địa chỉ giao hàng"
                       value="<c:out value="${order.getShippingAddress()}"/>" required disabled></div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo đơn hàng</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled>
            </div>
        </div>
        <!-- ngày giao hàng -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày giao hàng</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" id="date-delivery" class="w-100 style-input" value="${deliveredAt}"
                                        disabled></div>
        </div>
        <!-- trạng thái đơn hàng -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Trạng thái đơn hàng</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="status-order" disabled required>
                    <option value="1" ${order.getStatus() == 1 ? 'selected' : ''}>Chờ xác nhận</option>
                    <option value="7" ${order.getStatus() == 7 ? 'selected' : ''}>Đã cọc</option>
                    <option value="2" ${order.getStatus() == 2 ? 'selected' : ''}>Chờ lấy hàng</option>
                    <option value="3" ${order.getStatus() == 3 ? 'selected' : ''}>Chờ giao hàng</option>
                    <option value="4" ${order.getStatus() == 4 ? 'selected' : ''}>Đã giao</option>
                    <option value="5" ${order.getStatus() == 5 ? 'selected' : ''}>Đã nhận hàng</option>
                    <option value="6" ${order.getStatus() == 6 ? 'selected' : ''}>Đơn yêu cầu hoàn trả</option>
                    <option value="0" ${order.getStatus() == 0 ? 'selected' : ''}>Đã hủy</option>
                </select>
            </div>
        </div>
        <!-- lí do hủy (nếu trạng thái là hủy) -->
        <div class="row pt-3 label-reason-cancel-order ${order.getCancelReason() == -1 ? 'd-none' : ''}">
            <div class="col"><span class="style-title">Lí do hủy</span>
            </div>
        </div>
        <div class="row pt-2 select-reason-cancel-order ${order.getCancelReason() == -1 ? 'd-none' : ''}">
            <div class="col p-0">
                <select class="style-select" id="reason-cancel-order" required disabled>
                    <option value="1" ${order.getCancelReason() == 1 ? 'selected' : ''}>Tôi muốn đổi hình thức thanh
                        toán
                    </option>
                    <option value="2" ${order.getCancelReason() == 2 ? 'selected' : ''}>Tôi muốn đổi địa chỉ nhận hàng
                    </option>
                    <option value="3" ${order.getCancelReason() == 3 ? 'selected' : ''}>Tôi muốn đổi sản phẩm</option>
                    <option value="4" ${order.getCancelReason() == 4 ? 'selected' : ''}>Tôi không có nhu cầu mua nữa
                    </option>
                    <option value="4" ${order.getCancelReason() == 5 ? 'selected' : ''}>Thời gian giao hàng quá lâu
                    </option>
                    <option value="4" ${order.getCancelReason() == 6 ? 'selected' : ''}>Tôi không có nhu cầu mua nữa
                    </option>
                    <option value="4" ${order.getCancelReason() == 7 ? 'selected' : ''}>Tôi tìm thấy nội dung phù hợp
                        hơn
                    </option>
                </select>
            </div>
        </div>
        <!-- hình thức thanh toán -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Hình thức thanh toán</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" required disabled>
                    <option value="0" ${order.getMethod() == 0 ? 'selected' : ''}>Thanh toán khi nhận hàng</option>
                    <option value="1" ${order.getMethod() == 1 ? 'selected' : ''}>Thanh toán chuyển khoản</option>
                </select>
            </div>
        </div>
        <!-- trạng thái thanh toán -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Trạng thái thanh toán</span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="status-payment" disabled required>
                    <option value="0" ${order.getStatusPay() == 0 ? 'selected' : ''}>Chưa thanh toán</option>
                    <option value="1" ${order.getStatusPay() == 1 ? 'selected' : ''}>Đã thanh toán</option>
                </select>
            </div>
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
                <button class="style-update-btn" value="<c:out value="${order.getId()}"/>" type="submit" id="submitBtn">
                    Cập nhật
                </button>
            </div>
        </div>
    </form>
</div>

<script src="../../../static/script/admin/order-form/read-edit-order-form.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<div id="order-detail-info" class=" content-details col p-4 pb-0">
    <div class="back-page row cursor-pointer mb-4 text-button">< Trở lại</div>
    <div class="row">
        <h3 class="h3 fw-semibold pt-2 pb-2 ">Chi tiết đơn hàng</h3>
        <p class="mb-1">
            Trạng thái đơn hàng: <span class="fw-semibold">${order.getStatusDetail()}</span>
        </p>
        <c:if test="${order.status eq 0}">
            <p class="mb-2">Lý do hủy: <span class="fw-semibold">${order.getCancelReasonDetail()}</span></p>
        </c:if>
    </div>
    <c:if test="${order.status==5}">
        <div class="row rebuy-area mt-3">
            <div class="col-9">Cảm ơn quý khách đã tham gia mua sắm!</div>
            <div class="col">
                <button class="w-75 rebuy_btn p-2" onclick="rebuyOrder(${order.id})">Mua lại</button>
            </div>
        </div>
        <hr/>
    </c:if>
    <div class="row">
        <div class="border-end py-3" style="width: 55%">
            <h5 class="fw-semibold mb-3">Thông tin người mua</h5>
            <div class="row my-1">
                <div class="col">Tên người dùng:</div>
                <div class="col"><span class=" fw-semibold">${account.fullName}</span></div>
            </div>
            <div class="row my-1">
                <div class="col">Số điện thoại:</div>
                <div class="col">
                    <span id="user-phone" class="">${ account.phone}</span>
                </div>
            </div>
            <div class="row my-1">
                <div class="col">Địa chỉ:</div>
                <div class="col"><span class="">${order.shippingAddress}</span></div>
            </div>
        </div>
        <div class="col ms-2 py-3">
            <h5 class="fw-semibold mb-3">Thông tin vận chuyển</h5>
            <div class="row my-1">
                <div class="col-7">Ngày tạo đơn hàng:</div>
                <div class="col date">${order.createdAt}</div>
            </div>
            <div class="row my-1">
                <div class="col-7">Ngày giao:</div>
                <div class="col date">${order.deliveredAt}</div>
            </div>
            <div class="row my-1">
                <div class="col-7">Phương thức thanh toán:</div>
                <div class="col">
                    <c:choose>
                        <c:when test="${order.method==1}">COD (Tiền mặt)</c:when>
                        <c:when test="${order.method==0}">Chuyển khoản</c:when>
                        <c:otherwise>Phương thức thanh toán không xác định</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </div>
</div>
<hr/>
<div class="mt-4 container" id="form-detail">
    <h5>Thông tin sản phẩm</h5>
    <!--Danh sach sp trong 1 order-->
    <div class="row py-4 list-products">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Hình ảnh</th>
                <th>Thông tin sản phẩm</th>
                <th>Kích thước</th>
                <th>Giá tiền</th>
                <c:if test="${order.status ge 5}">
                    <th></th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${order.products}">
                <tr>
                    <th style="width: 20%">
                        <img src="${product.thumbnail}" class="my-3 resized-image">
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
                    <c:if test="${order.status ge 5}">
                        <th>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="rounded p-2 sub-cta-button-background"
                                        onclick="window.location.href = '/product?id=${product.id}'">
                                    Viết đánh giá
                                </button>
                            </div>
                        </th>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <p class="text-end py-3">
            Thành tiền: <span class="ms-1 total-price h5 fw-semibold">${order.totalPrice}</span>
        </p>
    </div>
<%--    <c:if test="${order.status==0}">--%>
<%--        <div class="row p-0 my-3">--%>
<%--            <div class="col-3"></div>--%>
<%--            <div class="col-4 border-end">Lý do hủy:</div>--%>
<%--            <div class="col-5">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${order.cancelReason == 1}">Tôi muốn đổi hình thức thanh toán</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 2}">Tôi muốn đổi địa chỉ nhận hàng </c:when>--%>
<%--                    <c:when test="${order.cancelReason == 3}">Tôi muốn đổi sản phẩm</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 4}">Tôi không có nhu cầu mua nữa</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 5}">Thời gian giao hàng quá lâu</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 6}">Tôi tìm thấy nội dung phù hợp hơn</c:when>--%>
<%--                    <c:otherwise> Không xác định</c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <hr/>--%>
<%--    </c:if>--%>
</div>
<script>
    $(".back-page").click(function () {
        $("#order-detail").addClass("d-none")
        $("#user-ordered-list").removeClass("d-none")
    })
    $("#order-detail-info .date").each(function () {
        formatDate($(this))
    })

    $(document).ready(function () {
        $("#form-detail .product-price").each(function (index) {
            formatPrice($(this))
        })
        $("#form-detail .total-price").each(function (index) {
            formatPrice($(this))
        })
    })

    if ($("#user-phone").text() === "") {
        $("#user-phone").text("Chưa có số điện thoại")
    }
</script>
</body>
</html>

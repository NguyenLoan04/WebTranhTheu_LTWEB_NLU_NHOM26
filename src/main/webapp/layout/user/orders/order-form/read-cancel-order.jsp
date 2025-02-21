<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<!--Cancel order-->
<div id="user-cancel-order" class=" content-details col p-4 pb-0">
    <div class="back-page row cursor-pointer mb-4 text-button">< Trở lại</div>
    <div class="row">
        <h3 class="h3 fw-semibold pt-2 pb-2 ">Hủy đơn hàng</h3>
    </div>
    <hr/>
    <c:if test="${order.status==5}">
        <div class="m-2 row rebuy-area">
            <div class="col-8">Cảm ơn quý khách đã tham gia mua sắm!</div>
            <button class="col-4 rebuy_btn" onclick="rebuyOrder(${order.id})">Mua lại</button>
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
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <p class="text-end py-3">
            Thành tiền: <span class="ms-1 total-price h5 fw-semibold">${order.totalPrice}</span>
        </p>
    </div>
    <c:if test="${order.status==0}">
        <div class="row p-0 my-3">
            <div class="col-3"></div>
            <div class="col-4 border-end">Lý do hủy:</div>
            <div class="col-5">
                ${order.getCancelReasonDetail()}
<%--                <c:choose>--%>
<%--                    <c:when test="${order.cancelReason == 1}">Tôi muốn đổi hình thức thanh toán</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 2}">Tôi muốn đổi địa chỉ nhận hàng </c:when>--%>
<%--                    <c:when test="${order.cancelReason == 3}">Tôi muốn đổi sản phẩm</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 4}">Tôi không có nhu cầu mua nữa</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 5}">Thời gian giao hàng quá lâu</c:when>--%>
<%--                    <c:when test="${order.cancelReason == 6}">Tôi tìm thấy nội dung phù hợp hơn</c:when>--%>
<%--                    <c:otherwise> Không xác định</c:otherwise>--%>
<%--                </c:choose>--%>
            </div>
        </div>
        <hr/>
    </c:if>
</div>
<hr/>
<div class="reason mt-4 container">
    <div class="h5 mb-3">Lý do hủy đơn hàng?</div>
    <div class="row m-2">
        <label>
            <input type="radio"
                   name="cancelReason"
                   value="1"
                   class="form-check-input me-2 border-black">
            Tôi muốn đổi hình thức thanh toán.
        </label>
    </div>
    <div class="row m-2">
        <label>
            <input type="radio"
                   name="cancelReason"
                   value="2"
                   class="form-check-input me-2 border-black">
            Tôi muốn đổi địa chỉ nhận hàng.
        </label>
    </div>
    <div class="row m-2">
        <label>
            <input type="radio" name="cancelReason" value="3"
                   class="form-check-input me-2 border-black">
            Tôi muốn đổi sản phẩm.
        </label>
    </div>
    <div class="row m-2">
        <label>
            <input type="radio" name="cancelReason"
                   value="4"
                   class="form-check-input me-2 border-black">
            Tôi không có nhu cầu mua nữa.
        </label>
    </div>
    <div class="row m-2">
        <label>
            <input type="radio" name="cancelReason"
                   value="5"
                   class="form-check-input me-2 border-black">
            Thời gian giao hàng quá lâu.
        </label>
    </div>
    <div class="row m-2">
        <label>
            <input type="radio"
                   name="cancelReason"
                   value="6"
                   class="form-check-input me-2 border-black">
            Tôi tìm thấy nội dung phù hợp hơn.
        </label>
    </div>
</div>
<div class="row submit-cancel m-4">
    <div class="col-8"></div>
    <div class="col-4 d-flex justify-content-end">
        <button class="submit-cancel-reason px-4 py-3 rounded" onclick="cancelOrder(${order.id})">Gửi</button>
    </div>
</div>

<%--<div id="user-cancel-order" class=" content-details col">--%>
<%--    <div class="row"><i class="backpage pt-4 bi bi-chevron-left">Trở lại</i></div>--%>
<%--    <div class="h3 fw-semibold p-4">Hủy đơn hàng</div>--%>
<%--    <hr/>--%>
<%--    <div class="card mt-4 container">--%>
<%--        <div class="row info-date">--%>
<%--            <div id="datetime" class="row mb-4">--%>
<%--                <div class="col-6"></div>--%>
<%--                <div class="col-3">--%>
<%--                    <div class="col">Ngày tạo: </div>--%>
<%--                    <div class="col date">${order.createdAt}</div>--%>
<%--                </div>--%>
<%--                <div class="col-3">--%>
<%--                    <div class="col">Ngày dự kiến giao: </div>--%>
<%--                    <div class="col date">${order.deliveredAt}</div></div>--%>
<%--            </div>--%>
<%--            <div class="row">--%>
<%--                <div class="row">${account.fullName}</div>--%>
<%--                <div class="row">${account.phone}</div>--%>
<%--                <div class="row">${order.shippingAddress}</div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!--Danh sach sp trong 1 order-->--%>
<%--        <div class="row py-4 list-products">--%>
<%--                <c:forEach var="orderProduct" items="${order.products}">--%>
<%--                    <div id="product_${orderProduct.id}" class="row py-3">--%>
<%--                        <img src="${orderProduct.thumbnail}" class="resized-image col-3">--%>
<%--                        <div class="col container">--%>
<%--                            <div class="row title">${orderProduct.title}</div>--%>
<%--                            <div class="row">${orderProduct.quantity}</div>--%>
<%--                        </div>--%>
<%--                        <div class="price col-3 p-4">${orderProduct.price}</div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script>
    $(document).ready(function () {
        $("#form-detail .product-price").each(function (index) {
            formatPrice($(this))
        })
        $("#form-detail .total-price").each(function (index) {
            formatPrice($(this))
        })
    })
    $(".back-page").click(function () {
        $("#cancel-form").addClass("d-none")
        $("#user-ordered-list").removeClass("d-none")
    })
    $("#user-cancel-order .date").each(function () {
        formatDate($(this))
    })
    // $(".date").each(function (){
    //     formatDate($(this))
    // })
    // $(".bi-chevron-left").click(function () {
    //     $("#cancel-form").addClass("d-none")
    //     $("#user-ordered-list").removeClass("d-none")
    // })
    function cancelOrder(orderId) {
        let cancelReason = $("input[name='cancelReason']:checked").val()
        if (!cancelReason) {
            alert("Chọn lý do hủy đơn")
        }
        $.ajax({
            url: "/confirm-cancel-order",
            type: "POST",
            data: {
                "orderId": orderId,
                "cancelReason": cancelReason
            },
            success: function () {
                $("#cancel-form").addClass("d-none")
                $("#user-ordered-list").removeClass("d-none")
                showMessageUpdate("Hủy đơn thành công")
            },
            error: function (xhr, status, error) {
                console.log("Lỗi:", status, error);
            }
        })
    }

    if ($("#user-phone").text() === "") {
        $("#user-phone").text("Chưa có số điện thoại")
    }
</script>
</body>
</html>

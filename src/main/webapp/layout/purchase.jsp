<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common.jsp"/>
<html>
<head>
    <title>Xác nhận thanh toán - Nét Việt</title>
    <link rel="stylesheet" href="../static/style/user/purchase.css">
    <jsp:include page="public/library.jsp"/>
    <script>
        window.history.pushState({}, '', "/purchase")
    </script>
</head>
<body>
<jsp:include page="public/header.jsp"/>
<section class="container my-4_5" id="user-detail">
    <div class="background-container rounded p-4_5 row">
        <div class="col-6">
            <div>
                <h4 class="main-color mb-4">Thông tin thanh toán</h4>
                <div class="row">
                    <p class="col-6">Họ và tên: <span class="fw-semibold">${userInfo.getFullName()}</span></p>
                    <p class="col-6"></p>
                </div>
                <div class="row">
                    <p class="col-6" id="address-info" data-address="${addressId}">
                        Địa chỉ nhận hàng: <span class="fw-semibold">${address}</span>
                    </p>
                    <p class="col-4"></p>
                    <p class="col-2 text-end"><a class="text-decoration-none main-color fw-semibold"
                                                 href="/user">THAY ĐỔI</a></p>
                    <p class="col-12 text-danger" id="address-notice"></p>
                </div>
            </div>
            <hr/>
            <div>
                <h5 class="main-color mb-4">Phương thức thanh toán</h5>
                <p>Hiện tại chỉ hỗ trợ thanh toán bằng tiền mặt</p>
            </div>
            <hr/>
            <div>
                <h5 class="main-color mb-4">Khuyến mãi đang áp dụng</h5>
                <c:if test="${discount.size() eq 0}">
                    <p>Hiện tại không có chương trình khuyến mãi</p>
                </c:if>
                <c:forEach var="discount" items="${discount}">
                    <c:if test="${discount.getId() != 0}">
                        <div class="border-1 border-black row ps-3 py-2" data-id="${discount.id}"
                             data-value="${discount.value}">
                            <div class="col-1">
                                <i class="h2 bi bi-ticket-perforated me-1"></i>
                            </div>
                            <div class="col-1"></div>
                            <div class="col">
                                <p class="h5">${discount.title}</p>
                                <p class="">${discount.description}</p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

        </div>
        <div class="col-1"></div>
        <div class="col-5">
            <div class="row mb-2 ">
                <p><span class="main-color my-4 h4">Giỏ hàng</span> <span id="remain-item">(${listPurchased.size()} sản phẩm)</span>
                </p>
            </div>
            <hr/>
            <div id="cart-display">
                <c:forEach var="product" items="${listPurchased}">
                    <div class="product-item row my-4_5">
                        <div class="col-4">
                            <img src="${product.getThumbnailUrl()}" class="card-img-top" alt="...">
                        </div>
                        <div class="col-7">
                            <h5 class="main-color text-truncate"
                                title="${product.title}">
                                    ${product.title}
                            </h5>
                            <p class="mb-1">
                                Số lượng: <span class="fw-semibold">${product.quantity}</span>
                            </p>
                            <p class="mb-1">
                                Kích thước: <span
                                    class="fw-semibold">${product.price.width}x${product.price.height} cm</span>
                            </p>
                            <div class="row mt-4">
                                <h5 class="product-price text-end text-truncate">${product.displayDiscountedPriceToString()}</h5>
                                <c:if test="${product.getDiscount().getId() != 0}">
                                    <p class="text-end mt-1">
                                        <s class="text-secondary">${product.displayTotalPrice()}</s>
                                        <span class="ms-2 badge-color h6 p-1 rounded">${product.getDiscount().displayDiscountValue()}</span>
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <hr/>
            <div id="count-price">
                <div class="row">
                    <div class="col-6">
                        <span>Thành tiền: </span>
                    </div>
                    <div class="col-6 text-end">
                        <h5 id="product-sum-price" class="fw-semibold ">
                            ${totalPrice}
                        </h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <span>Phí vận chuyển: </span>
                    </div>
                    <div class="col-6 text-end">
                        <h5 class="fw-semibold " id="ship-price">130.000 VNĐ</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <span>Khuyến mãi: </span>
                    </div>
                    <div class="col-6 text-end">
                        <h5 class="fw-semibold">- ${discountValue}</h5>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-6">
                        <h5>Tổng giá tiền: </h5>
                    </div>
                    <div class="col-6  text-end">
                        <h3 id="total-price" style="color: var(--main-cta-button)">${finalPrice}</h3>
                    </div>
                </div>
            </div>
            <div class="row px-5">
                <div class="col-6 d-flex align-items-center">
                    <button id="cancel-button" class="rounded sub-cta-button px-3 py-2"
                            style="background-color: var(--light-component-background-color)"
                            onclick="history.back()">
                        Hủy
                    </button>
                </div>
                <div class="col-6 d-flex justify-content-end">
                    <button id="payment-button" class="rounded border-0 main-cta-button p-3 h5">
                        Thanh toán
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<%-- Dùng popup này thay thế --%>
<div id="popup" class="d-none position-fixed z-2 bg-black bg-opacity-50">
    <div id="popup-content" class="p-4 pt-3 rounded ">
        <div class="row d-flex justify-content-end mb-3">
            <%--            <button id="close-popup" type="button" class="btn-close" aria-label="Close"></button>--%>
            <a class="p-0 mb-4 text-decoration-none text-button" href="/">< Quay lại trang chủ</a>
        </div>
        <h5 class="text-center sub-color">Thanh toán thành công!</h5>
        <p class="text-center my-2">Bạn đã thanh toán thành công ${listPurchased.size()} sản phẩm</p>
        <p class="text-center my-2">Sản phẩm sẽ được giao tới cho bạn trong vòng 2 tuần</p>
        <h3 class="text-center main-color mt-4">${product.displayTotalPrice()}</h3>
        <%--   Phần hiển thị thông tin đơn hàng     --%>
        <div class="text-center display-2 mt-4 ">
            <c:forEach var="product" items="${listPurchased}">
                <div class="product-item row my-2">
                    <div class="col-4">
                        <img src="${product.getThumbnailUrl()}" class="card-img-top" alt="...">
                    </div>
                    <div class="col-7">
                        <h5 class="main-color text-truncate" title="${product.title}">
                                ${product.title}
                        </h5>
                        <p class="mb-1 h6 fw-normal">
                            Số lượng: <span class="fw-semibold">${product.quantity}</span>
                        </p>
                        <p class="mb-1 h6 fw-normal">
                            Kích thước: <span
                                class="fw-semibold">${product.price.width}x${product.price.height} cm</span>
                        </p>
                        <div class="row mt-4">
                            <h5 class="product-price text-end text-truncate">${product.displayTotalPrice()}</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="../static/script/purchase.js"></script>
<jsp:include page="public/footer.jsp"/>
</body>
</html>

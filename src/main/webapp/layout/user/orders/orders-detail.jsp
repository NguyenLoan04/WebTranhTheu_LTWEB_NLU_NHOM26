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
        <c:forEach var="order" items="${listOrder}">
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
          <tr>
            <th>ID đơn hàng: <span class="fw-semibold">${order.id}</span></th>
            <th>Trạng thái đơn hàng: <span class="fw-semibold">${order.getStatusDetail()}</span></th>
            <th></th>
            <th></th>
          </tr>
          <tr>
            <th></th>
            <th></th>
            <th class="py-3 text-center">Thành tiền:</th>
            <th class="py-3">
              <span class="total-price h5 fw-semibold">${order.totalPrice}</span>
            </th>
          </tr>
          <tr>
            <th></th>
            <th>
              <c:if test="${order.status==4}">
              <div class="d-flex justify-content-center">
                <button type="button" class="rounded py-2 px-3 sub-cta-button" onclick="updateOrderStatus(${order.id},6)">
                  Yêu cầu đổi/trả
                </button>
              </div>
              </c:if>
            </th>
            <th>
              <c:if test="${order.status>0 && order.status<3}">
                <div class="d-flex justify-content-center">
                  <button type="button" class="rounded p-2 sub-cta-button"
                          onclick="getCancelForm(${order.id})">
                    Hủy hàng
                  </button>
                </div>
              </c:if>
              <c:if test="${order.status==3}">
                <div class="d-flex justify-content-center">
                  <button type="button" class="rounded p-2 main-cta-button" style="opacity: 50%">
                    Đã nhận được hàng
                  </button>
                </div>
              </c:if>
              <c:if test="${order.status==4}">
              <div class="d-flex justify-content-center">
                <button type="button" class="rounded p-2 main-cta-button" onclick="updateOrderStatus(${order.id},5)">
                  Đã nhận được hàng
                </button>
              </div>
              </c:if>
              <c:if test="${order.status==0}">
                <div class="d-flex justify-content-center">
                  <button type="button" class="rounded py-2 px-4 main-cta-button"
                          onclick="rebuyOrder(${order.id})">
                    Mua lại
                  </button>
                </div>
              </c:if>
            </th>
            <th>
              <div class="d-flex justify-content-center">
                <button type="button" class="rounded p-2 sub-cta-button" onclick="getDetailsForm(${order.id})">
                  Chi tiết
                </button>
              </div>
            </th>
          </tr>
        </c:forEach>
        </tbody>
      </table>
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

<%@ page import="com.example.webtranhtheu_ltweb_nlu_nhom26.bean.AuthDTO" %>
<%@ page import="com.example.webtranhtheu_ltweb_nlu_nhom26.services.AuthService" %><%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:30 PM
  To change this static use File | Settings | File statics.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang admin - Nét Việt</title>
    <%@include file="../public/library.jsp"%>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <!-- css property -->
    <link rel="stylesheet" href="../../static/style/admin/nav-admin.css">
    <link rel="stylesheet" href="../../static/style/admin/popup-logout.css">

</head>
<body>
<%
    HttpSession s = request.getSession(false); // Lấy session hiện tại, không tạo mới
    Integer accountId = s.getAttribute("accountId") != null ? Integer.parseInt(s.getAttribute("accountId").toString()) : null;

    if (accountId == null) {
        // Người dùng chưa đăng nhập
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    } else {
        AuthDTO auth = new AuthService().getAuthById(accountId);
        if(auth.getRole() != 1 || auth.getStatusAccount() != 2) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
%>
<div class="container-fluid">
    <div class="row vh-100">
        <div class="col-2 nav-style pt-4 px-0">
            <div class="info-admin">
                <div class="avt-admin mx-auto"><img src="${user.getAvatarUrl()}" class="img text-center"></div>
                <div class="mt-3 px-4 text-center">Chào mừng admin <span class="fw-bold">${user.getFullName()}</span>!
                </div>
                <div class="hr-under-info my-3"></div>
            </div>
            <nav>
                <ul class="list-manage ps-0">
                    <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="select-nav px-4 ajax-link active" id="dashboard">
                        <i class="fa-solid fa-house me-2"></i>
                        Dashboard
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/product-management" class="select-nav px-4 ajax-link" id="product">
                        <i class="fa-brands fa-product-hunt me-2"></i>
                        Quản lý sản phẩm
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/user-management" class="select-nav px-4 ajax-link" id="user">
                        <i class="fa-solid fa-people-roof me-2"></i>
                        Quản lý người dùng
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/promotion-management" class="select-nav px-4 ajax-link" id="promotion">
                        <i class="fa-solid fa-tags me-2"></i>
                        Quản lý khuyến mãi
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/category-management" class="select-nav px-4 ajax-link" id="category">
                        <i class="fa-solid fa-list me-2"></i>
                        Quản lý danh mục
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/topic-management" class="select-nav px-4 ajax-link" id="topic">
                        <i class="fa-solid fa-lightbulb me-2"></i>
                        Quản lý chủ đề
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/provider-management" class="select-nav px-4 ajax-link" id="provider">
                        <i class="fa-solid fa-truck-field me-2"></i>
                        Quản lý nhà cung cấp
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/material-management" class="select-nav px-4 ajax-link" id="material">
                        <i class="fa-solid fa-recycle me-2"></i>
                        Quản lý vật liệu
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/order-management" class="select-nav px-4 ajax-link" id="order">
                        <i class="fa-solid fa-money-bill-trend-up me-2"></i>
                        Quản lý đơn hàng
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/policy-management" class="select-nav px-4 ajax-link" id="policy">
                        <i class="fa-solid fa-building-shield me-2"></i>
                        Quản lý chính sách
                    </a></li>
                </ul>
                <div class="hr-under-info my-3"></div>
                <div><a href="${pageContext.request.contextPath}/admin/setting" class="select-nav px-4 ajax-link" id="setting">
                    <i class="fa-solid fa-gear me-2"></i>
                    Cài đặt tài khoản
                </a></div>
                <div>
                    <button type="button" class="px-4 w-100 text-start" id="log-out" data-bs-toggle="modal"
                            data-bs-target="#logOutModal">
                        <i class="fa-solid fa-right-from-bracket me-2"></i>
                        Đăng xuất
                    </button>
                </div>
            </nav>
        </div>
        <div class="col-10 p-0" id="content"></div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="logOutModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><i
                        class="fa-solid fa-circle-question pe-2"
                        style="color: var(--sub-cta-button)"></i>Đăng xuất</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn chắc chắn muốn đăng xuất ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        id="choose-close">Hủy
                </button>
                <button type="button" class="btn btn-primary" id="choose-log-out" onclick="window.location.href = '/logout-admin';">Đăng xuất
                </button>
            </div>
        </div>
    </div>
</div>

<script src="../../static/script/admin/admin.js"></script>
</body>
</html>

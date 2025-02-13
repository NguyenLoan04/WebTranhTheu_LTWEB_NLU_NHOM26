<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực tài khoản - Nét Việt</title>
    <%@include file="public/library.jsp"%>
    <link rel="stylesheet" href="../static/style/user/verify.css">

</head>
<body>
<%@include file="public/header.jsp"%>

<div class="container verify-container text-center">
    <form id="verify-form" method="post">
        <h3 class="title mb-4">Chúc mừng bạn đã tạo tài khoản thành công. Xác thực ngay!</h3>
        <input type="number" class="input-verify d-inline" id="verify" name="code" placeholder="Nhập mã xác thực" required>
        <button class="d-inline btn-verify ms-2" id="submitBtn" type="submit">Xác thực</button>
    </form>
</div>

<div class="overlay d-none success-verify">
    <div class="popup-container text-center">
        <h4 class="title"><i class="fa-solid fa-circle-check me-2"></i>Xác thực thành công</h4>
        <button class="verify-cancel-button">Hủy</button>
        <button class="verify-button" onclick="window.location.href = '/login'">Đăng nhập</button>
    </div>
</div>

<div class="overlay d-none fail-verify">
    <div class="popup-container text-center">
        <h4 class="title"><i class="fa-solid fa-circle-xmark me-2"></i>Xác thực thất bại</h4>
        <button class="verify-cancel-button">Hủy</button>
    </div>
</div>

<%@include file="public/footer.jsp"%>

<script src="../static/script/verify.js"></script>
</body>
</html>

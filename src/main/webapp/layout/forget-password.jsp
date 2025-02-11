<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - Nét Việt</title>
    <%@include file="public/library.jsp" %>
    <link rel="stylesheet" href="../static/style/user/sign-in.css">
    <link rel="stylesheet" href="../static/style/user/verify.css">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const confirmPasswordInput = document.getElementById("pre-password");

            // Disable paste, copy, and cut
            confirmPasswordInput.addEventListener("paste", (e) => e.preventDefault());
            confirmPasswordInput.addEventListener("copy", (e) => e.preventDefault());
            confirmPasswordInput.addEventListener("cut", (e) => e.preventDefault());
        });
    </script>

</head>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="container px-5">
    <% if (request.getAttribute("accountId") == null) { %>
    <form method="post">
        <div class="row pt-3">
            <div class="col"><h3 class="style-big-title fw-semibold">Quên mật khẩu</h3></div>
        </div>
        <div style="color: red; font-size: 14px">${error}</div>
        <!-- nhập email -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Email:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="email" name="email" class="w-100 style-input" placeholder="Nhập email"
                                           required></div>
        </div>
        <!-- nhập tên đăng nhập -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Tên đăng nhập:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="text" name="username" class="w-100 style-input"
                                           placeholder="Nhập tên đăng nhập" required></div>
        </div>

        <div class="row pt-3">
            <div class="col text-center">
                <button class="style-button" type="submit">Đổi mật khẩu</button>
            </div>
        </div>
        <div class="row mt-4_5 pb-4">
            <div class="col text-center">
                <span>Bạn đã có tài khoản?</span>
                <a href="/login">Đăng nhập ngay!</a>
            </div>
        </div>
    </form>
    <% } else { %>
    <form method="post" id="confirm-update-pass-form">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Nhập mã xác nhận đổi mật khẩu</h2></div>
        </div>
        <div style="color: red; font-size: 14px" id="error"></div>
        <!-- nhập mã xác nhận -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Nhập mã xác nhận:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="number" id="code" class="w-100 style-input"
                                           placeholder="Nhập mã xác nhận" required></div>
        </div>
        <!-- nhập mật khẩu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Nhập mật khẩu mới:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" min="8" class="w-100 style-input" id="password"
                                           placeholder="Ít nhất 8 kí tự chứa số và chữ cái"
                                           required></div>
        </div>
        <!-- nhập lại mật khẩu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Nhập lại mật khẩu mới:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" min="8" id="pre-password" class="w-100 style-input"
                                           placeholder="Nhập lại mật khẩu" required></div>
        </div>

        <div class="row pt-3 pb-3">
            <div class="col text-center">
                <button class="style-button" type="submit" id="submitBtn" value="<%= request.getAttribute("accountId") %>">Cập nhật</button>
            </div>
        </div>
    </form>
    <% } %>
</div>

<div class="overlay d-none success-update-pass">
    <div class="popup-container text-center">
        <h4 class="title"><i class="fa-solid fa-circle-check me-2"></i>Đổi mật khẩu thành công</h4>
        <button class="verify-cancel-button">Hủy</button>
        <button class="verify-button" onclick="window.location.href = '/login'">Đăng nhập</button>
    </div>
</div>

<div class="overlay d-none fail-update-pass">
    <div class="popup-container text-center">
        <h4 class="title"><i class="fa-solid fa-circle-xmark me-2"></i>Đổi mật khẩu thất bại</h4>
        <button class="verify-cancel-button">Hủy</button>
    </div>
</div>

<script src="../static/script/forget-password.js"></script>
</body>
</html>

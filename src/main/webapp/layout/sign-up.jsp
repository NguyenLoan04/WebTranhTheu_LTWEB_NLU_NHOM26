<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký - Nét Việt</title>
    <%@include file="public/library.jsp" %>
    <link rel="stylesheet" href="../static/style/user/sign-in.css">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const confirmPasswordInput = document.getElementById("confirmPassword");

            // Disable paste, copy, and cut
            confirmPasswordInput.addEventListener("paste", (e) => e.preventDefault());
            confirmPasswordInput.addEventListener("copy", (e) => e.preventDefault());
            confirmPasswordInput.addEventListener("cut", (e) => e.preventDefault());
        });
    </script>
</head>
<body class="d-flex justify-content-center align-items-center">
<div class="container px-5 mt-0">
    <form id="sign-up-form" method="post">
        <div class="row pt-3">
            <div class="col"><h3 class="style-big-title fw-semibold">Đăng Ký</h3></div>
        </div>
        <div class="row">
            <div class="col">
                <span class="style-caption">Chào mừng bạn đến với Nét Việt</span>
            </div>
        </div>
        <div style="color: red; font-size: 14px">${error}</div>
        <!-- email -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Email:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-envelope"></i></div>
            </div>
            <div class="col-11 p-0"><input type="email" name="email" class="w-100 style-input" placeholder="Nhập email" required>
            </div>
        </div>
        <!-- họ và tên -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Họ và tên:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-envelope"></i></div>
            </div>
            <div class="col-11 p-0"><input type="text" name="full-name" class="w-100 style-input" placeholder="Nhập họ và tên" required>
            </div>
        </div>
        <!-- tên đăng nhập -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên đăng nhập:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-user"></i></div>
            </div>
            <div class="col-11 p-0"><input type="text" name="username" class="w-100 style-input" placeholder="Nhập tên đăng nhập" required>
            </div>
        </div>
        <!-- pass -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Mật khẩu:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" name="password" min="8" class="w-100 style-input" placeholder="Ít nhất 8 kí tự chứa số và chữ cái" required></div>
        </div>
        <div class="row pt-2">
            <div class="col"><span class="style-title">Xác nhận mật khẩu:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" name="pre-password" id="confirmPassword" class="w-100 style-input" placeholder="Nhập lại mật khẩu" required>
            </div>
        </div>

        <div class="row pt-3">
            <div class="col">
                <input type="checkbox" required>
                <span>Tôi đồng ý với các <a href="#">điều khoản</a> của trang web</span>
            </div>
        </div>
        <div class="row pt-3">
            <div class="col text-center">
                <button class="style-button" type="submit">Đăng ký</button>
            </div>
        </div>
        <div class="row pb-3 mt-3">
            <div class="col text-center">
                <span>Bạn đã có tài khoản?</span>
                <a href="/login">Đăng nhập ngay!</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>

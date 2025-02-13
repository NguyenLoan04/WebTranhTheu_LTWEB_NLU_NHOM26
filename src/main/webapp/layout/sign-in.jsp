<%@ page import="com.example.webtranhtheu_ltweb_nlu_nhom26.util.GoogleUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Nét Việt</title>
    <%@include file="public/library.jsp" %>
    <link rel="stylesheet" href="../static/style/user/sign-in.css">
    <link rel="stylesheet" href="../static/style/user/verify.css">
    <script src="https://accounts.google.com/gsi/client" async defer></script>

</head>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="container px-5">
    <form method="post">
        <div class="row pt-4">
            <div class="col"><h3 class="style-big-title fw-semibold">Đăng nhập</h3></div>
        </div>
        <div class="row">
            <div class="col">
                <span class="style-caption">Đăng nhập để có thể mua tranh và nhiều hơn thế nữa...</span>
            </div>
        </div>
        <div style="color: red; font-size: 14px">${error}</div>
        <div class="row pt-4">
            <div class="col">
                <span class="style-title">Tên đăng nhập:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-user"></i></div>
            </div>
            <div class="col-11 p-0"><input type="text" name="username" class="w-100 style-input"
                                           placeholder="Nhập tên đăng nhập" required>
            </div>
        </div>
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mật khẩu:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" class="w-100 style-input" name="password" min="8"
                                           placeholder="Nhập mật khẩu" required></div>
        </div>
        <div class="row pt-3">
            <div class="col text-end"><a href="/forget-password">Quên mật khẩu?</a></div>
        </div>
        <div class="row pt-3">
            <div class="col text-center">
                <button class="style-button" type="submit">Đăng nhập</button>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col text-center"><span class="style-label">------Hoặc-----</span></div>
        </div>
        <div class="row text-center pt-2">
            <div class="col border-1 border-black">
                <!-- Nút đăng nhập Google -->
                <div id="g_id_onload"
                     data-client_id="<%= GoogleUtil.getGoogleClientId()%>"
                     data-callback="handleCredentialResponse">
                </div>
                <div class="g_id_signin" data-type="standard"></div>
            </div>
        </div>
        <div class="row mt-3 pb-3">
            <div class="col text-center">
                <span>Không có tài khoản?</span>
                <a href="/sign-up">Tạo tài khoản mới</a>
            </div>
        </div>
    </form>
</div>
<% if (request.getAttribute("accountId") != null) { %>
<div class="overlay fail-verify">
    <form class="popup-container text-center" method="post" action="/re-send-verify">
        <h4 class="title">
            <i class="fa-solid fa-circle-xmark me-2"></i>
            Tài khoản bạn chưa xác thực
        </h4>
        <button class="verify-cancel-button" type="button">Hủy</button>
        <button class="verify-button" onclick="window.location.href = '/verify'" type="button">Xác thực</button>
        <button class="verify-button" name="accountId" value="${accountId}" type="submit">Gửi lại mã xác thực
        </button>
    </form>
</div>
<% } %>

<script src="../static/script/login.js"></script>
</body>
</html>

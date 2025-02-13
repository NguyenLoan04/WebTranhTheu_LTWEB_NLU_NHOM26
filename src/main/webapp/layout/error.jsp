<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common.jsp"/>
<html>
<head>
    <title>404 - Không tìm thấy trang - Nét Việt</title>
    <jsp:include page="public/library.jsp"/>
    <link rel="stylesheet" href="/static/style/user/error404.css">
</head>
<body>
<jsp:include page="public/header.jsp"/>
<div class="container my-5 main-info">
    <div class="row">
        <div class="col d-flex flex-column justify-content-center align-items-center">
            <div>
                <img src="/static/asset/image/error404.png" alt="" class="col">
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <h2 style="color: var(--main-cta-button)">Opps!!!</h2>
                <p class="fs-5">Rất tiếc, chúng tôi không thể tìm thấy trang bạn muốn...</p>
                <div>
                    <span class="fs-6 text-secondary">Mã lỗi: 404</span>
                </div>
                <div class="row">
                    <div class="py-5">
                        <a class="main-cta-button p-3 rounded h5" href="/">Quay về trang chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="public/footer.jsp"/>
</body>
</html>

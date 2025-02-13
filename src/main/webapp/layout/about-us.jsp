<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common.jsp"/>
<html>
<head>
    <title>Các chính sách khác - Nét Việt</title>
    <link rel="stylesheet" href="../static/style/user/policy.css">
    <jsp:include page="public/library.jsp"/>
</head>
<body>
<jsp:include page="public/header.jsp"/>
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="container">
    <ol class="breadcrumb pt-2">
        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">Về chúng tôi</li>
    </ol>
</nav>
<div class="container about-us mt-4_5 mb-5">
    <div class="row about-us-content rounded p-4_5 background-container">
        <h2 class="text-center main-color">Về chúng tôi</h2>
        <section class="container p-4">
            <p>
                Đến với tranh thêu Hà Sơn, người yêu nghệ thuật sẽ được chiêm ngưỡng những bức
                tranh
                thật đẹp và tinh tế. Tranh thêu tay Hà Sơn được làm bởi các nghệ nhân của làng nghề thêu Khoái Nôi
                (Thắng
                Lợi, Thường Tín, Hà Tây cũ). Theo những gia phả còn lưu giữ lại, Khoái Nội chính là nơi sản sinh ra
                nhiều
                nghệ nhân thuê tay vào loại có tiếng trong giới tranh thêu tay nghệ thuật. Từ đời này qua đời khác, các
                nghệ
                nhân nối tiếp các nghệ nhân làm đẹp cho đời bằng những tác phẩm thêu tay độc đáo.
                Với nhiều mẫu, nhiều thể loại, từ tranh động vật, tranh phong cảnh, tranh chân dung, với đủ các kích cỡ
                từ
                30x40, 40x60, 50x70… tranh thêu Hà Sơn sẽ là một “góc Việt Nam” giữa lòng Hà Nội.
                Chúng tôi cũng cung cấp dịch vụ thêu tranh theo yêu cầu. Nếu bạn có bất kỳ ảnh chân dung, phong cảnh,
                động
                vật ... chúng tôi sẽ thêu theo mong muốn của bạn và làm bạn hài lòng.
            </p>
        </section>
    </div>
    <div class="row p-4 "></div>
    <div class="row customer-poll rounded background-container pt-4_5 px-4_5 pb-0">
        <h4 class="main-color">Liên lạc với chúng tôi</h4>
        <p>Hãy điền thông tin vào form sau để liên lạc với chúng tôi</p>
        <form class="my-2 row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="mt-3">
                    <p class="fw-semibold py-2">Tên của bạn <span class="text-danger">*</span></p>
                    <input class="form-control rounded border-2" type="text" name="" id="form-name">
                </div>
                <div class="mt-3">
                    <p class="fw-semibold py-2">Email của bạn <span class="text-danger">*</span></p>
                    <input class="form-control rounded border-2" type="email" name="" id="form-email">
                </div>
                <div class="mt-3">
                    <p class="fw-semibold py-2">Nội dung <span class="text-danger">*</span></p>
                    <textarea name="" id="form-content" class="form-control rounded border-2" cols="30"
                              rows="10"></textarea>
                </div>
                <div class="my-2 mt-4 d-flex justify-content-center">
                    <button class="sub-cta-button-background border px-4 py-3 rounded h5">Gửi</button>
                </div>
            </div>
            <div class="col-3"></div>
        </form>
    </div>
</div>
<jsp:include page="public/footer.jsp"/>
</body>
</html>

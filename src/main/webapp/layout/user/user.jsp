<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common.jsp"/>
<html>
<head>
    <title>${account.fullName} - Nét Việt</title>
    <link rel="stylesheet" href="../../static/style/user/account-page.css">
    <jsp:include page="../public/library.jsp"/>
</head>
<body>
<script>
    const formatter = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' })
    function formatPrice(element){
        let formatPrice;
        formatPrice= formatter.format(element.prop("innerText"))
        element.text(formatPrice.replaceAll("₫", "VNĐ") + "")
    }
    function showMessageUpdate(message){
        $("#custom-popup-overlay").removeClass("d-none")
        $("#custom-popup").removeClass("d-none")
        $("#custom-popup").children("#message").prop("innerText", message)

        $("#custom-popup").children(".popup-content").children(".popup-close").click(function () {
            $("#custom-popup").addClass("d-none")
            $("#custom-popup-overlay").addClass("d-none")
        })
    }
    function formatDate(element) {
        let dateInput;
        dateInput= element.prop("innerText")
        const date = new Date(dateInput.replace(" ", "T")); // Đổi " " thành "T" để tuân theo chuẩn ISO

        // Bước 2: Lấy ngày, tháng, năm
        const day = String(date.getDate()).padStart(2, "0"); // Đảm bảo 2 chữ số (28)
        const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng (01) (lưu ý: getMonth() trả từ 0-11)
        const year = date.getFullYear(); // Năm (2025)

        // Bước 3: Định dạng ngày-tháng-năm
        const formattedDate = day+'-'+month+'-'+year;
        element.prop("innerText",formattedDate)

    }
</script>
<jsp:include page="../public/header.jsp"/>
<div id="custom-popup-overlay" class="d-none"></div>
<div id="custom-popup" class="container d-none">
    <div class="row p-0 popup-content">
            <div class="h4 fw-semibold col-10 text-center justify-content-center align-items-center">Thông báo</div>
            <button class="col-1 popup-close"><i class="bi bi-x-lg" style="color: var(--sub-cta-button)"></i></button>
    </div>
    <p class="m-4 main-color row text-center justify-content-center align-items-center" id="message"></p>
</div>
<div class="container p-0 ms-6 mt-4">
    <div class="content row">
        <div class="user-props-list col-3 me-4">
            <div class="user-img-frame">
                <img src="${account.avatarUrl}" style="width:100px;height:100px;margin-top: 30px">
                <p id="nickname" class="p-4 title">${account.fullName} </p>
            </div>
            <div class="list-group list_props">
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-info">
                    <i class="bi bi-person"></i>
                    Thông tin người dùng
                </a>
                <a class="list-group-item list-group-item-action _info"
                   href="${pageContext.request.contextPath}/user/user-addresses">
                    <i class="bi bi-geo-alt"></i>
                    Sổ địa chỉ
                </a>
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-viewed-history">
                    <i class="bi bi-eye"></i>
                    Lịch sử đã xem
                </a>
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-wishlist">
                    <i class="bi bi-heart"></i>
                    Danh sách yêu thích
                </a>
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-orders">
                    <i class="bi bi-box-seam"></i>
                    Đơn hàng của tôi
                </a>
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-feedbacks">
                    <i class="bi bi-pencil"></i>
                    Lịch sử đánh giá
                </a>
            </div>
            <hr>
            <div class="list-group user_setting_help">
                <a class="list-group-item list-group-item-action"
                   href="${pageContext.request.contextPath}/user/user-setting">
                    <i class="bi bi-gear"></i>
                    Cài đặt
                </a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/help">
                    <i class="bi bi-question-circle"></i>
                    Hỗ trợ
                </a>
            </div>
            <hr>
            <div class="list-group user-logout cursor-pointer" style="padding-left: 0.5rem">
                <a class="text-button logout-btn text-decoration-none">
                    <i class="bi bi-box-arrow-left"></i>
                    Đăng xuất
                </a>
            </div>
        </div>
        <!--User's property Page-->
        <!--Empty prop-->
        <div id="content" class="user_page_each_prop empty-prop content-details col">
            <div class="w-100 opacity-50 d-flex justify-content-center align-items-center" style="height: 100%">
                <h2 class="main-color text-center fw-semibold">Vui lòng chọn một mục</h2>
            </div>
        </div>
    </div>
</div>
<div id="logout-container" class="d-none">
    <div id="logout-alert" class="d-none p-4 m-10 rounded-1">
        <div>
            <h5 class="">Đăng xuất</h5>
        </div>
        <hr/>
        <div class="my-4">
            <p>Bạn chắc chắn muốn đăng xuất?</p>
        </div>
        <div class="row">
            <button id="noBtn" class="h6 ms-3 rounded p-2 sub-cta-button col-4 text-center">Không</button>
            <div class="col"></div>
            <button id="yesBtn" class="h6 me-3 rounded p-2 main-cta-button col-4 text-center" onclick="window.location.href = '/logout-user'">
                Có
            </button>
        </div>

        <%--    <div class="row ps-2"><p>Bạn chắc chắn muốn đăng xuất?</p></div>--%>
        <%--    <div class="row pt-5 ps-4 text-center">--%>
        <%--        <button id="yesBtn" class="col-5 text-center" onclick="window.location.href = '/logout-user';">Có</button>--%>
        <%--        <div class="col-2"></div>--%>
        <%--        <button id="noBtn" class="col-5 text-center">Không</button>--%>
        <%--    </div>--%>
    </div>
</div>
<div class="p-4"></div>
<jsp:include page="../public/footer.jsp"/>
<script src="../../static/script/header.js"></script>
<script src="../../static/script/account/account.js"></script>
</body>
</html>

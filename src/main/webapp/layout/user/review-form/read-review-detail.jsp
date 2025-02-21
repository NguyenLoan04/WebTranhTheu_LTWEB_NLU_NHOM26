<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<script>
    $(".back-page").click(function () {
        $("#review_detail").addClass("d-none")
        $("#user-feedback-histories").removeClass("d-none")
    })
    $("#form-detail .date").each(function () {
        formatDate($(this))
    })
</script>

<div id="user-feedback-info" class=" content-details col p-3 pb-0">
    <div class="back-page row cursor-pointer text-button">< Trở lại</div>
    <h3 class="h3 fw-semibold pt-3">Chi tiết đánh giá</h3>
</div>
<div class="mt-3 p-3" id="form-detail">
    <div class="row pt-2">
        <h5>Thông tin sản phẩm</h5>
        <div class="row mt-3">
            <img src="${review.product.getThumbnail()}" alt="${review.product.getTitle()}" class="col-3 resized-image">
            <div class="col pt-2 ps-0 ms-3">
                <div class="h4 main-color mb-3">${review.product.title}</div>
                <div class="my-2">Nhà cung cấp: <span class="fw-semibold">${review.product.provider.providerName}</span>
                </div>
                <div class="my-2">
                    Nguyên liệu: <span class="fw-semibold">${review.product.getStringDisplayMaterials()}</span>
                </div>
                <div class="my-2">
                    Kích thước: từ <span
                        class="fw-semibold">${review.product.getMinPrice().getWidth()}x${review.product.getMinPrice().getHeight()} cm</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row pt-4">
        <h5>Thông tin tài khoản</h5>
        <div class="mt-2">
            <p class="mb-1">Tên người dùng: <span class="fw-semibold">${account.fullName}</span></p>
            <p class="mb-1">Thời gian đánh giá: <span class="date fw-semibold">${review.createdAt}</span></p>
        </div>
    </div>
    <div class="row pt-4">
        <h5>Đánh giá</h5>
        <div class="mt-2 product-rating d-flex justify-content-around"
             id="rating-detail" style="width: 20%;">
        </div>
    </div>
    <div class="row pt-4">
        <h5>Nội dung đánh giá</h5>
        <div class="p py-1">
            ${review.content}
        </div>
    </div>
</div>


<%--<div id="user-feedback-info" class=" content-details col">--%>
<%--    <div class="row cursor-pointer"><i class="backpage-feedback pt-4 bi bi-chevron-left">Trở lại</i></div>--%>
<%--    <div class="h3 fw-semibold px-4 py-2">Chi tiết đánh giá</div>--%>
<%--    <hr/>--%>
<%--    <div class="row p-4">--%>
<%--        <img src="${review.product.getThumbnail()}" alt="Artwork" class="col-3 resized-image">--%>
<%--        <div class="col-7 pt-2 ">--%>
<%--            <div class="row h4 main-color">${review.product.title}</div>--%>
<%--            <div class="my-2">Nhà cung cấp: <span class="fw-semibold">${review.product.provider.providerName}</span> </div>--%>
<%--            <div class="my-2">--%>
<%--                Nguyên liệu: <span class="fw-semibold">${review.product.getStringDisplayMaterials()}</span>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="feedback-detail p-4">--%>
<%--        <div class="row">--%>
<%--            <i class="col-1 bi bi-person" style="font-size: 35px"></i>--%>
<%--            <p class="col-2 p-0">${account.username}</p>--%>
<%--        </div>--%>
<%--            <div class=" d-flex justify-content-around" id="${review.id}_product-info__rating" style="width: 30%">--%>
<%--                <div class="col-2 product-info__star-container   px-0">--%>
<%--                    <i class="fa-solid fa-star product-info__star"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                    <div class="product-info__star-mask"></div>--%>
<%--                    <i class="fa-regular fa-star product-info__star-outline"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                </div>--%>
<%--                <div class="col-2 product-info__star-container   px-0">--%>
<%--                    <i class="fa-solid fa-star product-info__star"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                    <div class="product-info__star-mask"></div>--%>
<%--                    <i class="fa-regular fa-star product-info__star-outline"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                </div>--%>
<%--                <div class="col-2 product-info__star-container   px-0">--%>
<%--                    <i class="fa-solid fa-star product-info__star"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                    <div class="product-info__star-mask"></div>--%>
<%--                    <i class="fa-regular fa-star product-info__star-outline"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                </div>--%>
<%--                <div class="col-2 product-info__star-container   px-0">--%>
<%--                    <i class="fa-solid fa-star product-info__star sample_half"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                    <div class="product-info__star-mask"></div>--%>
<%--                    <i class="fa-regular fa-star product-info__star-outline"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                </div>--%>
<%--                <div class="col-2 product-info__star-container   px-0">--%>
<%--                    <i class="fa-solid fa-star product-info__star"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                    <div class="product-info__star-mask"></div>--%>
<%--                    <i class="fa-regular fa-star product-info__star-outline"--%>
<%--                       style="color: var(--big-text-color)"></i>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        <hr/>--%>
<%--        <div class="row pt-3">--%>
<%--            <div class="h5">Đánh giá</div>--%>
<%--            <div class="p py-1">--%>
<%--                ${review.content}--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="../../static/script/account/user-feedback.js"></script>
<script>
    $("#rating-detail").append(createReviewStar(${review.rating}))
</script>
</body>
</html>

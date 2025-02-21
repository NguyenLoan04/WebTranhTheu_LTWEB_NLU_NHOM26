<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<script>
    $(".bi-chevron-left").click(function () {
        $("#review_detail").addClass("d-none")
        $("#user-feedback-histories").removeClass("d-none")
    })
    $("#user-feedback-info .date").each(function () {
        formatDate($(this))
    })
</script>
<div id="user-feedback-info" class=" content-details col">
    <div class="row cursor-pointer"><i class="backpage-feedback pt-4 bi bi-chevron-left">Trở lại</i></div>
    <div class="h3 fw-semibold px-4 py-2">Chi tiết đánh giá</div>
    <hr/>
    <div class="row p-4">
        <img src="${review.product.getThumbnail()}" alt="Artwork" class="col-3 resized-image">
        <div class="col-7 pt-2 ">
            <div class="row h4 main-color">${review.product.title}</div>
            <div class="my-2">Nhà cung cấp: <span class="fw-semibold">${review.product.provider.providerName}</span> </div>
            <div class="my-2">
                Nguyên liệu: <span class="fw-semibold">${review.product.getStringDisplayMaterials()}</span>
            </div>
        </div>
    </div>
    <div class="feedback-detail p-4">
        <div class="row">
            <i class="col-1 bi bi-person" style="font-size: 35px"></i>
            <p class="col-2 p-0">${account.username}</p>
        </div>
            <div class=" d-flex justify-content-around" id="${review.id}_product-info__rating" style="width: 30%">
                <div class="col-2 product-info__star-container   px-0">
                    <i class="fa-solid fa-star product-info__star"
                       style="color: var(--big-text-color)"></i>
                    <div class="product-info__star-mask"></div>
                    <i class="fa-regular fa-star product-info__star-outline"
                       style="color: var(--big-text-color)"></i>
                </div>
                <div class="col-2 product-info__star-container   px-0">
                    <i class="fa-solid fa-star product-info__star"
                       style="color: var(--big-text-color)"></i>
                    <div class="product-info__star-mask"></div>
                    <i class="fa-regular fa-star product-info__star-outline"
                       style="color: var(--big-text-color)"></i>
                </div>
                <div class="col-2 product-info__star-container   px-0">
                    <i class="fa-solid fa-star product-info__star"
                       style="color: var(--big-text-color)"></i>
                    <div class="product-info__star-mask"></div>
                    <i class="fa-regular fa-star product-info__star-outline"
                       style="color: var(--big-text-color)"></i>
                </div>
                <div class="col-2 product-info__star-container   px-0">
                    <i class="fa-solid fa-star product-info__star sample_half"
                       style="color: var(--big-text-color)"></i>
                    <div class="product-info__star-mask"></div>
                    <i class="fa-regular fa-star product-info__star-outline"
                       style="color: var(--big-text-color)"></i>
                </div>
                <div class="col-2 product-info__star-container   px-0">
                    <i class="fa-solid fa-star product-info__star"
                       style="color: var(--big-text-color)"></i>
                    <div class="product-info__star-mask"></div>
                    <i class="fa-regular fa-star product-info__star-outline"
                       style="color: var(--big-text-color)"></i>
                </div>
            </div>
        <hr/>
        <div class="row pt-3">
            <div class="h5">Đánh giá</div>
            <div class="p py-1">
                ${review.content}
            </div>
        </div>
    </div>
</div>
</body>
</html>

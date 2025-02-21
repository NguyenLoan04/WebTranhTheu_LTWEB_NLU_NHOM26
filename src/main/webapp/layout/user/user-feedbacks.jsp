<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
<div id="user-feedback-histories" class="content-details">
    <div class="h3 fw-semibold p-4">Lịch sử đánh giá</div>
    <hr>
    <c:if test="${empty reviews}">
        <div class="h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
            Bạn chưa đánh giá sản phẩm nào
        </div>
    </c:if>
    <c:if test="${not empty reviews}">
        <div class="container">
            <table id="table-detail" class="table table-bordered">
                <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Ngày đánh giá</th>
                    <th>Đánh giá</th>
                    <th></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="review" items="${reviews}">
                    <tr>
                        <th style="width: 20%">
                            <img src="${review.product.getThumbnail()}" alt="${review.product.title}"
                                 class="resized-image my-3">
                        </th>
                        <th class="p-3">
                            <p class="title h6 fw-normal">${review.product.title}</p>
                        </th>
                        <th class="date p-3">${review.createdAt}</th>
                        <th class="p-3" style="width: 15%">
                            <div class="product-rating d-flex justify-content-around"
                                 id="${review.id}_product-info__rating">
                            </div>
                        </th>
                        <th class="p-3">
                            <div class="d-flex justify-content-center">
                                <button type="button" class="w-100 rounded p-2 main-cta-button"
                                        onclick="getReviewDetails(${review.id})">
                                    Chi tiết
                                </button>
                            </div>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

                <%--            <div class="row title p-2">--%>
                <%--                <div class="col-2">Ngày</div>--%>
                <%--                <div class="col-6 p-0 ">Sản phẩm</div>--%>
                <%--                <div class="col-3 p-0">Đánh giá</div>--%>
                <%--                <div class="col-1"></div>--%>
                <%--            </div>--%>
                <%--            <div class="row">--%>
                <%--                <c:forEach var="review" items="${reviews}">--%>
                <%--                    <div id="review_${review.id}" class="row py-2">--%>
                <%--                        <div class="date col-2">${review.createdAt}</div>--%>
                <%--                        <!--Hình tỉ lệ 4:1-->--%>
                <%--                        <div class="col-5">--%>
                <%--                            <div class="row">--%>
                <%--                                <img src="${review.product.getThumbnail()}" alt="Artwork" class="resized-image col-3">--%>
                <%--                                <div class="col-1"></div>--%>
                <%--                                <div class="col-8">${review.product.title}</div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="col-3 p-0">--%>
                <%--                            <div class=" d-flex justify-content-around" id="${review.id}_product-info__rating">--%>
                <%--                                <div class="col-2 product-info__star-container   px-0">--%>
                <%--                                    <i class="fa-solid fa-star product-info__star"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                    <div class="product-info__star-mask"></div>--%>
                <%--                                    <i class="fa-regular fa-star product-info__star-outline"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-2 product-info__star-container   px-0">--%>
                <%--                                    <i class="fa-solid fa-star product-info__star"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                    <div class="product-info__star-mask"></div>--%>
                <%--                                    <i class="fa-regular fa-star product-info__star-outline"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-2 product-info__star-container   px-0">--%>
                <%--                                    <i class="fa-solid fa-star product-info__star"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                    <div class="product-info__star-mask"></div>--%>
                <%--                                    <i class="fa-regular fa-star product-info__star-outline"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-2 product-info__star-container   px-0">--%>
                <%--                                    <i class="fa-solid fa-star product-info__star sample_half"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                    <div class="product-info__star-mask"></div>--%>
                <%--                                    <i class="fa-regular fa-star product-info__star-outline"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-2 product-info__star-container   px-0">--%>
                <%--                                    <i class="fa-solid fa-star product-info__star"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                    <div class="product-info__star-mask"></div>--%>
                <%--                                    <i class="fa-regular fa-star product-info__star-outline"--%>
                <%--                                       style="color: var(--big-text-color)"></i>--%>
                <%--                                </div>--%>

                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="col-2 text-center justify-content-center align-items-center cursor-pointer p-0 feedback-details"--%>
                <%--                             onclick="getReviewDetails(${review.id})">Chi tiết--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </c:forEach>--%>
                <%--            </div>--%>

        </div>
    </c:if>
</div>
<div id="review_detail" class="d-none"></div>
<script src="../../static/script/account/user-feedback.js"></script>
<script>
    function displayRating(rating, starWidth) {
        const starPosition = Math.trunc(rating)
        const starPositionWidthRating = rating - Math.floor(rating)
        const starMaskWidth = starWidth * (1 - starPositionWidthRating) * 0.8 //Do phần star chiếm 80% element
        const starPadding = starWidth / 10
        $("#product-info__rating .product-info__star-mask").each(function (index) {
            if (index === starPosition) {
                $(this).css("width", starMaskWidth + starPadding + "px")
            }
            if (index > starPosition) {
                $(this).css("width", "100%")
            }
        });
    }

    <c:forEach var="review" items="${reviews}">
    $("#${review.id}_product-info__rating").append(createReviewStar(${review.rating}))
    <%--displayRating(${review.rating}, $("div#review_" +${review.id}).find(".product-info__star-container").width())--%>
    </c:forEach>

    $("#table-detail .date").each(function () {
        formatDate($(this))
    })
</script>
</body>
</html>

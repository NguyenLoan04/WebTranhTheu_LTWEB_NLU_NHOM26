<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/common.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Nét Việt</title>
    <jsp:include page="layout/public/library.jsp"/>
    <link rel="stylesheet" href="static/style/user/home.css">
</head>
<body>
<jsp:include page="layout/public/header.jsp"/>
<section id="landing-section" class="container mt-5 background-container">
    <div class="row p-4">
        <div class="col-6 d-flex justify-content-center flex-column">
            <div class="text-center my-3">
                <img src="static/asset/favicon/web_logo_revert_color.png" width="175px" height="175px">
            </div>
            <h2 class="text-center main-color">Thanh tao, Mộc mạc, Uyển chuyển</h2>
            <p class="text-center mt-2 mx-5">
                Nét Việt tự hào mang đến một trang web chứa đựng các tác phẩm qua nét thêu của nghệ nhân Việt,
                mang đến cho người sở hữu một cảm giác đầy tính nghệ thuật và tao nhã. Tập hợp các bộ sưu tập với nhiều
                chủ đề khác nhau,
                phù hợp để trang trí không gian sống. Tranh thêu của Nét Việt chính là quà tặng ý nghĩa cho bạn bè và
                người thân
            </p>
        </div>
        <div class="col-6 p-0 position-relative">
            <img class="w-100" src="static/asset/image/landing-image.jpeg" alt="" srcset="">
        </div>
    </div>
</section>
<section class="container p-4_5  background-container mb-4" id="hot-product-section">
    <div class="row">
        <h4 class="main-color mb-3"> Sản phẩm HOT</h4>
        <hr/>
        <c:forEach var="product" items="${hotProduct}">
            <div class="card-element mb-3" style="width: 20%">
                <div onclick="window.location = '/product?id=${product.id}'" class="card p-2" style="cursor: pointer">
                    <img src="${product.getThumbnail()}" class="card-img" alt="...">
                    <div class="card-body px-1">
                        <h5 class="card-title text-center pb-2 fw-semibold text-truncate"
                            title="${product.category} ${product.title}">
                                ${product.category} ${product.title}
                        </h5>
                        <p class="card-text my-1 text-center text-truncate"
                           title="Nhà cung cấp: ${product.getProvider().getProviderName()}">
                            Nhà cung cấp: <span class="fw-semibold">${product.getProvider().getProviderName()}</span>
                        </p>
                        <p class="card-text text-center text-truncate my-1"
                           title="Nguyên liệu: ${product.getStringDisplayMaterials()}">
                            Nguyên liệu: <span class="fw-semibold">${product.getStringDisplayMaterials()}</span>
                        </p>
                        <p class="card-text text-center mt-1">
                            Kích thước: từ <span class="fw-semibold">${product.getMinPrice().getWidth()}x${product.getMinPrice().getHeight()} cm</span>
                        </p>
                        <p class="card-text text-center fw-semibold h4 mt-2"
                           style="color: var(--main-cta-button)">${product.getMinPrice().displayDiscountedPriceToString(product.getDiscount())}
                        </p>
                        <c:if test="${product.getDiscount().getId() != 0}">
                            <p class="text-center mt-3">
                                <s class="text-secondary">${product.getMinPrice().getDisplayPriceToString()}</s>
                                <span class="ms-2 badge-color h6 p-1 rounded">${product.getDiscount().displayDiscountValue()}</span>
                            </p>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<section class="container p-4_5  background-container mb-4" id="discount-product-section">
    <div class="row">
        <h4 class="main-color mb-3">Đang khuyến mãi</h4>
        <hr/>
        <c:choose>
            <c:when test="${discountProduct.size() == 0}">
                <p class="text-center">Hiện tại chưa có sản phẩm nào có khuyến mãi</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="product" items="${discountProduct}">
                    <div class="card-element mb-3" style="width: 20%">
                        <div onclick="window.location = '/product?id=${product.id}'" class="card p-2" style="cursor: pointer">
                            <img src="${product.getThumbnail()}" class="card-img" alt="...">
                            <div class="card-body px-1">
                                <h5 class="card-title text-center pb-2 fw-semibold text-truncate"
                                    title="${product.category} ${product.title}">
                                        ${product.category} ${product.title}
                                </h5>
                                <p class="card-text my-1 text-center text-truncate"
                                   title="Nhà cung cấp: ${product.getProvider().getProviderName()}">
                                    Nhà cung cấp: <span class="fw-semibold">${product.getProvider().getProviderName()}</span>
                                </p>
                                <p class="card-text text-center text-truncate my-1"
                                   title="Nguyên liệu: ${product.getStringDisplayMaterials()}">
                                    Nguyên liệu: <span class="fw-semibold">${product.getStringDisplayMaterials()}</span>
                                </p>
                                <p class="card-text text-center mt-1">
                                    Kích thước: từ <span class="fw-semibold">${product.getMinPrice().getWidth()}x${product.getMinPrice().getHeight()} cm</span>
                                </p>
                                <p class="card-text text-center fw-semibold h4 mt-2"
                                   style="color: var(--main-cta-button)">${product.getMinPrice().displayDiscountedPriceToString(product.getDiscount())}
                                </p>
                                <c:if test="${product.getDiscount().getId() != 0}">
                                    <p class="text-center mt-3">
                                        <s class="text-secondary">${product.getMinPrice().getDisplayPriceToString()}</s>
                                        <span class="ms-2 badge-color h6 p-1 rounded">${product.getDiscount().displayDiscountValue()}</span>
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</section>
<section class="container p-4_5  background-container mb-4" id="most-rated-product-section">
    <div class="row">
        <h4 class="main-color mb-3"> Sản phẩm được đánh giá cao nhất</h4>
        <hr/>
        <c:forEach var="product" items="${mostRatedProduct}">
            <div class="card-element mb-3" style="width: 20%">
                <div onclick="window.location = '/product?id=${product.id}'" class="card p-2" style="cursor: pointer">
                    <img src="${product.getThumbnail()}" class="card-img" alt="...">
                    <div class="card-body px-1">
                        <h5 class="card-title text-center pb-2 fw-semibold text-truncate"
                            title="${product.category} ${product.title}">
                                ${product.category} ${product.title}
                        </h5>
                        <p class="card-text my-1 text-center text-truncate"
                           title="Nhà cung cấp: ${product.getProvider().getProviderName()}">
                            Nhà cung cấp: <span class="fw-semibold">${product.getProvider().getProviderName()}</span>
                        </p>
                        <p class="card-text text-center text-truncate my-1"
                           title="Nguyên liệu: ${product.getStringDisplayMaterials()}">
                            Nguyên liệu: <span class="fw-semibold">${product.getStringDisplayMaterials()}</span>
                        </p>
                        <p class="card-text text-center mt-1">
                            Kích thước: từ <span class="fw-semibold">${product.getMinPrice().getWidth()}x${product.getMinPrice().getHeight()} cm</span>
                        </p>
                        <p class="card-text text-center fw-semibold h4 mt-2"
                           style="color: var(--main-cta-button)">${product.getMinPrice().displayDiscountedPriceToString(product.getDiscount())}
                        </p>
                        <c:if test="${product.getDiscount().getId() != 0}">
                            <p class="text-center mt-3">
                                <s class="text-secondary">${product.getMinPrice().getDisplayPriceToString()}</s>
                                <span class="ms-2 badge-color h6 p-1 rounded">${product.getDiscount().displayDiscountValue()}</span>
                            </p>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<section class="container p-4_5  background-container mb-4" id="full-product-section">
    <div class="row">
        <h4 class="main-color mb-3">Tất cả sản phẩm </h4>
        <hr/>
        <div id="full-product__product-list">
        </div>
        <div class="row">
            <div class="col"></div>
            <div class="col-4  d-flex justify-content-center" id="more-product-btn">
                <button id="full-product-button" class="rounded sub-cta-button-background px-3 py-2 border-0">Xem thêm
                </button>
            </div>
            <div class="col"></div>
        </div>
    </div>
</section>
<jsp:include page="layout/public/footer.jsp"/>
<script src="static/script/home.js"></script>
<script src="static/script/header.js"></script>
</body>
</html>
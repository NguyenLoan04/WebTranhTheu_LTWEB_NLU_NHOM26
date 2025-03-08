<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="../../static/style/user/style-forms/viewed-info.css">
</head>
<body>
<div id="user-viewed-info" class="content-details col">
    <div class="h4 fw-semibold p-3">Danh sách yêu thích</div>
    <hr>
    <div class="container p-3">
        <c:if test="${empty account.getWishProducts()}">
            <div class="h3 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                Bạn chưa thích sản phẩm nào
            </div>
        </c:if>
        <c:if test="${not empty account.getWishProducts()}">
            <button class="addAll-btn mb-4" onclick="addAllToCart()">Thêm tất cả vào giỏ hàng</button>
            <table id="table-detail" class="table table-bordered">
                <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá tiền</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${account.getWishProducts()}">
                    <tr class="product-item" data-id="${product.product.id}"
                        data-width="${product.product.getMinPrice().width}"
                        data-height="${product.product.getMinPrice().height}">
                        <th style="width: 20%">
                            <img src="${product.product.getThumbnail()}" alt="${product.product.title}"
                                 class="resized-image my-3" onclick="window.location.href = '/product?id=${product.product.id}'">
                        </th>
                        <th class="p-4">
                            <p class="title h6 fw-normal" onclick="window.location.href = '/product?id=${product.product.id}'">${product.product.title}</p>
                        </th>
                        <th class="p-4">
                            <p class="price title h6 fw-normal">${product.product.getMinPrice().price}</p>
                        </th>
                        <th class="p-4" style="width: 25%">
                            <button class="add-to-cart me-2"><i class="bi bi-cart-plus"></i></button>
                            <button class="delete-btn"><i class="bi bi-trash"></i></button>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </c:if>
    </div>

</div>
<div id="popup" class="p-3">
    <div class="row  text-center fw-bold h5 border-bottom">
        <div class="col-11 h4 text-center">Lỗi</div>
        <i class="col-1 p-2 text-center bi bi-x-lg" onclick="closeError()"></i>
    </div>
    <div class="row mt-2 ms-2 text-center">Số lượng sản phẩm vượt mức quy định.</div>
</div>
<script src="static/script/header.js"></script>
<script>
    $(".price").each(function (index){
        formatPrice($(this))
    })
    function addToCart(element) {
        let id = element.attr("data-id");
        let width = element.attr("data-width")
        let height = element.attr('data-height')
        let quantity = 1
        let accountId = '${sessionScope.accountId}'
        if (accountId !== '' || accountId !== null) {
            const totalQuantity = parseInt($("#cart-badge").text())
            if (totalQuantity + 1 <= 10) {
                $.ajax({
                    url: "/user/wishlist/add-to-cart?id=" + id + '&width=' + width + '&height=' + height + '&quantity=' + quantity,
                    type: "POST",
                    success: function (data) {
                        data = $.parseJSON(data)
                        if (data.result) {
                            console.log(data)
                            const badge = $("#cart-badge")
                            const currentCartLength = data.currentCartLength
                            badge.removeClass("d-none")
                            badge.text(currentCartLength)
                            showMessageUpdate("Thêm vào giỏ hàng thành công")
                        } else alert("Có lỗi khi thêm đơn hàng vào giỏ hàng")
                    },
                    error: function () {

                    }
                })
            }
            //Viết 1 đoạn html ở đây (popup)
            else {
                document.getElementById("popup").style.display = "block";
                document.getElementById("popup-overlay").style.display = "block";
            }
        }
    }

    function addAllToCart() {
        $.ajax({
            url: "user/wishlist/add-all-to-cart",
            type: "POST",
            success: function (data) {
                data = $.parseJSON(data)
                if (data.result) {
                    console.log(data)
                    const badge = $("#cart-badge")
                    const currentCartLength = data.currentCartLength
                    badge.removeClass("d-none")
                    badge.text(currentCartLength)
                    showMessageUpdate("Thêm vào giỏ hàng thành công")
                } else alert("Có lỗi khi thêm đơn hàng vào giỏ hàng")
            },
            error: function () {

            }
        })
    }

    function removeWishlist(element) {
        let id = element.attr("data-id");
        console.log(id)
        let accountId = '${sessionScope.accountId}'
        if (accountId !== '' || accountId !== null) {
            element.remove()
            $.ajax({
                url: "/remove-from-wishlist",
                type: "POST",
                data: {
                    productId: id
                },
                success: function () {
                    // element.remove()
                },
                error: function () {

                }
            })
        }
    }
</script>
<script src="../../static/script/account/user-wishlist.js"></script>
</body>
</html>

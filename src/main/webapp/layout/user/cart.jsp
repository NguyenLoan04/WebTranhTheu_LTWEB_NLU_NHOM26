<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common.jsp"/>
<html>
<head>
    <title>Giỏ hàng của bạn - Nét Việt</title>
    <link rel="stylesheet" href="../../static/style/user/cart.css">
    <jsp:include page="../public/library.jsp"/>
</head>
<body>
<jsp:include page="../public/header.jsp"/>
<div class="container">
    <div class="row mt-4 mb-4">
        <div class="col-8 cart">
            <div class="h3 pt-4 mb-3 text-center">Giỏ hàng</div>
            <c:if test="${empty cart.products}">
                <div class="h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-normal text-center">
                    Giỏ hàng trống
                </div>
            </c:if>
            <c:if test="${not empty cart.products}">
                <div class="row cart-title px-4">
                    <div class="col-3 form-check">
                        <input class="form-check-input" type="checkbox" id="checkAll">
                        <label class="form-check-label" for="checkAll">
                            Chọn tất cả
                        </label>
                    </div>
                    <div class="col-3 text-center">Sản phẩm</div>
                    <div class="col-3 text-center">Số lượng</div>
                    <div class="col-2">Giá tiền</div>
                </div>
                <hr/>
                <div class="cart-item-list" id="cart-container">
                    <c:forEach items="${cart.products}" var="entry">
                        <div class="row py-3 cart-item" data-width="${entry.value.price.width}"
                             data-height="${entry.value.price.height}" data-id="${entry.value.id}">
                            <div class="col-1 text-center">
                                <div class="row pb-4"></div>
                                <div class="row ps-4">
                                    <div class="form-check">
                                        <input value="${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}"
                                               class="product-checkbox form-check-input" type="checkbox"
                                               onclick="updateTotalPrice()">
                                    </div>
                                </div>
                            </div>
                            <img class="col-2 px-0 image-resize" src="<c:url value="${entry.value.thumbnailUrl}"/>">
                            <div class="col-3 ps-5 pe-0">
                                <div class="row pb-4 fw-semibold">${entry.value.title}</div>
                                <div class="row price-selected">
                                    <label class="col-3 p-0 me-2 price-label">Loại: </label>
                                    <select class=" col-7 row select-area rounded" name="select"
                                            id="size_${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}"
                                            onchange="updateProductBySize(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                        <c:forEach var="price" items="${entry.value.prices}">
                                            <c:if test="${price.width == entry.value.price.width && price.height == entry.value.price.height}">
                                                <option class="text-center me-2 rounded select-option"
                                                        data-width="${price.width}" data-height="${price.height}"
                                                        selected>
                                                        ${price.width} x ${price.height}
                                                </option>
                                            </c:if>
                                            <c:if test="${price.width != entry.value.price.width && price.height!=entry.value.price.height}">
                                                <option class="text-center me-2 rounded select-option"
                                                        data-width="${price.width}" data-height="${price.height}">
                                                        ${price.width} x ${price.height}
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-3 text-center">
                                <div class="row pb-4"></div>
                                <div class="row">
                                    <div class="row">
                                        <div class="col-4 text-center">
                                            <button class="rounded" id="product-detail__remove-amount"
                                                    onclick="updateSubByQuantity(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                                <i class="fa-solid fa-minus"></i>
                                            </button>
                                        </div>
                                        <div class="col-4 text-center product-quantity"
                                             id="quantity_${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}">
                                                ${entry.value.quantity}
                                        </div>
                                        <div class="col-4 text-center">
                                            <button class="rounded" id="product-detail__add-amount"
                                                    onclick="updatePlusByQuantity(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                                <i class="fa-solid fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col p-0">
                                <div class="row pb-4 "></div>
                                <div class="row ps-3"
                                     id="product-detail__price">${entry.value.displayElementDiscountPrice()}</div>
                                <c:if test="${entry.value.getDiscount().getId() != 0}">
                                    <div class="row ps-3"><s class="p-0">${entry.value.displayElementPrice()}</s></div>
                                </c:if>
                            </div>
                            <div class="col-1 p-0">
                                <div class="row pb-4"></div>
                                <i class="bi bi-trash"></i>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
        <div class="col-3 p-0 ms-5 discount_pay">
            <div class="row discount_area p-3 py-4">
                <div class="row">
                    <div class="col-8 h5">
                        <i class="bi bi-ticket-perforated me-1"></i>
                        <span>Khuyến mãi</span>
                    </div>
                    <div class="col"></div>
                </div>
                <hr>
                <div class="discounts-list">
                    <c:if test="${empty discountsAvailable}">
                        <div class="justify-content-center align-items-center fw-normal"
                             style="color: var(--text-hover-color)">Không có khuyến mãi
                        </div>
                    </c:if>
                    <c:forEach var="discount" items="${discountsAvailable}">
                        <c:if test="${discount.getId() != 0}">
                            <div class="row ps-3 py-2 discount-item selected-discount" data-id="${discount.id}"
                                 data-value="${discount.value}">
                                <div class="row discount-title h5">${discount.title}</div>
                                <div class="row p-0">
                                    <div class="discount-description">${discount.description}</div>
                                </div>
                                <div class="row discount-detail d-flex justify-content-center">
                                    <button class="sub-cta-button-background py-2 my-2"
                                            onclick="showDetails('${discount.title}','${discount.description}','${discount.endedAt}')">
                                        Xem chi tiết
                                    </button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="row py-2"></div>
            <div class="row pay_area p-3">
                <div class="row pt-2">
                    <div class="col-10 h5"><i class="bi bi-cash-stack me-2"></i><span>Thành tiền</span></div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-8 h6 me-0">Tổng số tiền (đã tính VAT):</div>
                    <div class="col-4 px-0 pt-3" id="total-price"></div>
                </div>
                <div class="row ps-5 py-4 ">
                    <button class="payable rounded" onclick="sendSelectedProduct()">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>
    <div id="popup-overlay"></div>
    <div id="discount-detail-info" class="p-2">
        <div class="row">
            <div class=" col-11 pt-2 text-center h5">Chi tiết giảm giá</div>
            <i class="col-1 py-2 pe-2 text-center bi bi-x-lg cancel-discount" onclick="closeDetails()"></i>
        </div>
        <hr/>
        <div id="discount-title" class="h5 text-center fw-bold"></div>
        <div class="row ps-3 ms-2" id="discount-description"></div>
        <div class="row ps-3 m-2" id="discount-expiredAt"></div>
        <div class="py-4"></div>
    </div>
</div>
<div id="popup" class="p-3">
    <div class="row  text-center fw-bold h5 border-bottom">
        <div class="col-11 h4 text-center">Lỗi</div>
        <i class="col-1 p-2 text-center bi bi-x-lg" onclick="closeError()"></i>
    </div>
    <div class="row mt-2 ms-2 text-center">Số lượng sản phẩm vượt mức quy định.</div>
</div>
<jsp:include page="../public/footer.jsp"/>
<script src="../../static/script/header.js"></script>
<script src="../../static/script/cart.js"></script>
<script>
    // chuyển đơn vị tiền qua số
    function parseCurrencyToFloat(currency) {
        // Loại bỏ các ký tự không phải số hoặc dấu thập phân
        const cleanedString = currency.replace(/[^\d,-]/g, '').replace(',', '.');
        return parseFloat(cleanedString);
    }

    // chọn mã giảm giá
    function selectDiscount(button) {
        const apply_discount = document.querySelectorAll("button.apply_discount")
        apply_discount.forEach(function (btn) {
            btn.disabled = false;
            btn.innerText = "Áp dụng";
            btn.classList.remove("opacity-50")
        })
        button.disabled = true;
        button.classList.add("opacity-50")
        button.innerText = "Đã áp dụng"
        const discount_item = document.querySelectorAll("div.discount-item")
        discount_item.forEach(row => row.classList.remove("selected-discount"))
        button.closest(".discount-item").classList.add("selected-discount")
        updateTotalPrice()
    }

    // tính tổng tiền dựa vào checkbox
    function updateTotalPrice() {
        let total = 0.0;
        let checkboxes = document.querySelectorAll(".product-checkbox:checked")
        checkboxes.forEach(function (checkbox) {
            let row = checkbox.closest('div.cart-item');  // Tìm dòng chứa checkbox
            let price = parseFloat(row.querySelector('#product-detail__price').textContent.replaceAll("VNĐ", "").replaceAll(" ", "").replaceAll(".", ""));  // Lấy giá sản phẩm
            let quantity = parseInt(row.querySelector('div.product-quantity').textContent);  // Lấy số lượng
            total += (price * quantity);// Cộng tổng tiền
        });
        // const discount_item = document.querySelectorAll("div.discount-item")
        // let discountValue;
        // discount_item.forEach(function (discount) {
        //     if (discount.classList.contains("selected-discount")) {
        //         discountValue = discount.getAttribute("data-value")
        //         console.log(discountValue)
        //     }
        // })
        // total -= discountValue ? total * discountValue : 0
        document.getElementById('total-price').textContent = total
        const totalPrice = formatter.format($("#total-price").prop("innerText"))
        $("#total-price").text(totalPrice.replaceAll("₫", "VNĐ") + "")
    }

    // gửi sản phẩm đã chọn qua trang thanh toán (Xử lý trong thanh toán)
    function sendSelectedProduct() {
        let selectedProductCode = [];
        let checkboxes = document.querySelectorAll('.product-checkbox:checked');

        checkboxes.forEach(function (checkbox) {
            selectedProductCode.push(checkbox.value);
        });
        if (selectedProductCode.length > 0) {
            const discountItem = document.querySelectorAll("div.discount-item")
            let discountId;
            discountItem.forEach(function (discount) {
                if (discount.classList.contains("selected-discount")) {
                    discountId = discount.getAttribute("data-id")
                }
            })

            console.log(selectedProductCode)
            console.log(discountId)

            $.ajax({
                // sửa thêm phần discount nè
                url: "/prepare-purchase",
                type: "POST", //xem lại nha
                data: {
                    selectedProductCode: selectedProductCode + "", // Gửi danh sách ID sản phẩm
                    discountId: discountId ? discountId : 0
                },
                success: function (response) {
                    window.location = "/purchase"
                },
                error: function (data) {
                    // data = $.parseJSON(data);
                    // const message = data.message;
                    // alert(message);
                }
            })
        }
    }

    //Servlet
    function updatePlusByQuantity(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        let quantityInput = $("div#quantity_" + productCode);
        let cartItem = quantityInput.closest(".cart-item")
        let newQuantity = Number.parseInt(quantityInput.text(), 10) + 1
        const newTotal = parseInt($("#cart-badge").text()) + 1
        console.log(newTotal)
        if (newTotal <= 10) {
            if (newQuantity === 5) {
                cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
                cartItem.find("button#product-detail__add-amount").attr("disabled", true)
            } else if (newQuantity === 1) {
                cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
                cartItem.find("button#product-detail__add-amount").attr("disabled", false)
            } else {
                cartItem.find("button#product-detail__add-amount").attr("disabled", false)
                cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
            }
            $.ajax({
                url: "/update-product?productCode=" + productCode + "&quantity=" + newQuantity,
                type: "POST",
                success: function () {
                    quantityInput.text(newQuantity)
                    window.location.reload()
                },
                error: function () {

                }
            })
        } else {
            document.getElementById("popup").style.display = "block";
            document.getElementById("popup-overlay").style.display = "block";
        }
    }

    function updateSubByQuantity(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        let quantityInput = $("div#quantity_" + productCode);
        let cartItem = quantityInput.closest(".cart-item")
        let newQuantity = Number.parseInt(quantityInput.text(), 10) - 1
        if (newQuantity === 5) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
            cartItem.find("button#product-detail__add-amount").attr("disabled", true)
        } else if (newQuantity === 1) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
        } else {
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
        }
        $.ajax({
            url: "/update-product?productCode=" + productCode + "&quantity=" + newQuantity,
            type: "POST",
            success: function () {
                quantityInput.text(newQuantity)
                window.location.reload()
            },
            error: function () {

            }
        })
    }

    function updateProductBySize(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        const sizeInput = document.querySelector("select#size_" + productCode)
        const selectedOption = sizeInput.querySelector("option:checked");
        let newWidth = selectedOption.getAttribute("data-width")
        let newHeight = selectedOption.getAttribute("data-height")
        $.ajax({
            url: "/update-price?productCode=" + productCode + "&width=" + newWidth + "&height=" + newHeight,
            type: "POST",
            success: function () {
                window.location.reload()
            },
            error: function () {

            }
        })
    }

    function removeProduct(element) {
        let productId = element.attr("data-id")
        let width = element.attr("data-width")
        let height = element.attr("data-height")
        productCode = productId + '_' + width + '_' + height;
        $.ajax({
            url: "/remove-product?productCode=" + productCode,
            type: "POST",
            success: function (data) {
                element.remove()
                window.location.reload()
                data = $.parseJSON(data)
                if (data.result) {
                    // console.log(data)
                    const badge = $("#cart-badge")
                    const currentCartLength = data.currentCartLength
                    badge.removeClass("d-none")
                    badge.text(currentCartLength)
                    // xử lý trong controller = JsonObject
                    if ($(".cart-item").length === 0) {
                        $("#cart-badge").addClass("d-none")
                    }
                } else {
                    alert("Có lỗi khi xóa sản phẩm khỏi giỏ hàng")
                }
            },
            error: function (error) {
                //     error = $.parseJSON(error)
                //     if(error.result){
                //         console.log(error.error)
                //     }
            }
        })
    }

    // xem lại hàm tính tổng tiền
    const price = formatter.format($("#total-price").prop("innerText"))
    $("#total-price").text(price.replaceAll("₫", "VNĐ" + ""))
</script>
<script>
    function update(productId, width, height) {
        let quantityInput;
        let cartItem;
        let quantity;
        quantityInput = $("div#quantity_" + productId + '_' + width + '_' + height)
        cartItem = quantityInput.closest(".cart-item")
        quantity = Number.parseInt(quantityInput.text(), 10)
        if (quantity === 5) {
            cartItem.find("button#product-detail__add-amount").attr("disabled", true)
            console.log("Full")
        } else if (quantity === 1) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
            console.log("empty")
        }
    }

    // function formatProductPrice(productId, width, height) {
    //     let divInput;
    //     let price;
    //     let priceText;
    //     let cartItem;
    //     divInput = $("div#quantity_" + productId + '_' + width + '_' + height)
    //     cartItem = divInput.closest(".cart-item")
    //     price = cartItem.find("#product-detail__price")
    //     priceText = formatter.format(price.prop("innerText"))
    //     price.text(priceText + "")
    // }

    <c:forEach var="entry" items="${cart.products}">
    update(${entry.value.id}, ${entry.value.price.width}, ${entry.value.price.height})
    <%--formatProductPrice(${entry.value.id}, ${entry.value.price.width}, ${entry.value.price.height})--%>
    </c:forEach>
</script>
</body>
</html>

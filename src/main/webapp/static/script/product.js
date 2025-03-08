const MAX_VALUE = 5
const MIN_VALUE = 1
let currentRating = 0

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

//Thay đổi hình review
$(".preview-image").click(function () {
    const displayPreview = $("#product-image")
    if ($(this).attr("src") !== displayPreview.attr("src")) {
        displayPreview.attr("src", $(this).attr("src"))
    }
})

// Nút chia sẻ (copy vào clipboard)
$("#product-detail__share-btn i").click(function () {
    const msg = $("#product-detail__share-btn .notification-message")
    // Hiển thị message
    msg.removeClass("d-none")
    msg.addClass("d-block")
    navigator.clipboard.writeText(window.location.href) //Viết url hiện tại vào clipboard
    setTimeout(() => {  // Ẩn message
        msg.removeClass("d-block")
        msg.addClass("d-none")
    }, 1000)
})

//Nút thêm vào danh sách yêu thích
$("#product-detail__loved-btn i").click(function () {
    const msg = $("#product-detail__loved-btn .notification-message")
    let productId = new URL(window.location.href).searchParams.get('id')
    //Thay đổi trạng thái icon và nội dung message
    if ($("#product-detail__loved-btn i").hasClass("fa-regular")) {
        $("#product-detail__loved-btn i").removeClass("fa-regular")
        $("#product-detail__loved-btn i").addClass("fa-solid")
        msg.text("Đã thêm vào mục Yêu thích")
        $.ajax({
            url: "/add-to-wishlist",
            type: "POST",
            data: {
                "productId": productId
            },
            success: function () {
                console.log("Da them")
            },
            error: function () {

            }
        })
        // $(this).removeClass("fa-regular")
        // $(this).addClass("fa-solid")
        // msg.text("Đã thêm vào mục Yêu thích")
    }
    else if ($("#product-detail__loved-btn i").hasClass("fa-solid")){
        $("#product-detail__loved-btn i").removeClass("fa-solid")
        $("#product-detail__loved-btn i").addClass("fa-regular")
        msg.text("Đã gỡ khỏi mục Yêu thích")
        $.ajax({
            url:"/remove-from-wishlist",
            type: "POST",
            data: {
                "productId": productId
            },
            success: function () {
            },
            error: function () {

            }
        })
    }

    // Hiển thị message
    msg.removeClass("d-none")
    msg.addClass("d-block")
    setTimeout(() => { // Ẩn message
        msg.removeClass("d-block")
        msg.addClass("d-none")
    }, 1000)
})

// Tăng số lươợng sản phẩm mua
$("#product-detail__add-amount").click(function () {
    const amountElement = $("#product-detail__amount")
    let value = parseInt(amountElement.prop("innerText"))
    value++
    //Số lượng sản phẩm mua không vượt quá MAX_VALUE
    if (value === MAX_VALUE) {
        $(this).attr("disabled", true);
    }
    //Gỡ disable cho nút giảm
    $("#product-detail__remove-amount").attr("disabled", false);
    amountElement.text(value + "")
})

// Giảm số lươợng sản phẩm mua
$("#product-detail__remove-amount").click(function () {
    const amountElement = $("#product-detail__amount")
    let value = parseInt(amountElement.prop("innerText"))
    value--
    //Số lượng sản phẩm mua không ít hơn MIN_VALUE
    if (value === MIN_VALUE) {
        $(this).attr("disabled", true);
    }
    //Gỡ disable cho nút tăng
    $("#product-detail__add-amount").attr("disabled", false);
    amountElement.text(value + "")
})

// Click vào số sao ở mục đánh giá để bình luận số sao
$("#product-review__star .product-info__star-container").click(function () {
    const maskElement = $("#product-review__star .product-info__star-mask") //Lấy list mask cucomment
    const currentElement = $(this).index()  //Lấy số sao muốn đánh giá
    //Xử lý trường hợp click lại số sao vừa đánh giá để clear số sao đánh giá
    if (maskElement.eq(currentElement).css("width") === "0px" && (maskElement.eq(currentElement + 1).css("width") === $(this).css("width") || currentElement === maskElement.length - 1)) {
        maskElement.css("width", "100%");
        currentRating = 0
    } else {
        //Tắt mask từ cho số sao cần hiển thị
        currentRating = currentElement + 1
        for (let i = 0; i <= currentElement; i++) {
            maskElement.eq(i).css("width", "0");
        }
        //Bật mask cho số sao còn lại
        for (let i = currentElement + 1; i < maskElement.length; i++) {
            maskElement.eq(i).css("width", "100%");
        }
    }
})

$("#send-comment").click(function (e) {
    e.preventDefault()
    if ($("#product-review--comment").val() === "" && currentRating === 0) {
        //Thông báo nhập chưa đủ nội dung
    } else {
        $.ajax({
            url: '/upload-review',
            type: 'POST',
            data: {
                // account: $("#session-account").val(), //Cần một trường input:hidden để chứa trên jsp
                productId: new URL(window.location.href).searchParams.get('id'),
                rating: currentRating,
                content: $("#product-review--comment").val()
            },
            success: (response) => {
                $("#post-review-result").removeClass("d-none")
                response = $.parseJSON(response)
                console.log(response)
                if (response.result) {
                    const currentRating = response.currentAvgRating
                    $("#post-review-result").text("Đã gửi bình luận của bạn thành công")
                    $("#current-star-rating").text(`${currentRating.toFixed(1)}`)
                    $(".current-review").text(parseInt($(".current-review").text()) + 1 + " bình luận")
                    $("#review-upload-spinner").removeClass("d-none")
                    setTimeout(() => {
                        $("#review-upload-spinner").addClass("d-none")
                    }, 1000)
                    $("#comment-container").append(createReviewElement(response.reviewData))
                } else {
                    //Thông báo thất bại
                    $("#post-review-result").text("Không gửi bình luận được. Xin hãy gửi lại")
                }
            },
            error: (response) => {
                //Thông báo lỗi server
            }
        })
    }
})

let reviewAmount = 3
let currentReviewOffset = 0
let reviewLimit

function getReviewList(amount) {
    if (currentReviewOffset !== -1) {
        $.ajax({
            url: '/get-product-review',
            type: 'GET',
            data: {
                id: new URL(window.location.href).searchParams.get('id'),
                offset: currentReviewOffset,
                amount: amount,
                limit: reviewLimit
            },
            success: (response) => {
                response = $.parseJSON(response)
                //Hiển thị bình luận
                if (response.result) {
                    reviewLimit = response.limit ? response.limit : reviewLimit
                    // setTimeout(() => {
                    $("#review-upload-spinner").addClass("d-none")
                    for (let review of response.reviewData) {
                        $("#comment-container").append(createReviewElement(review))
                    }
                    // }, 1000)
                    currentReviewOffset = response.currentOffset
                } else offset = -1
                if (currentReviewOffset >= reviewLimit || currentReviewOffset === -1 || response.limit === response.currentOffset) {
                    // $("#comment-container").append(`<p class="d-flex justify-content-center row text-center">Đã tải hết bình luận</p>`)
                    $("#load-more-review").attr("disabled", true)
                    $("#load-more-review").addClass("d-none")
                }

                if (response.limit === 0) {
                    $("#comment-container").append(`<p class="d-flex justify-content-center row text-center">Sản phẩm chưa có bình luận</p>`)
                }
            },
            error: (response) => {
                $("#comment-container").append(`<p class="d-flex justify-content-center row text-center">Có lỗi khi tải bình luận của bạn</p>`)
            }
        })
    }
}

function createReviewElement(review) {
    const date = new Date(review.reviewTime)
    const formattedDate = new Intl.DateTimeFormat('en-GB').format(date)

    return `
        <div class="row product-review__comment-component mt-4_5">
            <div class="col-3 text-center">
                <h5>${review.username}</h5>
                <p>${formattedDate}</p>
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col d-flex justify-content-center comment-rating">
                        ${createReviewStar(review.rating)}
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
            <div class="col-8">
                <p class="" style="white-space: pre-line">
                    ${review.content}
                </p>
            </div>
        </div>
        `
}

function createReviewStar(rating) {
    rating = Math.trunc(rating) //Lấy phần nguyên nếu như rating có dạng x.0
    if (rating > 5) return
    const filledStar = `
    <div class="col-2 product-info__star-container   px-0">
         <i class="fa-solid fa-star product-info__star" style="color: var(--big-text-color);"></i>
         <div class="product-info__star-mask" ></div>
         <i class="fa-regular fa-star product-info__star-outline" style="color: var(--big-text-color);"></i>
    </div>
    `
    const unfilledStar = `
     <div class="col-2 product-info__star-container   px-0">
         <i class="fa-solid fa-star product-info__star" style="color: var(--big-text-color);"></i>
         <div class="product-info__star-mask" style="width: 100%"></div>
         <i class="fa-regular fa-star product-info__star-outline" style="color: var(--big-text-color);"></i>
    </div>
    `

    let result = ""
    for (let i = 0; i < rating; i++) {
        result += filledStar
    }
    for (let i = rating; i < 5; i++) {
        result += unfilledStar
    }
    return result
}


$("#load-more-review").click(function () {
    if (currentReviewOffset !== -1) getReviewList(reviewAmount)
})


//Ajax cho phần chuyển đổi thông tin sản phẩm
const urlParams = new URLSearchParams(window.location.search);
let currentWidth = urlParams.get("width")
let currentHeight = urlParams.get("height")
let currentPrice = 0.0
let currentDiscountValue

function getPrice(width, height) {
    const productId = urlParams.get("id")
    $.ajax({
        url: '/get-product-price',
        method: 'GET',
        data: {
            width: width,
            height: height,
            id: productId,
            discountValue: currentDiscountValue
        },
        success: function (response) {
            response = $.parseJSON(response)
            if (response.result) {
                //Nếu như giá đổi thì thay url
                if (currentWidth !== response.width && currentHeight !== response.height) {
                    const url = new URL(window.location.href)
                    url.searchParams.set("width", response.width)
                    url.searchParams.set("height", response.height)
                    window.history.pushState({}, '', url)
                }
                $("#product-detail__available--value").text(response.available) //Số lượng tồn kho
                $("#product-details__price").text(response.price)   //Giá tiền
                $("#current-size-notice").html(`<p>Kích thước hiện tại bạn đang chọn là: <span class="h5">${response.width}x${response.height} cm</span></p>`)  //Thông tin kích thước
                //Cập nhật các thông tin lên js
                currentPrice = response.price
                currentWidth = response.width
                currentHeight = response.height
                //Hiển thị thông tin giảm giá
                if (currentDiscountValue == null) currentDiscountValue = response.discountValue
                if (currentDiscountValue !== 0 && response.discountedPrice !== null) {
                    $("#product-details__old-price").removeClass("d-none")
                    $("#product-details__old-price s").text(response.price)
                    $("#product-details__price").text(response.discountedPrice)
                    $("#product-details__old-price span").text((currentDiscountValue * 100).toFixed(0) + " %")
                }
                $("#product-detail").data("width", currentWidth)
                $("#product-detail").data("height", currentHeight)
            }
        },
    })
}


$(".switch-size-btn").click(function () {
    let inputWidth = $(this).data("width")
    let inputHeight = $(this).data("height")
    getPrice(inputWidth, inputHeight)
})

getReviewList(reviewAmount)
getPrice(currentWidth, currentHeight)

function closeError() {
    $("#popup-overlay").css("display", "none")
    $("#popup").css("display", "none")
    // document.getElementById("popup-overlay").style.display="none"
    // document.getElementById("popup").style.display="none"
}

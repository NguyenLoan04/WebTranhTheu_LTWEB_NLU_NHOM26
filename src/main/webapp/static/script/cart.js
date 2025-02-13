const formatter = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
});

//sum price for pay
// function calculateTotal() {
//     total_price = 0;
//     $(".product-checkbox").each(function () {
//         let amount = 0;
//         let priceEach = 0;
//         $(this).change(function () {
//             if ($(this).is(':checked')) {
//                 let cart_item = $(this).parents(".cart-item")
//                 const amountElement = cart_item.find(".product-detail__amount").prop("innerText")
//                 const priceEachElement = cart_item.find(".product-detail__price").prop("innerText")
//                 amount = parseInt(amountElement)
//                 priceEach = parseInt(priceEachElement.replace(/\D/g, ''), 10)
//                 console.log(amount)
//                 console.log(priceEach)
//                 total_price = total_price + (amount * priceEach);
//                 console.log(total_price)
//                 $("#total-price").text(formatter.format(total_price + ""))
//             } else {
//                 total_price = total_price - (amount * priceEach);
//                 console.log(total_price)
//                 $("#total-price").text(formatter.format(total_price + ""))
//             }
//         })
//     })
// }

// calculateTotal();


// $("#product-detail__price").each(function () {
//     const price = formatter.format($(this).prop("innerText"))
//     $(this).text(price + "")
// })

//Choose all
$("#checkAll").change(function () {
    if ($(this).is(':checked')) {
        $(".product-checkbox").prop('checked', true);
        updateTotalPrice()
    } else {
        $(".product-checkbox").prop('checked', false)
        updateTotalPrice()
    }
})
// $(".price-change").click(function (){
//     $(".select-area").addClass("d-none")
//     let priceSelected= $(this).parents(".price-selected")
//     priceSelected.children(".select-area").removeClass("d-none")
// })
// xóa sản phẩm khỏi giỏ hàng.
$(".bi-trash").click(function () {
    removeProduct($(this).parents(".cart-item"))
})


function showDetails(title, description, endedAt) {
    document.getElementById("discount-title").innerText = title;
    document.getElementById("discount-description").innerText = description;
    const date = new Date(endedAt.replace(" ", "T")); // Đổi " " thành "T" để tuân theo chuẩn ISO

// Bước 2: Lấy ngày, tháng, năm
    const day = String(date.getDate()).padStart(2, "0"); // Đảm bảo 2 chữ số (28)
    const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng (01) (lưu ý: getMonth() trả từ 0-11)
    const year = date.getFullYear(); // Năm (2025)

// Bước 3: Định dạng ngày-tháng-năm
    const formattedDate = `${day}-${month}-${year}`;
    document.getElementById("discount-expiredAt").innerText = "Ngày hết hạn: "+ formattedDate;
    document.getElementById("discount-detail-info").style.display = "block";
    document.getElementById("popup-overlay").style.display = "block";
}

function closeDetails() {
    document.getElementById("discount-detail-info").style.display = "none";
    document.getElementById("popup-overlay").style.display = "none";
}
function closeError(){
    document.getElementById("popup-overlay").style.display="none"
    document.getElementById("popup").style.display="none"
}

//Thay đổi lịch sử xem sản phẩm
$(".add-to-cart").click(function () {
    addToCart($(this).parents(".product-item"))
})

// xoa san pham
$('.delete-btn').click(function () {
    removeHistory($(this).parents(".product-item"))
})

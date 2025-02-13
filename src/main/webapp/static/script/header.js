// $(".product-item:not(#category-popup .product-item)").click(function(){
//     window.location = "../page/product.html"
// })
//
// $("#category-popup .product-item").click(function () {
//     window.location = "../page/category.html"
// })
//
// $(".header-popup__close-btn").click(function(){
//     $(this).parent().parent().addClass("d-none")
// })
// // $("#header-category").click(function(){
// //     $(".header-popup").addClass("d-none")
// //     $("#category-popup").removeClass("d-none");
// // })

$("#search-product-btn").on("keyup", function (e) {
    if (e.key === 'Enter' || e.keyCode === 13) {
        performSearchProduct($(this))
    }
})

$("#search-btn").click(function () {
    performSearchProduct($("#search-product-btn"))
})

function performSearchProduct(element) {
    if (element.val() !== "") {
        window.location = `/search?keyword=${element.val()}`
    }
}


// $("#header-category").click(function () {
//     $(".header-popup").addClass("d-none")
//     $("#category-popup").removeClass("d-none");
// })
//
// $("#header-favorite").click(function(){
//     $(".header-popup").addClass("d-none")
//     $("#favorite-popup").removeClass("d-none");
// })
//
// // $("#header-cart").click(function(){
// //     $(".header-popup").addClass("d-none")
// //     $("#cart-popup").removeClass("d-none");
// // })
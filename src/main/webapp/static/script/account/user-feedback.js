
function getReviewDetails(reviewId){
    $("#user-feedback-histories").addClass("d-none")
    $("#review_detail").removeClass("d-none")
    $.ajax({
        url:"/get-review-detail",
        type: "GET",
        data:{
            "reviewId": reviewId
        },
        success: function (data){
            $("#review_detail").html(data)
        },
        error: function (){
            alert("Không tìm được thông tin review")
        }
    })
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

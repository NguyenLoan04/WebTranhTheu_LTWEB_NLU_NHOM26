
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

// Xem từng mục đơn hàng
$(".order-item").click(function () {
    // $(".order-item").removeClass("on");
    // $(this).addClass("on");
    // //Get content each item
    // var orders = $(this).data('target');
    // $(".order-details").hide()
    // return $("#" + orders).show();
    let url = $(this).attr("data-url")
    $(".order-item").removeClass("on");
    $(this).addClass("on");
    $.ajax({
        url: url,
        type:"GET",
        success: function (data){
            $("#orderContent").html(data)
        },
        error:function (){
            alert("Không thể tải trang")
        }
    })

})


// Chi tiết hủy hàng
function getCancelForm(orderId){
    $("#user-ordered-list").addClass("d-none")
    $("#cancel-form").removeClass("d-none")
    $.ajax({
        url:"/user/get-cancel-form",
        type: "GET",
        data:{
            "orderId": orderId
        },
        success: function (data){
            $("#cancel-form").html(data)
        },
        error: function (){
            alert("Không tìm thấy order")
        }
    })
}

// Chi tiết đơn hàng
function getDetailsForm(orderId){
    $("#user-ordered-list").addClass("d-none")
    $("#order-detail").removeClass("d-none")
    $.ajax({
        url:"/user/get-order-detail",
        type:"GET",
        data:{
            "orderId": orderId
        },
        success: function (data){
            $("#order-detail").html(data)
        },
        error: function () {
            alert("Không tìm thấy chi tiết đơn hàng")
        }

    })
}

function updateOrderStatus(orderId,status){
    $.ajax({
        url:"/user/update-order-status",
        type:"POST",
        data:{
            "orderId": orderId,
            "status": status
        },
        success:function (){
            $("div#"+orderId).remove();
            let message=""
            if(status===5){
                message="Đã nhận đơn hàng"
            }
            if(status===6) {
                message="Đã gửi yêu cầu hoàn trả"
            }
            showMessageUpdate(message)
        },
        error: function (){
            alert("Lỗi")
        }
    })
}

function rebuyOrder(orderId){
    $.ajax({
        url:"/add-order-to-cart",
        type:"POST",
        data:{
            "orderId": orderId
        },
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
        error: function (){
            // alert("Lỗi khi thêm vào giỏ hàng")
        }
    })
}
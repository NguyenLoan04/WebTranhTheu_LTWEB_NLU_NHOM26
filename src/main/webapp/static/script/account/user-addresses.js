//Thêm địa chỉ mới
$(".add-new-address").click(function (event) {
    $(this).parents("#user-address").css("display", "none");
    // $("#formWrapper").removeClass("d-none")
    event.preventDefault();
    $.ajax({
        url: "user/user-addresses/get-add-address-form",
        type:"GET",
        success: function (data){
            $("#formWrapper").removeClass("d-none")
            $("#formWrapper").html(data);

            $(".cancel-add-address").click(function (){
                $("#formWrapper").addClass("d-none")
                $("#user-address").css("display","block")
            })
            $(".add-address").click(function (event){
                event.preventDefault();
                let newAddress= $(".change_address_input").val()
                console.log(newAddress)
                    $.ajax({
                        url: "user/user-addresses/add-address",
                        type: "POST",
                        data: {
                            "newAddress": newAddress
                        },
                        success: function (response) {
                            if (response.success) {
                                $(".change_address_input").val("")
                                $("#formWrapper").addClass("d-none")
                                $("#user-address").css("display", "block")
                                if(newAddress.trim()){
                                    $("#extended-addresses").append('<div class="row address ps-4">\n' +
                                        '                    <div class="card row">\n' +
                                        '                        <div class="card-body">\n' +
                                        '                            <h5 class="card-title">Địa chỉ</h5>\n' +
                                        '                            <p class="card-text">'+newAddress+'</p>\n' +
                                        '                            <button id="change-address" style="width: 50%">Sửa</button>\n' +
                                        '                        </div>\n' +
                                        '                    </div>\n' +
                                        '                    <div id="sub-change-address" class="row ms-1 my-2 d-none">\n' +
                                        '                        <input id="change-address-input" class="col-9 me-2" value="${address.location}">\n' +
                                        '                        <button id="confirm-change-address" class="col-2">Ok</button>\n' +
                                        '                    </div>\n' +
                                        '                </div>')
                                }
                            }
                            showMessageUpdate("Thêm địa chỉ thành công")
                        },
                        error: function () {

                        }
                    })
            })
        },
        error: function (){

        }
    })
})
$(".bi-trash").click(function (){
    console.log($(this).parents(".card-body").parents(".card").parents(".address"))
    removeUserAddress($(this).parents(".card-body").parents(".card").parents(".address"))
})
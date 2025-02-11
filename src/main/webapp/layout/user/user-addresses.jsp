<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
<%--    <title>Địa chỉ người dùng</title>--%>
<%--    <%@include file="../public/library.jsp" %>--%>
    <!-- css property -->
<%--    <link rel="stylesheet" href="../../static/style/user/account-page.css">--%>
    <link rel="stylesheet" href="../../static/style/user/style-forms/user-address.css">
</head>
<body>
<div id="user-address" class="content-details col" >
    <div class="h4 fw-semibold p-3">Sổ địa chỉ</div>
    <hr>
    <div class="container">
        <c:if test="${empty account.location}">
            <h4 class="fw-semibold">Chưa có địa chỉ</h4>
        </c:if>
        <div class="row">
            <div class="col-6">
                <div class="row address ps-4">
                    <div class="card row">
                        <div class="card-body">
                            <h5 class="fw-semibold card-title">Địa chỉ mặc định</h5>
                            <p class="card-text">${account.getDefaultLocation().location}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6" id="extended-addresses">
                <c:forEach var="address" items="${account.location}">
                <div id="address_${address.id}" class="row address ps-4" data-id="${address.id}">
                    <div class="card row">
                        <div class="card-body">
                            <h5 class="fw-semibold card-title">Địa chỉ</h5>
                            <p class="card-text">${address.location}</p>
                            <button id="change-address" style="width: 50%" onclick="showSubChange(${address.id})">Sửa</button>
                            <i class="bi bi-trash m-4"></i>
                        </div>
                    </div>
                    <div id="sub-change-address" class="row ms-1 my-2 d-none">
                        <input id="change-address-input" class="col-9 me-2" value="${address.location}">
                        <button id="confirm-change-address" class="col-2" onclick="updateAddress(${address.id})">Ok</button>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-7"></div>
        <div class="col-5">
            <button class="add-new-address" type="button" style="width: 90%">Thêm địa chỉ</button>
        </div>
    </div>
</div>
<div id="formWrapper" class="d-none"></div>
<%--<script src="static/script/header.js"></script>--%>
<script src="../../static/script/account/user-addresses.js"></script>
<script>
    function showSubChange(addressId){
        let element= $("div#address_"+ addressId)
        console.log(element)
        let changeField;
        let subChange= $("#sub-change-address")
        subChange.addClass("d-none")
        changeField= element.children("#sub-change-address")
        changeField.removeClass("d-none")
    }
    function updateAddress(addressId){
        let element= $("#address_"+ addressId)
        console.log(element)
        let changeFiled;
        let fixedAddress;
        let card_text;
        let id;
        changeFiled= element.children("#sub-change-address")
        card_text= element.children(".card").children(".card-body").children(".card-text")
        // console.log(element.children(".card").children(".card-body"))
        // console.log(card_text)
        id= element.attr("data-id")
        fixedAddress= changeFiled.children("#change-address-input").val()
        console.log(fixedAddress)
        $.ajax({
            url: "/user/user-addresses/update-address",
            type:"POST",
            data:{
                "addressId": id,
                "fixedAddress": fixedAddress
            },
            // dataType: "json",
            success: function (){
                card_text.prop("innerText",fixedAddress)
                changeFiled.addClass("d-none")
               showMessageUpdate("Cập nhật thành công")
            },
            error: function (){

            }
        })
        card_text.prop("innerText",fixedAddress)
        // console.log(card_text.val())
        // changeFiled.addClass("d-none")
    }
    function removeUserAddress(element){
        let addressId= element.attr("data-id")
        console.log(addressId)
        $.ajax({
            url: "user/user-addresses/remove-address",
            type:"POST",
            data:{
                "addressId": addressId
            },
            success: function (){
                element.remove()
                showMessageUpdate("Xóa thành công")
            },
            error: function (){

            }
        })
    }
</script>
</body>
</html>

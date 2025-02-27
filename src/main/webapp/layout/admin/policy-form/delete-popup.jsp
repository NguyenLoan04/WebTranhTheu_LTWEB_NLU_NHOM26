<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:46 PM
  To change this static use File | Settings | File statics.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa chính sách</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-delete-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- Modal xác nhận -->
    <form class="confirmModal" id="delete-policy-form">
        <div class="modal-content py-4">
            <h5 class="style-title"><i class="fa-solid fa-circle-question me-2"></i>Xóa chính sách</h5>
            <hr>
            <h6 class="style-text">Bạn chắc chắn muốn xóa <span class="style-name-element">${policy.getTitle()}</span>?</h6>
            <hr>
            <div class="text-end">
                <button type="button" class="btn-no d-inline" id="cancelBtn">Không</button>
                <button type="submit" class="btn-yes d-inline" id="confirmYes" value="${policy.getId()}">Có</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>

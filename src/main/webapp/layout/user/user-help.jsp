<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
    <%--    <title>Trợ giúp</title>--%>
    <%--  <%@include file="../public/library.jsp"%>--%>
    <%--  <!-- css property -->--%>
    <%--  <link rel="stylesheet" href="../../static/style/user/account-page.css">--%>
    <link rel="stylesheet" href="../../static/style/user/style-forms/user-setting.css">
</head>
<body>
<div id="user_support" class="  content-details col">
    <div class="h4 fw-semibold pt-3 ps-3">Hỗ trợ</div>
    <hr>
    <div class="container p-4">
        <div class="row pt-2 question border-bottom">
            <div class="row ">
                <div class="col-1"><i class="bi bi-question-circle"></i></div>
                <div class="col-11 ">Tại sao tôi không thể áp dụng khuyến mãi?</div>
            </div>
            <div class="row ps-5 pt-3 answer" style="display: none">
                Có thể do bạn đã nhập mã khuyến mãi sai hoặc mã đã hết hạn. Vui lòng kiểm tra lại mã khuyến mãi
                và thử lại.
            </div>
        </div>
    </div>
</div>
<%--<script src="static/script/header.js"></script>--%>
<script src="../../static/script/account/user-help.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin người dùng</title>
    <%@include file="../../public/library.jsp" %>
    <!-- css property -->
    <link rel="stylesheet" href="../../../static/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../static/style/admin/style-form/style-read-edit-user-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container" id="read-edit-user-form" enctype="multipart/form-data">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem người dùng</h2></div>
        </div>
        <!-- tên đăng nhập -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên đăng nhập</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập tên đăng nhập" name="username" value="<c:out value="${user.getUsername()}"/>" required disabled>
            </div>
        </div>
        <!-- mật khẩu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mật khẩu</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="password" id="password" class="w-100 style-input"
                                        placeholder="Nhập mật khẩu"
                                        name="password" disabled>
            </div>
        </div>
        <!-- họ và tên -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Họ và tên</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="name" placeholder="Nhập họ và tên"
                                        name="fullName" value="<c:out value="${user.getFullName()}"/>" required
                                        disabled>
            </div>
        </div>
        <!-- avatar -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ảnh đại diện</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <div class="img-container">
                    <img src="<c:out value="${user.getAvatarUrl()}"/>" id="sampleAvatarImage" class="d-none">
                    <img src="<c:out value="${user.getAvatarUrl()}"/>" id="avatarImage">
                </div>
            </div>
            <div class="col-1 d-none edit-hidden">
                <i class="fa-solid fa-pen-to-square icon-edit-avt" id="editAvatar"></i>
                <input type="file" accept="image/*" class="d-none" name="avatar" id="fileInput">
            </div>
        </div>
        <!-- email -->
        <div class="row">
            <div class="col"><span class="style-title">Email</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="email" class="w-100 style-input" id="email" placeholder="Nhập email"
                                        name="email" value="<c:out value="${user.getEmail()}"/>" disabled>
            </div>
        </div>
        <!-- sdt -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Số điện thoại</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="tel" class="w-100 style-input" id="phone" placeholder="Nhập số điện thoại"
                                        name="phone" value="<c:out value="${user.getPhone()}"/>" disabled>
            </div>
        </div>
        <!-- giới tính -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Giới tính</span></div>
        </div>
        <div class="row pt-2">
            <div class="col text-end">
                <label>Nam</label>
                <input type="radio" class="gender" name="gender" value="1" ${user.getGender() == 1 ? 'checked' : ''}
                       disabled>
            </div>
            <div class="col">
                <label>Nữ</label>
                <input type="radio" class="gender" name="gender" value="2" ${user.getGender() == 2 ? 'checked' : ''}
                       disabled>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" id="description" placeholder="Nhập mô tả người dùng"
                                           name="description" disabled><c:out
                    value="${user.getDescription()}"/> </textarea>
            </div>
        </div>

        <!-- địa chỉ -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Địa chỉ<i
                    class="fas fa-plus-circle ms-2 style-add-btn d-none edit-hidden" onclick="addAddress()"></i></span>
            </div>
        </div>
        <div class="row pt-2" id="addresses">
            <c:forEach items="${user.getLocation()}" var="a">
                <div class="row">
                    <div class="col p-0">
                        <input type="text" class="style-input w-100 mb-2" value="${a.getLocation()}" disabled>
                    </div>
                    <div class="col-1 text-end d-none edit-hidden">
                        <input type="checkbox" class="style-checkbox" name="delete-location" value="${a.getId()}">
                        <label style="font-size: 14px">Xóa</label>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- ds sản phẩm yêu thích -->
<%--        <div class="row pt-2">--%>
<%--            <div class="col"><span class="style-title" id="titleFavourProduct">Danh sách sản phẩm yêu thích</span></div>--%>
<%--        </div>--%>
<%--        <div class="row pt-2">--%>
<%--            <div class="col p-0">--%>
<%--                <select class="style-select-many" name="delete-wish-product" id="favourProduct" multiple disabled>--%>
<%--                    <c:forEach items="${user.getWishProducts()}" var="wp">--%>
<%--                        <option value="${wp.getProduct().getId()}">${wp.getProduct().getCode()}--%>
<%--                            - ${wp.getProduct().getTitle()} - <fmt:formatDate value="${wp.getCreatedAt()}"--%>
<%--                                                                              pattern="dd/MM/yyyy"/></option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- thêm sản phẩm yêu thích -->
<%--        <div class="row pt-2 d-none edit-hidden">--%>
<%--            <div class="col"><span class="style-title">Thêm sản phẩm yêu thích <i--%>
<%--                    class="fas fa-plus-circle ms-2 style-add-btn d-none edit-hidden" onclick="addWishProducts()"></i></span></div>--%>
<%--        </div>--%>
<%--        <div class="row pt-2 d-none edit-hidden" id="addWishProducts">--%>
<%--            <div class="row d-none" id="sampleAddWishProduct">--%>
<%--                <div class="col">--%>
<%--                    <select class="style-select" name="add-wish-product">--%>
<%--                        <c:forEach items="${listProducts}" var="p">--%>
<%--                            <option value="${p.getId()}">${p.getCode()} - ${p.getTitle()}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="col-1">--%>
<%--                    <i class="fa-solid fa-trash icon-del"></i>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" name="status-account" id="status" required disabled>
                    <option value="2" ${user.getStatusAccount() == 2 ? 'selected' : ''}>Đang hoạt động</option>
                    <option value="0" ${user.getStatusAccount() == 0 ? 'selected' : ''}>Vô hiệu hóa</option>
                    <option value="1" ${user.getStatusAccount() == 1 ? 'selected' : ''}>Chưa xác thực</option>
                </select>
            </div>
        </div>
        <!-- phân quyền -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Phân quyền</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="role" name="role" disabled required>
                    <option value="0" ${user.getRole() == 0 ? 'selected' : ''}>Người dùng bình thường</option>
                    <option value="1" ${user.getRole() == 1 ? 'selected' : ''}>Admin</option>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo tài khoản</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${createAt}" required disabled>
            </div>
        </div>
        <!-- ngày cập nhật -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật tài khoản</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="${updateAt}" disabled></div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col read">
                <button type="button" id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col read">
                <button type="button" class="style-button" id="editBtn">Chỉnh sửa</button>
            </div>
            <div class="col d-none edit-hidden">
                <button type="button" id="cancelEditBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col d-none edit-hidden">
                <button class="style-update-btn" name="userId" value="<c:out value="${user.getId()}"/>" type="submit"
                        id="submitBtn">Cập nhật
                </button>
            </div>
        </div>
    </form>
</div>

<script src="../../../static/script/admin/user-form/read-edit-user-form.js"></script>
</body>
</html>

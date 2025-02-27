package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.CloudinaryConfig;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.PasswordEncryption;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "UpdateInfoAdminController", value = "/admin/update-info-admin")
@MultipartConfig
public class UpdateInfoAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part avatar = request.getPart("avatar");
        String password = request.getParameter("password") == null || request.getParameter("password").isEmpty() ? null : PasswordEncryption.hashPassword(request.getParameter("password"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int gender = request.getParameter("gender") == null ? 0 : Integer.parseInt(request.getParameter("gender"));
        User user = new User(null, null, fullName, password, email, phone, gender, null, 2, null, new Timestamp(System.currentTimeMillis()), 1);

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("accountId");
        user.setId(userId);
        UserService userService = new UserService();
        if(avatar.getSize() > 0) {
            String avatarUrl = CloudinaryConfig.getUrl(avatar);
            userService.updateAvatar(userId, avatarUrl);
        }
        userService.updateInfoAdmin(user);
        session.setAttribute("account", userService.getUserById(userId));
    }
}
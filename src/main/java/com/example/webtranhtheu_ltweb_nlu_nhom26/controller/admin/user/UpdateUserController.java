package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin.user;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.CloudinaryConfig;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.PasswordEncryption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "UpdateUserController", value = "/admin/user-management/update-user")
@MultipartConfig
public class UpdateUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password") == null || request.getParameter("password").isEmpty() ? null : PasswordEncryption.hashPassword(request.getParameter("password"));

        Part avatar = request.getPart("avatar");

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int gender = request.getParameter("gender") == null ? 0 : Integer.parseInt(request.getParameter("gender"));
        String description = request.getParameter("description");
        String[] location = request.getParameterValues("location") == null ? new String[0] : request.getParameterValues("location");

        String[] deleteLocation = request.getParameterValues("delete-location") == null ? new String[0] : request.getParameterValues("delete-location");

        //String[] deleteWishProduct =request.getParameterValues("delete-wish-product") == null ? new String[0] : request.getParameterValues("delete-wish-product");

        //String[] addWishProduct = request.getParameterValues("add-wish-product") == null ? new String[0] : request.getParameterValues("add-wish-product");
//        if(addWishProduct.length > 0){
//            String[] realWishProduct = new String[addWishProduct.length - 1];
//            for (int i = 1; i < addWishProduct.length; i++) {
//                realWishProduct[i-1] = addWishProduct[i];
//            }
//            addWishProduct = realWishProduct;
//        }

        int statusAccount = Integer.parseInt(request.getParameter("status-account"));
        String userId = request.getParameter("userId");

        String role = request.getParameter("role");

        User user = new User(null, null, fullName, password, email, phone, gender, description, statusAccount, null, new Timestamp(System.currentTimeMillis()), Integer.parseInt(role));
        user.setId(Integer.parseInt(userId));

        UserService userService = new UserService();
        if (avatar.getSize() > 0) {
            String avatarUrl = CloudinaryConfig.getUrl(avatar);
            userService.updateAvatar(Integer.parseInt(userId), avatarUrl);
        }
        userService.updateUser(user, location, deleteLocation);
    }
}
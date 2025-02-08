package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.auth;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.AuthDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Discount;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.AuthService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.DiscountService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.sql.Timestamp;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "GoogleLoginController", value = "/google-login")
public class GoogleLoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String image = request.getParameter("image");
        AuthService authService = new AuthService();
        Integer accountId = authService.getIdByEmail(email);
        response.setContentType("application/json");
        if (accountId == null) {
            User user = new User(name, email, image, 2, new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()), 0);
            authService.addUser(user);
            accountId = authService.getIdByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("accountId", accountId);
            response.getWriter().write("{\"success\": true}");
        } else {
            if (authService.getStatusById(accountId) == 2) {
                HttpSession session = request.getSession();
                session.setAttribute("accountId", accountId);
                //Thêm thông tin cho tài khoản
                User account = new UserService().getUserById(new AuthDTO().getId());
                if(account != null){
                    session.setAttribute("account", account);
                }
                //Thêm thông tin cho cart
                Cart cart= Cart.getInstance();
                session.setAttribute("cart", cart);
                List<Discount> discountsAvailable = new DiscountService().getListDiscountAvailable();
                discountsAvailable.sort(Comparator.comparingDouble(Discount::getValue).reversed());
                cart.setDiscountList(discountsAvailable);
                response.getWriter().write("{\"success\": true}");
            } else {
                response.getWriter().write("{\"success\": false}");
            }
        }
    }
}
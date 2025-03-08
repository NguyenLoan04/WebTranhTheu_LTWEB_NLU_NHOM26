package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.wishlist;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.WishProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RemoveWishlistController", value = "/remove-from-wishlist")
public class RemoveWishlistController extends HttpServlet {
    public UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        User account = (User) session.getAttribute("account");
        String productId = request.getParameter("productId");
        System.out.println(productId);
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            List<WishProduct> wishProductList =  account.getWishProducts();
//            if (wishProductList == null) {
////                wishProductList =new ArrayList<>();
//            }
            account.setWishProducts(wishProductList);
            boolean deleted = userService.deleteWishProduct(account.getId(),Integer.parseInt(productId));
            if (deleted) {
                WishProduct wishProduct= account.getWishProductById(Integer.parseInt(productId));
                wishProductList.remove(wishProduct);
                account.setWishProducts(wishProductList);
                System.out.println(wishProductList);
                session.setAttribute("account", account);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }
}
package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.wishlist;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.WishProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.util.ControllerUtil;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddAllWishController", value = "/user/wishlist/add-all-to-cart")
public class AddAllWishController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        List<WishProduct> wishProductList = account.getWishProducts();
        JsonObject jsonResult = new JsonObject();
        if (account == null) {
            response.sendRedirect("/");
        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = Cart.getInstance();
            }
            for (WishProduct wishProduct : wishProductList) {
                cart.addProduct(wishProduct.getProduct(), wishProduct.getProduct().getMinPrice(), 1);
            }
            session.setAttribute("cart", cart);
            jsonResult.addProperty("currentCartLength", cart.getCartSize());
            ControllerUtil.sendAjaxResultSuccess(response, jsonResult, null);
        }
    }
}
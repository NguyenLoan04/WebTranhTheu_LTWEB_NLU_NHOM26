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

@WebServlet(name = "WishListAddController", value = "/add-to-wishlist")
public class WishListAddController extends HttpServlet {
    public ProductService productService = new ProductService();
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
        Object account = session.getAttribute("account");
        String productId = request.getParameter("productId");
//        List<WishProduct> wishlist = (List<WishProduct>) session.getAttribute("wishlist");
//        System.out.println(productId);
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            Product product = productService.getProduct(Integer.parseInt(productId));
            product.setListPrices(productService.getProductPrices(Integer.parseInt(productId)));
//            if (wishlist == null) {
//                wishlist = userService.getWishProducts((Integer) accountId);
//            }
//            System.out.println(wishlist);
//            boolean inserted = userService.insertWishProduct((Integer) accountId, Integer.parseInt(productId));
//            if (inserted) {
//                wishlist.add(new WishProduct(product, new Timestamp(System.currentTimeMillis())));
//                session.setAttribute("wishlist", wishlist);
//                request.getRequestDispatcher("/layout/product.jsp").forward(request, response);
//            } else {
//                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            }

        }
    }
}
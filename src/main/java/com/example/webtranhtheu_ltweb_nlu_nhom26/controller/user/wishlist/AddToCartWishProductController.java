package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.wishlist;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Price;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.WishProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
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

@WebServlet(name = "AddToCartWishProductController", value = "/user/wishlist/add-to-cart")
public class AddToCartWishProductController extends HttpServlet {
    public ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String productId = request.getParameter("id");
        String widthParam = request.getParameter("width");
        String heightParam = request.getParameter("height");
        User account = (User) session.getAttribute("account");
        JsonObject jsonResult = new JsonObject();
        if (account == null) {
            response.sendRedirect("/login");
        } else {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = Cart.getInstance();
            }
            try {
                int id = Integer.parseInt(productId);
                WishProduct wishProduct= account.getWishProductById(id);
                Product product = wishProduct.getProduct();
                product.setListPrices(productService.getProductPrices(product.getId()));
                product.setListImageUrls(productService.getListImageUrls(product.getId()));
                if (product == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                Price selectedPrice = null;

                int width = Integer.parseInt(widthParam);
                int height = Integer.parseInt(heightParam);
                selectedPrice = product.getSelectedPrice(width, height);

                //
                if (selectedPrice == null) {
//                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//                    response.getWriter().println("Vui lòng chọn kích thước!");
//                    response.getWriter().flush();
                    // Xử lý
                } else {
                    cart.addProduct(product, selectedPrice, quantity);
                    session.setAttribute("cart", cart);
                    jsonResult.addProperty("currentCartLength", cart.getCartSize());
                    ControllerUtil.sendAjaxResultSuccess(response, jsonResult, null);
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }

        }
    }
}
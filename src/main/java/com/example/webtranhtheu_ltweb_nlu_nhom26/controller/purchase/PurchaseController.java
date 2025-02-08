package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.purchase;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.CartProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.CategoryService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "PurchaseController", value = "/purchase")
public class PurchaseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(); //Kiểm tra session
        try {
            if (session.getAttribute("accountId") == null || session.getAttribute("account") == null) {
                response.sendRedirect("/login"); //Cần phải đăng nhập
            } else {
                int userId = (int) session.getAttribute("accountId");
                if (session.getAttribute("listCategory") == null) {
                    session.setAttribute("listCategory", CategoryService.getNameAndPatternCategory());
                }
//                int addressId = 0;
                User account = (User) session.getAttribute("account");
                int addressId = account.getDefaultLocation().getId();

                //Nếu session không có thông tin liên quan đến địa chỉ người dùng
//                if (session.getAttribute("selectedAddressId") == null) {
//                    session.setAttribute("selectedAddressId", 0);
//                } else addressId = (int) session.getAttribute("selectedAddressId");

                //Xử lý thông tin
                Cart sessionCart = (Cart) session.getAttribute("cart");
                Map<String, CartProduct> listSelectedProductCode = new HashMap<>();

                if (session.getAttribute("selectedProducts") != null) {
                    Map<?, ?> tempMap = (Map<?, ?>) session.getAttribute("selectedProducts");
                    if (tempMap.keySet().stream().allMatch(k -> k instanceof String) &&
                            tempMap.values().stream().allMatch(v -> v instanceof CartProduct)) {
                        listSelectedProductCode = (Map<String, CartProduct>) tempMap;

                    }
                }

                User userInfo = new UserService().getUserById(userId);
                List<String> listCartCode = listSelectedProductCode.keySet().stream().toList();
                int deliveryPrice = 130000;
                double totalPrice = sessionCart.getTotalPrice(listCartCode);
                double finalPrice = sessionCart.getFinalPrice(listCartCode, deliveryPrice);

                request.setAttribute("userInfo", new UserService().getUserById(userId));
                request.setAttribute("address", new UserService().getLocationById(userId, addressId));
                request.setAttribute("addressId", addressId);
                request.setAttribute("listPurchased", listSelectedProductCode.values());
                request.setAttribute("userInfo", userInfo);
                request.setAttribute("totalPrice", ProductService.getDisplayPriceToString(totalPrice));
                request.setAttribute("finalPrice", ProductService.getDisplayPriceToString(finalPrice));
                request.setAttribute("discount",  sessionCart.getAllDiscountInCart(listCartCode));
                request.setAttribute("discountValue", ProductService.getDisplayPriceToString(totalPrice - finalPrice + deliveryPrice));

                request.getRequestDispatcher("layout/purchase.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); //Ném trang 404
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
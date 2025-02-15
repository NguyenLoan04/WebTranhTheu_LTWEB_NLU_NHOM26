package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.order;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.Order;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.OrderProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.OrderService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WaitlistOrderController", value = "/waitlist-orders")
public class WaitlistOrderController extends HttpServlet {
    public ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        List<Order> waitlist= OrderService.getListOrderByUserAndStatus(account.getId(),1);
        waitlist.forEach(order -> {
            List<OrderProduct> orderProducts= OrderService.getListOrderProductByOrderId(order.getId());
            orderProducts.forEach(orderProduct -> {
                Product product = productService.getProduct(orderProduct.getId());
                product.setListImageUrls(productService.getListImageUrls(product.getId()));
                orderProduct.setThumbnail(product.getThumbnail());
            });
            order.setProducts(orderProducts);
        });
        request.setAttribute("listProduct",waitlist);
        request.getRequestDispatcher("/layout/user/orders/waitlist-orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
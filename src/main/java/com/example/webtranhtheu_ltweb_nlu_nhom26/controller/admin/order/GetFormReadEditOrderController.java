package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin.order;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.Order;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.OrderService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@WebServlet(name = "GetFormReadEditOrderController", value = "/admin/order-management/read-edit-order-form")
public class GetFormReadEditOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String orderId = request.getParameter("orderId");
        Order order = OrderService.getOrderById(Integer.parseInt(orderId));
        request.setAttribute("order", order);
        request.setAttribute("userOrder", OrderService.getUserByOrderId(order.getId()));
        Timestamp timestamp = order.getCreatedAt();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(timestamp); // Chuyển đổi sang định dạng yyyy-MM-dd
        request.setAttribute("createAt", formattedDate);

        Timestamp timestampDeliver = order.getDeliveredAt();
        String formattedDeliverDate = timestampDeliver==null?"":dateFormat.format(timestampDeliver);
        request.setAttribute("deliveredAt", formattedDeliverDate);
        request.getRequestDispatcher("/layout/admin/order-form/read-edit-order-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
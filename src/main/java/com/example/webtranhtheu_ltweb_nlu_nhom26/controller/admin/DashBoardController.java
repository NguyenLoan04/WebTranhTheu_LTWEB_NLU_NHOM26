package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.OrderDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.enums.OrderStatus;
import com.example.webtranhtheu_ltweb_nlu_nhom26.enums.PaymentStatus;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.DashboardAdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashBoardController", value = "/admin/dashboard")
public class DashBoardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        DashboardAdminService dashboardAdminService = new DashboardAdminService();
        String totalRevenue = dashboardAdminService.getSumAllOrderPrice();
        int totalProduct = dashboardAdminService.getTotalProduct();
        int totalTopic = dashboardAdminService.getTotalTopic();
        int totalCategory = dashboardAdminService.getTotalCategory();
        int totalPolicy = dashboardAdminService.getTotalPolicy();
        int totalUser = dashboardAdminService.getTotalUser();
        int totalOrder = dashboardAdminService.getTotalOrder();

        Map<String, Integer> quantityOrderOnStatus = new HashMap<>();
        quantityOrderOnStatus.put("canceled", dashboardAdminService.getTotalOrderStatus(OrderStatus.CANCELED.getCode()));
        quantityOrderOnStatus.put("pendingConfirmation", dashboardAdminService.getTotalOrderStatus(OrderStatus.PENDING_CONFIRMATION.getCode()));
        quantityOrderOnStatus.put("waitingForPickup", dashboardAdminService.getTotalOrderStatus(OrderStatus.WAITING_FOR_PICKUP.getCode()));
        quantityOrderOnStatus.put("waitingForDelivery", dashboardAdminService.getTotalOrderStatus(OrderStatus.WAITING_FOR_DELIVERY.getCode()));
        quantityOrderOnStatus.put("delivered", dashboardAdminService.getTotalOrderStatus(OrderStatus.DELIVERED.getCode()));
        quantityOrderOnStatus.put("received", dashboardAdminService.getTotalOrderStatus(OrderStatus.RECEIVED.getCode()));
        quantityOrderOnStatus.put("returnRequested", dashboardAdminService.getTotalOrderStatus(OrderStatus.RETURN_REQUESTED.getCode()));
        quantityOrderOnStatus.put("deposited", dashboardAdminService.getTotalOrderStatus(OrderStatus.DEPOSITED.getCode()));

        quantityOrderOnStatus.put("paymentPaid", dashboardAdminService.getTotalOrderPayStatus(PaymentStatus.PAYMENT_PAID.getCode()));
        quantityOrderOnStatus.put("paymentUnpaid", dashboardAdminService.getTotalOrderPayStatus(PaymentStatus.PAYMENT_UNPAID.getCode()));

        List<OrderDTO> listOrder = dashboardAdminService.getLastListOrder();

        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalTopic", totalTopic);
        request.setAttribute("totalCategory", totalCategory);
        request.setAttribute("totalPolicy", totalPolicy);
        request.setAttribute("totalUser", totalUser);
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("quantityOrderOnStatus", quantityOrderOnStatus);
        request.setAttribute("listOrder", listOrder);

        request.getRequestDispatcher("/layout/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
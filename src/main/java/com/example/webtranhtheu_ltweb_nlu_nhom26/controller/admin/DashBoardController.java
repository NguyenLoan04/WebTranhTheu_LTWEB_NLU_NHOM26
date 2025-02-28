package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.OrderDTO;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.OrderStatus;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.PaymentStatus;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.DashboardAdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

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
        int totalOn0StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.CANCELED.getCode()); //Đã hủy
        int totalOn1StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.PENDING_CONFIRMATION.getCode()); //Chờ xác nhận
        int totalOn2StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.WAITING_FOR_PICKUP.getCode()); //Chờ lấy hàng
        int totalOn3StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.WAITING_FOR_DELIVERY.getCode()); //Chờ giao hàng
        int totalOn4StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.DELIVERED.getCode()); //Đã giao
        int totalOn5StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.RECEIVED.getCode()); //Đã nhận hàng
        int totalOn6StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.RETURN_REQUESTED.getCode()); //Đơn yêu cầu hoàn trả
        int totalOn7StatusOrder = dashboardAdminService.getTotalOrderStatus(OrderStatus.DEPOSITED.getCode()); //Đã cọc
        int totalOn1StatusPayment = dashboardAdminService.getTotalOrderPayStatus(PaymentStatus.PAYMENT_PAID.getCode()); //Đã thanh toán
        int totalOn0StatusPayment = dashboardAdminService.getTotalOrderPayStatus(PaymentStatus.PAYMENT_UNPAID.getCode()); //Chưa thanh toán

        List<OrderDTO> listOrder = dashboardAdminService.getLastListOrder();

        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalTopic", totalTopic);
        request.setAttribute("totalCategory", totalCategory);
        request.setAttribute("totalPolicy", totalPolicy);
        request.setAttribute("totalUser", totalUser);
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("totalOn0StatusOrder", totalOn0StatusOrder);
        request.setAttribute("totalOn1StatusOrder", totalOn1StatusOrder);
        request.setAttribute("totalOn2StatusOrder", totalOn2StatusOrder);
        request.setAttribute("totalOn3StatusOrder", totalOn3StatusOrder);
        request.setAttribute("totalOn4StatusOrder", totalOn4StatusOrder);
        request.setAttribute("totalOn5StatusOrder", totalOn5StatusOrder);
        request.setAttribute("totalOn6StatusOrder", totalOn6StatusOrder);
        request.setAttribute("totalOn7StatusOrder", totalOn7StatusOrder);
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("totalOn1StatusPayment", totalOn1StatusPayment);
        request.setAttribute("totalOn0StatusPayment", totalOn0StatusPayment);

        request.getRequestDispatcher("/layout/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
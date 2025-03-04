package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.home;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.CategoryService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.HomeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("") //Để index.jsp nhận attribute thì cần cấu hình @WebServlet như dòng này
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("listCategory") == null) {
            session.setAttribute("listCategory", CategoryService.getNameAndPatternCategory());
        }
        int defaultRowProduct = 5;
        HomeService service = new HomeService();
        List<Product> listHotProduct = service.getHotProduct(defaultRowProduct);
        List<Product> listMostRatedProduct = service.getMostRatedProduct();
        List<Product> listDiscountProduct = service.getCurrentProductsDiscount();
        List<Product> listNewestProduct = service.getNewestProduct(defaultRowProduct);
        request.setAttribute("hotProduct", listHotProduct);
        request.setAttribute("mostRatedProduct", listMostRatedProduct);
        request.setAttribute("discountProduct", listDiscountProduct);
        request.setAttribute("newestProduct", listNewestProduct);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}